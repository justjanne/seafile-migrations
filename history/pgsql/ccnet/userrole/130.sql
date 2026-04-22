create table if not exists userrole
(
    id bigserial,
    email varchar(255),
    role varchar(255),
    is_manual_set integer default 0,
    primary key (id),
    unique (email)
);
