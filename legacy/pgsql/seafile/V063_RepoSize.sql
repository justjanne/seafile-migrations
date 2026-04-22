ALTER TABLE RepoSize
    ADD UNIQUE (repo_id);
ALTER TABLE RepoSize
DROP CONSTRAINT reposize_pkey;
ALTER TABLE RepoSize
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoSize
    ADD CONSTRAINT RepoSize_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoSize_repo_id ON RepoSize USING btree (repo_id);
