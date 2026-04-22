create table if not exists foldergroupperm (
  id bigserial not null primary key,
  repo_id char(36) not null,
  path text not null,
  permission char(15),
  group_id integer not null
);

create index if not exists idx_foldergroupperm_repo_id on foldergroupperm (repo_id);
