create table if not exists gcid (
  id bigserial not null primary key,
  repo_id char(36),
  gc_id char(36),
  unique (repo_id)
);
