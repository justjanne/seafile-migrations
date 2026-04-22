create table if not exists emailuser
(
    id serial,
    email varchar(255),
    passwd varchar(256),
    is_staff integer not null,
    is_active integer not null,
    ctime bigint,
    reference_id varchar(255),
    primary key (id),
    unique (email)
);

create unique index if not exists emailuser_reference_id_idx
    on emailuser (reference_id);
