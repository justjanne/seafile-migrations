create table if not exists orgdownloadratelimit (
  id bigserial not null primary key,
  org_id integer,
  download_limit bigint,
  unique (org_id)
);
