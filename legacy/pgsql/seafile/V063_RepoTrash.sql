ALTER TABLE RepoTrash
DROP CONSTRAINT repotrash_pkey;
ALTER TABLE RepoTrash
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoTrash
    ADD CONSTRAINT RepoTrash_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoTrash_repo_id ON RepoTrash USING btree (repo_id);
