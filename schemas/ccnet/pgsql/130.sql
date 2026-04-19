create table if not exists binding
(
    id bigserial,
    email varchar(255),
    peer_id char(41),
    primary key (id),
    unique (peer_id)
);

create index if not exists idx_binding_email
    on binding (email);

create table if not exists emailuser
(
    id bigserial,
    email varchar(255),
    passwd varchar(256),
    is_staff boolean not null,
    is_active boolean not null,
    ctime bigint,
    reference_id varchar(255),
    is_department_owner boolean default false not null,
    primary key (id),
    unique (email),
    unique (reference_id)
);

create index if not exists idx_emailuser_is_active
    on emailuser (is_active);

create index if not exists idx_emailuser_is_department_owner
    on emailuser (is_department_owner);

create table if not exists "group"
(
    group_id bigserial,
    group_name varchar(255),
    creator_name varchar(255),
    timestamp bigint,
    type varchar(32),
    parent_group_id integer default 0,
    primary key (group_id)
);

create table if not exists groupdnpair
(
    id bigserial,
    group_id integer,
    dn varchar(255),
    primary key (id)
);

create table if not exists groupstructure
(
    id bigserial,
    group_id integer,
    path varchar(1024),
    primary key (id),
    unique (group_id)
);

create table if not exists groupuser
(
    id bigserial,
    group_id bigint,
    user_name varchar(255),
    is_staff smallint,
    primary key (id),
    unique (group_id, user_name)
);

create index if not exists idx_groupuser_user_name
    on groupuser (user_name);

create table if not exists ldapconfig
(
    id bigserial,
    cfg_group varchar(255) not null,
    cfg_key varchar(255) not null,
    value varchar(255),
    property integer,
    primary key (id)
);

create table if not exists ldapusers
(
    id bigserial,
    email varchar(255) not null,
    password varchar(255) not null,
    is_staff boolean not null,
    is_active boolean not null,
    extra_attrs text,
    reference_id varchar(255),
    primary key (id),
    unique (email),
    unique (reference_id)
);

create table if not exists orggroup
(
    id bigserial,
    org_id integer,
    group_id integer,
    primary key (id),
    unique (org_id, group_id)
);

create index if not exists idx_orggroup_group_id
    on orggroup (group_id);

create table if not exists orguser
(
    id bigserial,
    org_id integer,
    email varchar(255),
    is_staff boolean not null,
    primary key (id),
    unique (org_id, email)
);

create index if not exists idx_orguser_email
    on orguser (email);

create table if not exists organization
(
    org_id bigserial,
    org_name varchar(255),
    url_prefix varchar(255),
    creator varchar(255),
    ctime bigint,
    primary key (org_id),
    unique (url_prefix)
);

create table if not exists userrole
(
    id bigserial,
    email varchar(255),
    role varchar(255),
    is_manual_set integer default 0,
    primary key (id),
    unique (email)
);

create table if not exists orgfileextwhitelist
(
    id bigserial,
    org_id integer,
    white_list text,
    primary key (id),
    unique (org_id)
);
