create table if not exists groupuser
(
    group_id integer,
    user_name varchar(255),
    is_staff smallint,
    unique (group_id, user_name)
);

create index if not exists groupuser_username_idx on groupuser (user_name);
