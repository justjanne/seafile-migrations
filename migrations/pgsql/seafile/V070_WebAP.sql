alter table webap drop constraint webap_pkey;
alter table webap add column id bigserial primary key;
alter table webap add unique (repo_id);
alter table webap alter column repo_id type char(37);
alter table webap alter column access_property type char(10);
