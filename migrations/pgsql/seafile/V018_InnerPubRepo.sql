create table if not exists innerpubrepo
(
    repo_id char(36) not null,
    permission varchar(15),
    primary key (repo_id)
);
