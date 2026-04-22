create table if not exists userquota
(
    "user" varchar(255) not null,
    quota bigint,
    primary key ("user")
);
