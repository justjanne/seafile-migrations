create table if not exists filelocks (
  id bigserial not null primary key,
  repo_id char(40) not null,
  path text not null,
  user_name varchar(255) not null,
  lock_time bigint,
  expire bigint
);

create index if not exists idx_filelocks_repo_id on filelocks (repo_id);
