create table IF NOT EXISTS SeafileConf (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  cfg_group VARCHAR(255) NOT NULL,
  cfg_key VARCHAR(255) NOT NULL,
  value VARCHAR(255),
  property INTEGER
);
