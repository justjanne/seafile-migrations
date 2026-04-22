create table if not exists orguser
(
    id bigserial,
    org_id integer,
    email varchar(255),
    is_staff boolean not null,
    primary key (id),
    unique (org_id, email)
);

create index if not exists idx_orguser_email
    on orguser (email);
