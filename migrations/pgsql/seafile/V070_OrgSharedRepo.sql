create table if not exists orgsharedrepo (
  id serial not null primary key,
  org_id integer,
  repo_id char(37),
  from_email varchar(255),
  to_email varchar(255),
  permission char(15)
);

create index if not exists idx_orgsharedrepo_repo_id on orgsharedrepo (repo_id);
create index if not exists idx_orgsharedrepo_org_id_repo_id on orgsharedrepo (org_id, repo_id);
create index if not exists idx_orgsharedrepo_from_email on orgsharedrepo (from_email);
create index if not exists idx_orgsharedrepo_to_email on orgsharedrepo (to_email);
