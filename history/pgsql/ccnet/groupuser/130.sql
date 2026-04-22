create table if not exists groupuser
(
    id bigserial,
    group_id bigint,
    user_name varchar(255),
    is_staff smallint,
    primary key (id),
    unique (group_id, user_name)
);

create index if not exists idx_groupuser_user_name
    on groupuser (user_name);
