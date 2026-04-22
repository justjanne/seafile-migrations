create table if not exists roledownloadratelimit (
  id bigserial not null primary key,
  role varchar(255),
  download_limit bigint,
  unique (role)
);
