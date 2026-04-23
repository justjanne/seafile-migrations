create table if not exists useruploadratelimit (
  id bigserial not null primary key,
  "user" varchar(255),
  upload_limit bigint,
  unique ("user")
);
