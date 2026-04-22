create table if not exists webap
(
    repo_id char(36) not null,
    access_property varchar(10),
    primary key (repo_id)
);
