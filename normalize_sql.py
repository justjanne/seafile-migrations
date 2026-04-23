import sys
import re

def normalize_sql(text):
    # Remove comments
    text = re.sub(r'/\*.*?\*/', '', text)
    text = re.sub(r'--.*', '', text)
    # Remove AUTO_INCREMENT
    text = re.sub(r'AUTO_INCREMENT=\d+', '', text)
    # Lowercase everything
    text = text.lower()
    # Normalize spaces
    text = re.sub(r'\s+', ' ', text)
    # Extract CREATE TABLE blocks
    tables = re.findall(r'create table .*?;', text)
    # Extract CREATE INDEX blocks (if any)
    indices = re.findall(r'create index .*?;', text)
    
    # Sort and return
    all_objects = sorted(tables + indices)
    return "\n".join(all_objects)

if __name__ == "__main__":
    with open(sys.argv[1], 'r') as f:
        print(normalize_sql(f.read()))
