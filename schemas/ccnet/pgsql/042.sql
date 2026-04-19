create table if not exists emailuser
(
    id serial,
    email varchar(255),
    passwd varchar(256),
    is_staff integer not null,
    is_active integer not null,
    ctime bigint,
    primary key (id),
    unique (email)
);

create table if not exists binding
(
    email varchar(255),
    peer_id char(41),
    unique (peer_id)
);

create table if not exists userrole
(
    email varchar(255),
    role varchar(255),
    unique (email, role)
);

create index if not exists userrole_email_idx
    on userrole (email);

create table if not exists ldapusers
(
    id serial,
    email varchar(255) not null,
    password varchar(255) not null,
    is_staff smallint not null,
    is_active smallint not null,
    extra_attrs text,
    primary key (id)
);

create index if not exists ldapusers_email_idx
    on ldapusers (email);

create table if not exists "Group"
(
    group_id serial,
    group_name varchar(255),
    creator_name varchar(255),
    timestamp bigint,
    type varchar(32),
    primary key (group_id)
);

create table if not exists groupuser
(
    group_id integer,
    user_name varchar(255),
    is_staff smallint,
    unique (group_id, user_name)
);

create index if not exists groupuser_username_idx
    on groupuser (user_name);

create table if not exists groupdnpair
(
    group_id integer,
    dn varchar(255)
);

create table if not exists organization
(
    org_id serial,
    org_name varchar(255),
    url_prefix varchar(255),
    creator varchar(255),
    ctime bigint,
    primary key (org_id),
    unique (url_prefix)
);

create table if not exists orguser
(
    org_id integer,
    email varchar(255),
    is_staff integer not null,
    unique (org_id, email)
);

create index if not exists orguser_email_idx
    on orguser (email);

create table if not exists orggroup
(
    org_id integer,
    group_id integer,
    unique (org_id, group_id)
);

create index if not exists orggroup_groupid_idx
    on orggroup (group_id);
