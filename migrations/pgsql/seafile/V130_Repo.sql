alter table repo drop constraint repo_pkey;
alter table repo add column id bigserial primary key;
alter table repo add unique (repo_id);
alter table repo alter column repo_id type char(37);
