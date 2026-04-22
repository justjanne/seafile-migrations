create table if not exists userrole
(
    email varchar(255),
    role varchar(255),
    unique (email, role)
);

create index if not exists userrole_email_idx on userrole (email);
