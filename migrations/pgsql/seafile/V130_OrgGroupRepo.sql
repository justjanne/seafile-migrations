create table if not exists orggrouprepo (
  id bigserial not null primary key,
  org_id integer,
  repo_id char(37),
  group_id integer,
  owner varchar(255),
  permission char(15),
  unique (org_id, group_id, repo_id)
);

create index if not exists idx_orggrouprepo_repo_id on orggrouprepo (repo_id);
create index if not exists idx_orggrouprepo_owner on orggrouprepo (owner);
