create table if not exists Binding
(
    id bigint auto_increment
    primary key,
    email varchar(255) null,
    peer_id char(41) null,
    constraint peer_id
    unique (peer_id)
    );

create index if not exists email
    on Binding (email(20));

create table if not exists EmailUser
(
    id int auto_increment
    primary key,
    email varchar(255) null,
    passwd varchar(256) null,
    is_staff tinyint(1) not null,
    is_active tinyint(1) not null,
    ctime bigint null,
    reference_id varchar(255) null,
    is_department_owner tinyint(1) default 0 not null,
    constraint email
    unique (email),
    constraint reference_id
    unique (reference_id)
    );

create index if not exists EmailUser_is_active
    on EmailUser (is_active);

create index if not exists EmailUser_is_department_owenr
    on EmailUser (is_department_owner);

create table if not exists `Group`
(
    group_id int auto_increment
    primary key,
    group_name varchar(255) null,
    creator_name varchar(255) null,
    timestamp bigint null,
    type varchar(32) null,
    parent_group_id int default 0 null
    );

create table if not exists GroupDNPair
(
    id bigint auto_increment
    primary key,
    group_id int null,
    dn varchar(255) null
    );

create table if not exists GroupStructure
(
    id bigint auto_increment
    primary key,
    group_id int null,
    path varchar(1024) null,
    constraint group_id
    unique (group_id)
    );

create table if not exists GroupUser
(
    id bigint auto_increment
    primary key,
    group_id int null,
    user_name varchar(255) null,
    is_staff tinyint null,
    constraint group_id
    unique (group_id, user_name)
    );

create index if not exists user_name
    on GroupUser (user_name);

create table if not exists LDAPConfig
(
    id bigint auto_increment
    primary key,
    cfg_group varchar(255) not null,
    cfg_key varchar(255) not null,
    value varchar(255) null,
    property int null
    );

create table if not exists LDAPUsers
(
    id int auto_increment
    primary key,
    email varchar(255) not null,
    password varchar(255) not null,
    is_staff tinyint(1) not null,
    is_active tinyint(1) not null,
    extra_attrs text null,
    reference_id varchar(255) null,
    constraint email
    unique (email),
    constraint reference_id
    unique (reference_id),
    constraint reference_id_2
    unique (reference_id)
    );

create table if not exists OrgFileExtWhiteList
(
    id bigint auto_increment
    primary key,
    org_id int null,
    white_list text null,
    constraint org_id
    unique (org_id)
    );

create table if not exists OrgGroup
(
    id bigint auto_increment
    primary key,
    org_id int null,
    group_id int null,
    constraint org_id
    unique (org_id, group_id)
    );

create index if not exists group_id
    on OrgGroup (group_id);

create table if not exists OrgUser
(
    id bigint auto_increment
    primary key,
    org_id int null,
    email varchar(255) null,
    is_staff tinyint(1) not null,
    constraint org_id
    unique (org_id, email)
    );

create index if not exists email
    on OrgUser (email);

create table if not exists Organization
(
    org_id int auto_increment
    primary key,
    org_name varchar(255) null,
    url_prefix varchar(255) null,
    creator varchar(255) null,
    ctime bigint null,
    constraint url_prefix
    unique (url_prefix)
    );

create table if not exists UserRole
(
    id int auto_increment
    primary key,
    email varchar(255) null,
    role varchar(255) null,
    is_manual_set int default 0 null,
    constraint email
    unique (email)
    );
