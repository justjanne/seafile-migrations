ALTER TABLE RepoHead
DROP CONSTRAINT repohead_pkey;
ALTER TABLE RepoHead
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoHead
    ADD CONSTRAINT RepoHead_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoHead_repo_id ON RepoHead USING btree (repo_id);
