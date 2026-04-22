create table if not exists repohistorylimit
(
    repo_id char(36) not null,
    days integer,
    primary key (repo_id)
);
