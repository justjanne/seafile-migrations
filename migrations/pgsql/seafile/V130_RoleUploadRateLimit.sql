create table if not exists roleuploadratelimit (
  id bigserial not null primary key,
  role varchar(255),
  upload_limit bigint,
  unique (role)
);
