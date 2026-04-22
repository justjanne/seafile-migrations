ALTER TABLE InnerPubRepo
DROP CONSTRAINT innerpubrepo_pkey;

ALTER TABLE InnerPubRepo
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY InnerPubRepo
    ADD CONSTRAINT InnerPubRepo_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX InnerPubRepo_repo_id ON InnerPubRepo USING btree (repo_id);
