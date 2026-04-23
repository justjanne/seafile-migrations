create table if not exists repoinfo
(
    repo_id char(36) not null,
    name varchar(255) not null,
    update_time bigint,
    version integer,
    is_encrypted integer,
    last_modifier varchar(255),
    primary key (repo_id)
);
