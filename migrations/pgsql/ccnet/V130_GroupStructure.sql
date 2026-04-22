alter table groupstructure drop constraint groupstructure_pkey;
alter table groupstructure add column id bigserial primary key;
alter table groupstructure add unique (group_id);
drop index if exists structure_path_idx;
