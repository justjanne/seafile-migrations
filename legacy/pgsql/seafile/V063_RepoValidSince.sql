ALTER TABLE RepoValidSince
DROP CONSTRAINT repovalidsince_pkey;
ALTER TABLE RepoValidSince
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoValidSince
    ADD CONSTRAINT RepoValidSince_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoValidSince_repo_id ON RepoValidSince USING btree (repo_id);
