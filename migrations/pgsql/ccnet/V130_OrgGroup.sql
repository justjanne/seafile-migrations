alter table orggroup add column id bigserial primary key;
alter index orggroup_groupid_idx rename to idx_orggroup_group_id;
