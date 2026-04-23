create table if not exists rolequota (
  id bigserial not null primary key,
  role varchar(255),
  quota bigint,
  unique (role)
);
