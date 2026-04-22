create table if not exists repostorageid (
  id bigserial not null primary key,
  repo_id char(40) not null,
  storage_id varchar(255) not null,
  unique (repo_id)
);
