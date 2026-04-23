create table if not exists folderuserperm (
  id bigserial not null primary key,
  repo_id char(36) not null,
  path text not null,
  permission char(15),
  "user" varchar(255) not null
);

create index if not exists idx_folderuserperm_repo_id on folderuserperm (repo_id);
