create table if not exists "Group"
(
    group_id serial,
    group_name varchar(255),
    creator_name varchar(255),
    timestamp bigint,
    type varchar(32),
    primary key (group_id)
);
