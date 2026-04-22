create table if not exists repogroup
(
    repo_id char(36),
    group_id integer,
    user_name varchar(255),
    permission varchar(15),
    unique (group_id, repo_id)
);

create index if not exists repogroup_repoid_idx on repogroup (repo_id);
create index if not exists repogroup_username_idx on repogroup (user_name);
