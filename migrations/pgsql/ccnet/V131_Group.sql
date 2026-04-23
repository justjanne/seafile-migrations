alter table "Group" rename to "group";
alter table "group" alter column group_id type bigint;
alter table "group" alter column parent_group_id set default 0;
