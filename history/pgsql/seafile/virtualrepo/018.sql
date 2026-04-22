create table if not exists virtualrepo
(
    repo_id char(36) not null,
    origin_repo char(36),
    path text,
    base_commit char(40),
    primary key (repo_id)
);

create index if not exists virtualrepo_origin_repo_idx
    on virtualrepo (origin_repo);
