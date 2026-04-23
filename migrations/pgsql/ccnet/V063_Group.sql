alter table "Group" alter column group_id type bigint;
alter table "Group" add column parent_group_id integer default 0;
