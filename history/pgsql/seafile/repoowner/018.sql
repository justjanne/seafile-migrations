create table if not exists repoowner
(
    repo_id char(36) not null,
    owner_id varchar(255),
    primary key (repo_id)
);

create index if not exists repoowner_owner_idx
    on repoowner (owner_id);
