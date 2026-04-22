ALTER TABLE VirtualRepo
DROP CONSTRAINT virtualrepo_pkey;
ALTER TABLE VirtualRepo
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY VirtualRepo
    ADD CONSTRAINT VirtualRepo_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX VirtualRepo_repo_id ON VirtualRepo USING btree (repo_id);
