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
