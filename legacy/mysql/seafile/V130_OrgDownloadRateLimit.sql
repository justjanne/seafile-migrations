CREATE TABLE IF NOT EXISTS OrgDownloadRateLimit (
  id BIGINT NOT NULL AUTO_INCREMENT,
  org_id INTEGER,
  download_limit BIGINT,
  PRIMARY KEY (`id`),
  UNIQUE INDEX(org_id)
) ENGINE=InnoDB;
