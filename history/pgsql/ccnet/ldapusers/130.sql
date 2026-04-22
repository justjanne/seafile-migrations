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
