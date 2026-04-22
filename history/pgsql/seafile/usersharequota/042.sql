create table if not exists usersharequota
(
    "user" varchar(255) not null,
    quota bigint,
    primary key ("user")
);
