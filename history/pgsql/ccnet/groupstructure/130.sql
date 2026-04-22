create table if not exists groupstructure
(
    id bigserial,
    group_id integer,
    path varchar(1024),
    primary key (id),
    unique (group_id)
);
