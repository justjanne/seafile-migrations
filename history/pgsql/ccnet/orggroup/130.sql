create table if not exists orggroup
(
    id bigserial,
    org_id integer,
    group_id integer,
    primary key (id),
    unique (org_id, group_id)
);

create index if not exists idx_orggroup_group_id
    on orggroup (group_id);
