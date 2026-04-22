create table if not exists orguserdefaultquota (
  id bigserial not null primary key,
  org_id integer,
  quota bigint,
  unique (org_id)
);
