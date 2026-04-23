alter table repoinfo drop constraint repoinfo_pkey;
alter table repoinfo add column id bigserial primary key;
alter table repoinfo add unique (repo_id);
