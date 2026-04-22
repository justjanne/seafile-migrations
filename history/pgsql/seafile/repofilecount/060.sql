create table if not exists repofilecount
(
    repo_id char(36) not null,
    file_count bigint,
    primary key (repo_id)
);
