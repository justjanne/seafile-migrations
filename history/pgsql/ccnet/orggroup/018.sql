create table if not exists orggroup
(
    org_id integer,
    group_id integer,
    unique (org_id, group_id)
);

create index if not exists orggroup_groupid_idx
    on orggroup (group_id);
