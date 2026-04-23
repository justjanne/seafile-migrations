create table if not exists branch
(
    name varchar(10) not null,
    repo_id char(40) not null,
    commit_id char(40),
    primary key (repo_id, name)
);
