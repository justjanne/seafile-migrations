create table IF NOT EXISTS RoleQuota (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  role VARCHAR(255),
  quota BIGINT,
  UNIQUE (role)
);
