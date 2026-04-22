create table if not exists repohead
(
    repo_id char(36) not null,
    branch_name varchar(10),
    primary key (repo_id)
);
