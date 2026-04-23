alter table repofilecount drop constraint repofilecount_pkey;
alter table repofilecount add column id bigserial primary key;
alter table repofilecount add unique (repo_id);
