create table if not exists reposize
(
    repo_id char(36) not null,
    size bigint,
    head_id char(40),
    primary key (repo_id)
);
