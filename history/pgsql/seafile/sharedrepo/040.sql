create table if not exists sharedrepo
(
    repo_id char(36),
    from_email varchar(255),
    to_email varchar(255),
    permission varchar(15)
);

create index if not exists sharedrepo_repoid_idx
    on sharedrepo (repo_id);

create index if not exists sharedrepo_from_email_idx
    on sharedrepo (from_email);

create index if not exists sharedrepo_to_email_idx
    on sharedrepo (to_email);
