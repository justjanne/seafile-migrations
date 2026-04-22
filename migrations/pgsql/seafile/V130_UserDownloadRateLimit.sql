create table if not exists userdownloadratelimit (
  id bigserial not null primary key,
  "user" varchar(255),
  download_limit bigint,
  unique ("user")
);
