alter table repoinfo add column type varchar(10);
create index if not exists idx_repoinfo_type on repoinfo (type);
