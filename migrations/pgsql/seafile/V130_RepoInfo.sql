alter table repoinfo drop constraint repoinfo_pkey;
alter table repoinfo add column id bigserial primary key;
alter table repoinfo add unique (repo_id);
alter table repoinfo add column type varchar(10);
create index if not exists idx_repoinfo_type on repoinfo (type);
