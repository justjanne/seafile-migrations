ALTER TABLE RepoUserToken
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoUserToken
    ADD CONSTRAINT RepoUserToken_id_pkey PRIMARY KEY (id);
