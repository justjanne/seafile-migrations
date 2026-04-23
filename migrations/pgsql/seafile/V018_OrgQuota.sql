create table if not exists orgquota
(
    org_id integer not null,
    quota bigint,
    primary key (org_id)
);
