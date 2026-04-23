create table if not exists reposyncerror (
  id bigserial not null primary key,
  token char(41),
  error_time bigint,
  error_con varchar(1024),
  unique (token)
);
