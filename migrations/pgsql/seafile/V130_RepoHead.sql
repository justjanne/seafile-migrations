alter table repohead drop constraint repohead_pkey;
alter table repohead add column id bigserial primary key;
alter table repohead add unique (repo_id);
alter table repohead alter column repo_id type char(37);
