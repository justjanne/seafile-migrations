import sys
import re

def normalize_create_table(sql):
    # Extract table name
    match = re.match(r'create table `?(\w+)`?\s*\((.*)\)', sql, re.DOTALL)
    if not match:
        return sql
    table_name = match.group(1)
    body = match.group(2)
    
    # Split by commas, but be careful with parentheses
    parts = []
    current = ""
    depth = 0
    for char in body:
        if char == '(': depth += 1
        elif char == ')': depth -= 1
        
        if char == ',' and depth == 0:
            parts.append(current.strip())
            current = ""
        else:
            current += char
    parts.append(current.strip())
    
    # Separate columns, primary keys, unique keys, and indices
    cols = []
    pk = []
    uq = []
    idx = []
    
    for p in parts:
        if p.startswith('primary key'): pk.append(p)
        elif p.startswith('unique key'): uq.append(p)
        elif p.startswith('key'): idx.append(p)
        else: cols.append(p)
        
    # Sort columns to handle ordering differences
    cols.sort()
    uq.sort()
    idx.sort()
    
    # Reconstruct
    normalized_body = ", ".join(cols + pk + uq + idx)
    return f"create table `{table_name}` ( {normalized_body} )"

def normalize_sql(text):
    # Remove comments
    text = re.sub(r'/\*.*?\*/', '', text, flags=re.DOTALL)
    text = re.sub(r'--.*', '', text)
    # Remove AUTO_INCREMENT
    text = re.sub(r'auto_increment=\d+', '', text, flags=re.IGNORECASE)
    # Remove character set / collate / engine info at the end of create table
    text = re.sub(r'\)\s*(engine|default charset|collate|charset).*?;', ');', text, flags=re.IGNORECASE | re.DOTALL)
    # Lowercase everything
    text = text.lower()
    # Normalize spaces
    text = re.sub(r'\s+', ' ', text)
    
    # Extract CREATE TABLE blocks - USE re.DOTALL
    tables = re.findall(r'create table .*?;', text, re.DOTALL)
    normalized_tables = [normalize_create_table(t.strip(';')) for t in tables]
    
    # Extract CREATE INDEX blocks (if any)
    indices = re.findall(r'create index .*?;', text, re.DOTALL)
    
    # Filter out databasechangelog tables
    final_objects = []
    for obj in normalized_tables + indices:
        if 'databasechangelog' not in obj:
            final_objects.append(obj)
            
    # Sort and return
    return "\n".join(sorted(final_objects))

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: normalize_sql.py <file>")
        sys.exit(1)
    with open(sys.argv[1], 'r') as f:
        print(normalize_sql(f.read()))
