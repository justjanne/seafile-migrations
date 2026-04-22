ALTER TABLE RepoInfo ADD COLUMN type VARCHAR(10);
CREATE INDEX RepoInfoTypeIndex ON RepoInfo (type);
