create table if not exists orguser
(
    org_id integer,
    email varchar(255),
    is_staff integer not null,
    unique (org_id, email)
);

create index if not exists orguser_email_idx
    on orguser (email);
