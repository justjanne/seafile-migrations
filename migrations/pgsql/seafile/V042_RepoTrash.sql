create table if not exists repotrash
(
    repo_id char(36) not null,
    repo_name varchar(255),
    head_id char(40),
    owner_id varchar(255),
    size bigint,
    org_id integer,
    del_time bigint,
    primary key (repo_id)
);

create index if not exists repotrash_owner_id on repotrash (owner_id);
create index if not exists repotrash_org_id on repotrash (org_id);
