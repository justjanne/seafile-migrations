create table if not exists groupstructure
(
    group_id integer not null,
    path varchar(1024),
    primary key (group_id)
);

create index if not exists structure_path_idx on groupstructure (path);
