create table if not exists branch
(
    name varchar(10) not null,
    repo_id char(40) not null,
    commit_id char(40),
    primary key (repo_id, name)
);

create table if not exists repo
(
    repo_id char(36) not null,
    primary key (repo_id)
);

create table if not exists repoowner
(
    repo_id char(36) not null,
    owner_id varchar(255),
    primary key (repo_id)
);

create index if not exists repoowner_owner_idx
    on repoowner (owner_id);

create table if not exists repogroup
(
    repo_id char(36),
    group_id integer,
    user_name varchar(255),
    permission varchar(15),
    unique (group_id, repo_id)
);

create index if not exists repogroup_repoid_idx
    on repogroup (repo_id);

create index if not exists repogroup_username_idx
    on repogroup (user_name);

create table if not exists innerpubrepo
(
    repo_id char(36) not null,
    permission varchar(15),
    primary key (repo_id)
);

create table if not exists repousertoken
(
    repo_id char(36),
    email varchar(255),
    token char(40),
    unique (repo_id, token)
);

create index if not exists repousertoken_email_idx
    on repousertoken (email);

create table if not exists repotokenpeerinfo
(
    token char(40) not null,
    peer_id char(40),
    peer_ip varchar(40),
    peer_name varchar(255),
    sync_time bigint,
    primary key (token)
);

create table if not exists repohead
(
    repo_id char(36) not null,
    branch_name varchar(10),
    primary key (repo_id)
);

create table if not exists reposize
(
    repo_id char(36) not null,
    size bigint,
    head_id char(40),
    primary key (repo_id)
);

create table if not exists repohistorylimit
(
    repo_id char(36) not null,
    days integer,
    primary key (repo_id)
);

create table if not exists repovalidsince
(
    repo_id char(36) not null,
    timestamp bigint,
    primary key (repo_id)
);

create table if not exists webap
(
    repo_id char(36) not null,
    access_property varchar(10),
    primary key (repo_id)
);

create table if not exists virtualrepo
(
    repo_id char(36) not null,
    origin_repo char(36),
    path text,
    base_commit char(40),
    primary key (repo_id)
);

create index if not exists virtualrepo_origin_repo_idx
    on virtualrepo (origin_repo);

create table if not exists garbagerepos
(
    repo_id char(36) not null,
    primary key (repo_id)
);

create table if not exists userquota
(
    "user" varchar(255) not null,
    quota bigint,
    primary key ("user")
);

create table if not exists orgquota
(
    org_id integer not null,
    quota bigint,
    primary key (org_id)
);

create table if not exists orguserquota
(
    org_id integer not null,
    "user" varchar(255) not null,
    quota bigint,
    primary key (org_id, "user")
);

create table if not exists sharedrepo
(
    repo_id char(36),
    from_email varchar(255),
    to_email varchar(255),
    permission varchar(15)
);

create index if not exists sharedrepo_repoid_idx
    on sharedrepo (repo_id);

create index if not exists sharedrepo_from_email_idx
    on sharedrepo (from_email);

create index if not exists sharedrepo_to_email_idx
    on sharedrepo (to_email);

create table if not exists systeminfo
(
    info_key varchar(256),
    info_value varchar(1024)
);
