create table IF NOT EXISTS RepoTokenPeerInfo (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  token CHAR(41),
  peer_id CHAR(41),
  peer_ip VARCHAR(50),
  peer_name VARCHAR(255),
  sync_time BIGINT,
  client_ver VARCHAR(20),
  UNIQUE (token)
);

CREATE INDEX IF NOT EXISTS idx_RepoTokenPeerInfo_peer_id ON RepoTokenPeerInfo (peer_id);
