ALTER TABLE RepoTokenPeerInfo
DROP CONSTRAINT repotokenpeerinfo_pkey;

ALTER TABLE RepoTokenPeerInfo
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoTokenPeerInfo
    ADD CONSTRAINT RepoTokenPeerInfo_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoTokenPeerInfo_token ON RepoTokenPeerInfo USING btree (token);
