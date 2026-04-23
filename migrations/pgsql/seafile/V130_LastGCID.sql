create table if not exists lastgcid (
  id bigserial not null primary key,
  repo_id char(36),
  client_id varchar(128),
  gc_id char(36),
  unique (repo_id, client_id)
);
