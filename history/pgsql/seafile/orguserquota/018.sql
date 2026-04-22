create table if not exists orguserquota
(
    org_id integer not null,
    "user" varchar(255) not null,
    quota bigint,
    primary key (org_id, "user")
);
