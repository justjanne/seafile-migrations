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
