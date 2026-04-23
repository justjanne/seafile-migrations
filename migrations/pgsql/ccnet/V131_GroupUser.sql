alter table groupuser add column id bigserial primary key;
alter table groupuser alter column group_id type bigint;
alter index groupuser_username_idx rename to idx_groupuser_user_name;
