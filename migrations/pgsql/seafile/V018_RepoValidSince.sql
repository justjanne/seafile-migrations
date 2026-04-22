create table if not exists repovalidsince
(
    repo_id char(36) not null,
    timestamp bigint,
    primary key (repo_id)
);
