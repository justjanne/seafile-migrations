create table if not exists ldapusers
(
    id serial,
    email varchar(255) not null,
    password varchar(255) not null,
    is_staff smallint not null,
    is_active smallint not null,
    extra_attrs text,
    primary key (id)
);

create index if not exists ldapusers_email_idx on ldapusers (email);
