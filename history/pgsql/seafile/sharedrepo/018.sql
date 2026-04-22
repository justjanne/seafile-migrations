create table if not exists sharedrepo
(
    repo_id char(36),
    from_email varchar(512),
    to_email varchar(512),
    permission varchar(15)
);

create index if not exists sharedrepo_repoid_idx
    on sharedrepo (repo_id);
