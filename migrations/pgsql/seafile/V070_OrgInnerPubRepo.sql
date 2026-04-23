create table if not exists orginnerpubrepo (
  id bigserial not null primary key,
  org_id integer,
  repo_id char(37),
  permission char(15),
  unique (org_id, repo_id)
);
