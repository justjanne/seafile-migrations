import yaml
import os
import re

def lowercase_recursive(obj):
    if isinstance(obj, dict):
        new_obj = {}
        for k, v in obj.items():
            if k in ['tableName', 'columnName', 'oldTableName', 'newTableName', 'indexName', 'baseTableName', 'referencedTableName', 'constraintName']:
                if isinstance(v, str): new_obj[k] = v.lower().strip("`\"' ")
                else: new_obj[k] = lowercase_recursive(v)
            elif k == 'columns' and isinstance(v, list): new_obj[k] = [lowercase_recursive(i) for i in v]
            elif k == 'column' and isinstance(v, dict): new_obj[k] = lowercase_recursive(v)
            elif k == 'name' and isinstance(v, str): new_obj[k] = v.lower().strip("`\"' ")
            elif k == 'constraints' and isinstance(v, dict): new_obj[k] = lowercase_recursive(v)
            else: new_obj[k] = lowercase_recursive(v)
        return new_obj
    elif isinstance(obj, list): return [lowercase_recursive(i) for i in obj]
    else: return obj

def parse_sql_to_changes(sql_text):
    changes = []
    sql_text = re.sub(r'\s+', ' ', sql_text).strip()
    m = re.match(r"CREATE\s+(?:UNIQUE\s+)?INDEX\s+[`\"']?([\w\-]+)[`\"']?\s+ON\s+[`\"']?([\w\-]+)[`\"']?\s*\((.*)\)", sql_text, re.IGNORECASE)
    if m:
        idx_name, tbl_name, cols_part = m.groups()
        cols = []
        for col_def in cols_part.split(','):
            col_parts = re.split(r'[`\"\'\s\(]', col_def.strip())
            col_name = [c for c in col_parts if c][0]
            cols.append({'column': {'name': col_name.lower().strip("`\"' ")}})
        changes.append({'createIndex': {'tableName': tbl_name.lower().strip("`\"' "), 'indexName': idx_name.lower().strip("`\"' "), 'columns': cols}})
        return changes
    m = re.match(r"DROP\s+INDEX\s+[`\"']?([\w\-]+)[`\"']?\s+ON\s+[`\"']?([\w\-]+)[`\"']?", sql_text, re.IGNORECASE)
    if m:
        idx_name, tbl_name = m.groups()
        changes.append({'dropIndex': {'tableName': tbl_name.lower().strip("`\"' "), 'indexName': idx_name.lower().strip("`\"' ")}})
        return changes
    return None

def process_file(file_path):
    with open(file_path, 'r') as f:
        try: data = yaml.safe_load(f)
        except yaml.YAMLError as exc: print(f"Error in {file_path}: {exc}"); return
    if not data or 'databaseChangeLog' not in data: return
    filename = os.path.basename(file_path); base_name = filename.replace('.yaml', '')
    raw_cs = [entry['changeSet'] for entry in data['databaseChangeLog'] if 'changeSet' in entry]
    
    standardized_cs = []
    for cs in raw_cs:
        if 'failOnError' in cs: del cs['failOnError']
        cs = lowercase_recursive(cs)
        if 'changes' in cs:
            new_changes = []
            for change in cs['changes']:
                if 'sql' in change:
                    parsed = parse_sql_to_changes(change['sql'].get('sql', ''))
                    if parsed: new_changes.extend(parsed)
                    else: new_changes.append(change)
                else: new_changes.append(change)
            cs['changes'] = new_changes
        standardized_cs.append(cs)

    filtered_cs = []
    for cs in standardized_cs:
        if 'changes' in cs and len(cs['changes']) == 1 and 'renameTable' in cs['changes'][0]:
            if cs['changes'][0]['renameTable']['oldTableName'] == cs['changes'][0]['renameTable']['newTableName']: continue
        is_duplicate = False
        for existing in filtered_cs:
            if existing['changes'] == cs['changes']: is_duplicate = True; break
        if not is_duplicate: filtered_cs.append(cs)

    for cs in filtered_cs:
        if 'changes' in cs:
            new_changes = []
            for ch in cs['changes']:
                if 'createIndex' in ch:
                    ci = ch['createIndex']; tname = ci['tableName']
                    if 'columns' in ci and len(ci['columns']) > 0:
                        col_name = ci['columns'][0]['column']['name']; target_idx_name = f"idx_{tname}_{col_name}"; legacy_name = ci['indexName']
                        if legacy_name != target_idx_name:
                            new_changes.append({'dropIndex': {'tableName': tname, 'indexName': legacy_name}})
                            ci['indexName'] = target_idx_name
                        elif col_name != target_idx_name:
                             new_changes.append({'dropIndex': {'tableName': tname, 'indexName': col_name}})
                new_changes.append(ch)
            
            # De-duplicate and fix order
            dedup_changes = []; seen_in_cs = []
            for ch in new_changes:
                if ch not in seen_in_cs:
                    # Don't drop something we just created or are about to create with the same name if it is the target name
                    if 'dropIndex' in ch:
                        dname = ch['dropIndex']['indexName']
                        # Skip if it matches a createIndex in the SAME changeset that uses this as target
                        already_created = any('createIndex' in prev and prev['createIndex']['indexName'] == dname for prev in seen_in_cs)
                        if already_created: continue
                    dedup_changes.append(ch); seen_in_cs.append(ch)
            cs['changes'] = dedup_changes

    final_cs_list = []; existing_ids = set()
    if filename.startswith('V013_'):
        tname_camel = base_name.replace('V013_', ''); tname_lower = tname_camel.lower()
        if tname_camel != tname_lower:
            final_cs_list.append({
                'id': f"normalize-{tname_lower}", 'author': 'seafile',
                'preConditions': [{'onFail': 'CONTINUE', 'tableExists': {'tableName': tname_camel}}],
                'changes': [{'renameTable': {'oldTableName': tname_camel, 'newTableName': tname_lower}}]
            })
            existing_ids.add(f"normalize-{tname_lower}")

    for cs in filtered_cs:
        if 'changes' in cs:
            main_action = None; target_table = target_column = target_index = old_table = None
            for ch in cs['changes']:
                if 'createTable' in ch: main_action = 'createTable'; target_table = ch['createTable']['tableName']
                elif 'addColumn' in ch:
                    main_action = 'addColumn'; target_table = ch['addColumn']['tableName']
                    if 'columns' in ch['addColumn']: target_column = ch['addColumn']['columns'][0]['column']['name']
                elif 'createIndex' in ch: main_action = 'createIndex'; target_table = ch['createIndex']['tableName']; target_index = ch['createIndex']['indexName']
                elif 'renameTable' in ch: main_action = 'renameTable'; old_table = ch['renameTable']['oldTableName']; target_table = ch['renameTable']['newTableName']
            if main_action:
                on_fail = 'MARK_RAN' if main_action == 'createTable' else 'CONTINUE'
                cond = None
                if main_action == 'createTable': cond = {'not': {'tableExists': {'tableName': target_table}}}
                elif main_action == 'addColumn': cond = {'not': {'columnExists': {'tableName': target_table, 'columnName': target_column}}}
                elif main_action == 'createIndex': cond = {'not': {'indexExists': {'tableName': target_table, 'indexName': target_index}}}
                elif main_action == 'renameTable': cond = {'tableExists': {'tableName': old_table}}
                if cond: cs['preConditions'] = [{'onFail': on_fail, **cond}]
        cid = cs['id']
        if cid in existing_ids or cid.startswith('normalize-'):
            if 'changes' in cs and len(cs['changes']) > 0:
                act = list(cs['changes'][-1].keys())[0]; t = ""
                if isinstance(cs['changes'][-1][act], dict): t = cs['changes'][-1][act].get('tableName', '')
                cid = f"{base_name}_{act}_{t}".strip('_').lower()
        counter = 1; orig_cid = cid
        while cid in existing_ids: cid = f"{orig_cid}_{counter}"; counter += 1
        cs['id'] = cid; existing_ids.add(cid); final_cs_list.append(cs)

    for cs in final_cs_list:
        if 'changes' in cs and len(cs['changes']) == 1 and 'dropIndex' in cs['changes'][0]:
            di = cs['changes'][0]['dropIndex']
            if 'preConditions' not in cs: cs['preConditions'] = [{'onFail': 'CONTINUE', 'indexExists': {'tableName': di['tableName'], 'indexName': di['indexName']}}]
    
    with open(file_path, 'w') as f: yaml.dump({'databaseChangeLog': [{'changeSet': cs} for cs in final_cs_list]}, f, sort_keys=False, default_flow_style=False)

def main():
    for d in ['liquibase/ccnet/migrations/', 'liquibase/seafile/migrations/']:
        for f in os.listdir(d):
            if f.endswith('.yaml'): process_file(os.path.join(d, f))

if __name__ == "__main__": main()
