create table if not exists Branch
(
    name varchar(10) not null,
    repo_id char(41) not null,
    commit_id char(41) null,
    primary key (repo_id, name)
    );

create table if not exists FileLockTimestamp
(
    id bigint auto_increment
    primary key,
    repo_id char(40) null,
    update_time bigint not null,
    constraint repo_id
    unique (repo_id)
    );

create table if not exists FileLocks
(
    id bigint auto_increment
    primary key,
    repo_id char(40) not null,
    path text not null,
    user_name varchar(255) not null,
    lock_time bigint null,
    expire bigint null
    );

create index if not exists repo_id
    on FileLocks (repo_id);

create table if not exists FolderGroupPerm
(
    id bigint auto_increment
    primary key,
    repo_id char(36) not null,
    path text not null,
    permission char(15) null,
    group_id int not null
    );

create index if not exists repo_id
    on FolderGroupPerm (repo_id);

create table if not exists FolderPermTimestamp
(
    id bigint auto_increment
    primary key,
    repo_id char(36) null,
    timestamp bigint null,
    constraint repo_id
    unique (repo_id)
    );

create table if not exists FolderUserPerm
(
    id bigint auto_increment
    primary key,
    repo_id char(36) not null,
    path text not null,
    permission char(15) null,
    user varchar(255) not null
    );

create index if not exists repo_id
    on FolderUserPerm (repo_id);

create table if not exists GCID
(
    id bigint auto_increment
    primary key,
    repo_id char(36) null,
    gc_id char(36) null,
    constraint repo_id
    unique (repo_id)
    );

create table if not exists GarbageRepos
(
    repo_id char(36) not null,
    primary key (repo_id)
    );

create table if not exists InnerPubRepo
(
    repo_id char(37) not null,
    permission char(15) null,
    primary key (repo_id)
    );

create table if not exists LastGCID
(
    id bigint auto_increment
    primary key,
    repo_id char(36) null,
    client_id varchar(128) null,
    gc_id char(36) null,
    constraint repo_id
    unique (repo_id, client_id)
    );

create table if not exists OrgDownloadRateLimit
(
    id bigint auto_increment
    primary key,
    org_id int null,
    download_limit bigint null,
    constraint org_id
    unique (org_id)
    );

create table if not exists OrgGroupRepo
(
    id bigint auto_increment
    primary key,
    org_id int null,
    repo_id char(37) null,
    group_id int null,
    owner varchar(255) null,
    permission char(15) null,
    constraint org_id
    unique (org_id, group_id, repo_id)
    );

create index if not exists owner
    on OrgGroupRepo (owner);

create index if not exists repo_id
    on OrgGroupRepo (repo_id);

create table if not exists OrgInnerPubRepo
(
    id bigint auto_increment
    primary key,
    org_id int null,
    repo_id char(37) null,
    permission char(15) null,
    constraint org_id
    unique (org_id, repo_id)
    );

create table if not exists OrgQuota
(
    org_id int not null,
    quota bigint null,
    primary key (org_id)
    );

create table if not exists OrgRepo
(
    id bigint auto_increment
    primary key,
    org_id int null,
    repo_id char(37) null,
    user varchar(255) null,
    constraint org_id
    unique (org_id, repo_id),
    constraint repo_id
    unique (repo_id)
    );

create index if not exists org_id_2
    on OrgRepo (org_id, user);

create index if not exists user
    on OrgRepo (user);

create table if not exists OrgSharedRepo
(
    id int auto_increment
    primary key,
    org_id int null,
    repo_id char(37) null,
    from_email varchar(255) null,
    to_email varchar(255) null,
    permission char(15) null
    );

create index if not exists from_email
    on OrgSharedRepo (from_email);

create index if not exists org_id
    on OrgSharedRepo (org_id, repo_id);

create index if not exists to_email
    on OrgSharedRepo (to_email);

create table if not exists OrgUploadRateLimit
(
    id bigint auto_increment
    primary key,
    org_id int null,
    upload_limit bigint null,
    constraint org_id
    unique (org_id)
    );

create table if not exists OrgUserDefaultQuota
(
    id bigint auto_increment
    primary key,
    org_id int null,
    quota bigint null,
    constraint org_id
    unique (org_id)
    );

create table if not exists OrgUserQuota
(
    org_id int not null,
    user varchar(255) not null,
    quota bigint null,
    primary key (org_id, user)
    );

create table if not exists Repo
(
    repo_id char(37) not null,
    primary key (repo_id)
    );

create table if not exists RepoFileCount
(
    id bigint auto_increment
    primary key,
    repo_id char(36) null,
    file_count bigint unsigned null,
    constraint repo_id
    unique (repo_id)
    );

create table if not exists RepoGroup
(
    repo_id char(37) null,
    group_id int null,
    user_name varchar(255) null,
    permission char(15) null,
    constraint group_id
    unique (group_id, repo_id)
    );

create index if not exists repo_id
    on RepoGroup (repo_id);

create index if not exists user_name
    on RepoGroup (user_name);

create table if not exists RepoHead
(
    repo_id char(37) not null,
    branch_name varchar(10) null,
    primary key (repo_id)
    );

create table if not exists RepoHistoryLimit
(
    repo_id char(37) not null,
    days int null,
    primary key (repo_id)
    );

create table if not exists RepoInfo
(
    id bigint auto_increment
    primary key,
    repo_id char(36) null,
    name varchar(255) not null,
    update_time bigint null,
    version int null,
    is_encrypted int null,
    last_modifier varchar(255) null,
    status int default 0 null,
    type varchar(10) null,
    constraint repo_id
    unique (repo_id)
    );

create index if not exists RepoInfoTypeIndex
    on RepoInfo (type);

create table if not exists RepoOwner
(
    repo_id char(37) not null,
    owner_id varchar(255) null,
    primary key (repo_id)
    );

create index if not exists owner_id
    on RepoOwner (owner_id);

create table if not exists RepoSize
(
    repo_id char(37) not null,
    size bigint unsigned null,
    head_id char(41) null,
    primary key (repo_id)
    );

create table if not exists RepoStorageId
(
    id bigint auto_increment
    primary key,
    repo_id char(40) not null,
    storage_id varchar(255) not null,
    constraint repo_id
    unique (repo_id)
    );

create table if not exists RepoSyncError
(
    id bigint auto_increment
    primary key,
    token char(41) null,
    error_time bigint unsigned null,
    error_con varchar(1024) null,
    constraint token
    unique (token)
    );

create table if not exists RepoTokenPeerInfo
(
    token char(41) not null,
    peer_id char(41) null,
    peer_ip varchar(50) null,
    peer_name varchar(255) null,
    sync_time bigint null,
    client_ver varchar(20) null,
    primary key (token)
    );

create index if not exists RepoTokenPeerInfo_peer_id
    on RepoTokenPeerInfo (peer_id);

create table if not exists RepoTrash
(
    repo_id char(36) not null,
    repo_name varchar(255) null,
    head_id char(40) null,
    owner_id varchar(255) null,
    size bigint null,
    org_id int null,
    del_time bigint null,
    primary key (repo_id)
    );

create index if not exists org_id
    on RepoTrash (org_id);

create index if not exists owner_id
    on RepoTrash (owner_id);

create table if not exists RepoUserToken
(
    repo_id char(37) null,
    email varchar(255) null,
    token char(41) null,
    constraint repo_id
    unique (repo_id, token)
    );

create index if not exists RepoUserToken_token
    on RepoUserToken (token);

create index if not exists repousertoken_email
    on RepoUserToken (email);

create table if not exists RepoValidSince
(
    repo_id char(37) not null,
    timestamp bigint null,
    primary key (repo_id)
    );

create table if not exists RoleDownloadRateLimit
(
    id bigint auto_increment
    primary key,
    role varchar(255) null,
    download_limit bigint null,
    constraint role
    unique (role)
    );

create table if not exists RoleQuota
(
    id bigint auto_increment
    primary key,
    role varchar(255) null,
    quota bigint null,
    constraint role
    unique (role)
    );

create table if not exists RoleUploadRateLimit
(
    id bigint auto_increment
    primary key,
    role varchar(255) null,
    upload_limit bigint null,
    constraint role
    unique (role)
    );

create table if not exists SeafileConf
(
    id bigint auto_increment
    primary key,
    cfg_group varchar(255) not null,
    cfg_key varchar(255) not null,
    value varchar(255) null,
    property int null
    );

create table if not exists SharedRepo
(
    repo_id char(37) null,
    from_email varchar(255) null,
    to_email varchar(255) null,
    permission char(15) null
    );

create index if not exists from_email
    on SharedRepo (from_email);

create index if not exists from_email_2
    on SharedRepo (from_email);

create index if not exists repo_id
    on SharedRepo (repo_id);

create index if not exists to_email
    on SharedRepo (to_email);

create index if not exists to_email_2
    on SharedRepo (to_email);

create table if not exists SystemInfo
(
    info_key varchar(256) null,
    info_value varchar(1024) null
    );

create table if not exists UserDownloadRateLimit
(
    id bigint auto_increment
    primary key,
    user varchar(255) null,
    download_limit bigint null,
    constraint user
    unique (user)
    );

create table if not exists UserQuota
(
    user varchar(255) not null,
    quota bigint null,
    primary key (user)
    );

create table if not exists UserShareQuota
(
    user varchar(255) not null,
    quota bigint null,
    primary key (user)
    );

create table if not exists UserUploadRateLimit
(
    id bigint auto_increment
    primary key,
    user varchar(255) null,
    upload_limit bigint null,
    constraint user
    unique (user)
    );

create table if not exists VirtualRepo
(
    repo_id char(36) not null,
    origin_repo char(36) null,
    path text null,
    base_commit char(40) null,
    primary key (repo_id)
    );

create index if not exists origin_repo
    on VirtualRepo (origin_repo);

create table if not exists WebAP
(
    repo_id char(37) not null,
    access_property char(10) null,
    primary key (repo_id)
    );

create table if not exists WebUploadTempFiles
(
    id bigint auto_increment
    primary key,
    repo_id char(40) not null,
    file_path text not null,
    tmp_file_path text not null
    );

create index if not exists repo_id
    on WebUploadTempFiles (repo_id);

