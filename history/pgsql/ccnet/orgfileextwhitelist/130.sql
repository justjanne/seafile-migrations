create table if not exists orgfileextwhitelist
(
    id bigserial,
    org_id integer,
    white_list text,
    primary key (id),
    unique (org_id)
);
