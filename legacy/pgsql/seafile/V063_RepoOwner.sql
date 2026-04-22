ALTER TABLE RepoOwner
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoOwner
    ADD CONSTRAINT RepoOwner_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoOwner_repo_id ON RepoOwner USING btree (repo_id);