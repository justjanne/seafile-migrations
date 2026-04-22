ALTER TABLE GarbageRepos
DROP CONSTRAINT garbagerepos_pkey;
ALTER TABLE GarbageRepos
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY GarbageRepos
    ADD CONSTRAINT GarbageRepos_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX GarbageRepos_repo_id ON GarbageRepos USING btree (repo_id);
