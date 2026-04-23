create table if not exists folderpermtimestamp (
  id bigserial not null primary key,
  repo_id char(36),
  timestamp bigint,
  unique (repo_id)
);
