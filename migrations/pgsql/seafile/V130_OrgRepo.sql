create table if not exists orgrepo (
  id bigserial not null primary key,
  org_id integer,
  repo_id char(37),
  "user" varchar(255),
  unique (org_id, repo_id),
  unique (repo_id)
);

create index if not exists idx_orgrepo_org_id_user on orgrepo (org_id, "user");
create index if not exists idx_orgrepo_user on orgrepo ("user");
