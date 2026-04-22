ALTER TABLE RepoHistoryLimit
DROP CONSTRAINT repohistorylimit_pkey;
ALTER TABLE RepoHistoryLimit
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoHistoryLimit
    ADD CONSTRAINT RepoHistoryLimit_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoHistoryLimit_repo_id ON RepoHistoryLimit USING btree (repo_id);
