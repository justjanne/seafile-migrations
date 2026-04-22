create table if not exists ldapusers
(
    id serial,
    email varchar(255) not null,
    password varchar(255) not null,
    is_staff smallint not null,
    is_active smallint not null,
    extra_attrs text,
    reference_id varchar(255),
    primary key (id)
);

create unique index if not exists ldapusers_email_idx
    on ldapusers (email);

create unique index if not exists ldapusers_reference_id_idx
    on ldapusers (reference_id);
