alter table garbagerepos drop constraint garbagerepos_pkey;
alter table garbagerepos add column id bigserial primary key;
alter table garbagerepos add unique (repo_id);
