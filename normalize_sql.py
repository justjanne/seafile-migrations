import sys
import re

def normalize_create_table(sql):
    match = re.match(r'create table `?(\w+)`?\s*\((.*)\)', sql, re.DOTALL)
    if not match: return sql
    table_name = match.group(1)
    body = match.group(2)
    parts = []
    current = ""; depth = 0
    for char in body:
        if char == '(': depth += 1
        elif char == ')': depth -= 1
        if char == ',' and depth == 0:
            parts.append(current.strip()); current = ""
        else: current += char
    parts.append(current.strip())
    cols = []; pk = []; uq = []; idx = []
    for p in parts:
        if p.startswith('primary key'): pk.append(p)
        elif p.startswith('unique key'): uq.append(p)
        elif p.startswith('key'): idx.append(p)
        else: cols.append(p)
    cols.sort(); uq.sort(); idx.sort()
    normalized_body = ", ".join(cols + pk + uq + idx)
    return f"create table `{table_name}` ( {normalized_body} )"

def normalize_sql(text):
    text = re.sub(r'/\*.*?\*/', '', text, flags=re.DOTALL)
    text = re.sub(r'--.*', '', text)
    text = re.sub(r'auto_increment=\d+', '', text, flags=re.IGNORECASE)
    text = re.sub(r'\)\s*(engine|default charset|collate|charset).*?;', ');', text, flags=re.IGNORECASE | re.DOTALL)
    text = text.lower()
    text = re.sub(r'\s+', ' ', text)
    tables = re.findall(r'create table .*?;', text, re.DOTALL)
    normalized_tables = [normalize_create_table(t.strip(';')) for t in tables]
    indices = re.findall(r'create index .*?;', text, re.DOTALL)
    final_objects = []
    for obj in normalized_tables + indices:
        if 'databasechangelog' not in obj: final_objects.append(obj)
    return "\n".join(sorted(final_objects))

if __name__ == "__main__":
    with open(sys.argv[1], 'r') as f:
        print(normalize_sql(f.read()))
