alter table branch drop constraint branch_pkey;
alter table branch add column id bigserial primary key;
alter table branch add unique (repo_id, name);
alter table branch alter column repo_id type char(41);
alter table branch alter column commit_id type char(41);
