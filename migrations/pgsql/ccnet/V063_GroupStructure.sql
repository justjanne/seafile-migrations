create table if not exists groupstructure
(
    group_id integer not null,
    path varchar(1024),
    primary key (group_id)
);

create index if not exists structure_path_idx on groupstructure (path);

alter table groupstructure drop constraint groupstructure_pkey;
alter table groupstructure add column id bigserial primary key;
alter table groupstructure add unique (group_id);
drop index if exists structure_path_idx;
