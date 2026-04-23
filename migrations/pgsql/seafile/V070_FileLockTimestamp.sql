create table if not exists filelocktimestamp (
  id bigserial not null primary key,
  repo_id char(40),
  update_time bigint not null,
  unique (repo_id)
);
