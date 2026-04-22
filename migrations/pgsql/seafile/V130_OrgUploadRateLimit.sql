create table if not exists orguploadratelimit (
  id bigserial not null primary key,
  org_id integer,
  upload_limit bigint,
  unique (org_id)
);
