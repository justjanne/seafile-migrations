create table IF NOT EXISTS WebAP (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  repo_id CHAR(37),
  access_property CHAR(10),
  UNIQUE (repo_id)
);
