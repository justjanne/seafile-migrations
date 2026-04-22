create table if not exists emailuser
(
    id serial,
    email varchar(255),
    passwd varchar(64),
    is_staff integer not null,
    is_active integer not null,
    ctime bigint,
    primary key (id),
    unique (email)
);
