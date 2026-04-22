create table IF NOT EXISTS SystemInfo (
  id SERIAL NOT NULL PRIMARY KEY,
  info_key VARCHAR(256),
  info_value VARCHAR(1024)
);
