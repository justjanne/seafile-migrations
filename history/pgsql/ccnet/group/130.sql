create table if not exists "group"
(
    group_id bigserial,
    group_name varchar(255),
    creator_name varchar(255),
    timestamp bigint,
    type varchar(32),
    parent_group_id integer default 0,
    primary key (group_id)
);
