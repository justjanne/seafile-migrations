ALTER TABLE RepoGroup
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoGroup
    ADD CONSTRAINT RepoGroup_id_pkey PRIMARY KEY (id);
