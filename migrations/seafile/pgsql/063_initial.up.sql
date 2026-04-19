ALTER TABLE Repo
    DROP CONSTRAINT Repo_pkey;

ALTER TABLE Repo
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY Repo
    ADD CONSTRAINT Repo_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX Repo_repo_id ON Repo USING btree (repo_id);

ALTER TABLE RepoOwner
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoOwner
    ADD CONSTRAINT RepoOwner_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoOwner_repo_id ON RepoOwner USING btree (repo_id);

ALTER TABLE RepoGroup
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoGroup
    ADD CONSTRAINT RepoGroup_id_pkey PRIMARY KEY (id);

ALTER TABLE InnerPubRepo
    DROP CONSTRAINT innerpubrepo_pkey;

ALTER TABLE InnerPubRepo
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY InnerPubRepo
    ADD CONSTRAINT InnerPubRepo_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX InnerPubRepo_repo_id ON InnerPubRepo USING btree (repo_id);


ALTER TABLE RepoUserToken
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoUserToken
    ADD CONSTRAINT RepoUserToken_id_pkey PRIMARY KEY (id);


ALTER TABLE RepoTokenPeerInfo
    DROP CONSTRAINT repotokenpeerinfo_pkey;

ALTER TABLE RepoTokenPeerInfo
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoTokenPeerInfo
    ADD CONSTRAINT RepoTokenPeerInfo_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoTokenPeerInfo_token ON RepoTokenPeerInfo USING btree (token);

ALTER TABLE RepoHead
    DROP CONSTRAINT repohead_pkey;
ALTER TABLE RepoHead
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoHead
    ADD CONSTRAINT RepoHead_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoHead_repo_id ON RepoHead USING btree (repo_id);

ALTER TABLE RepoSize
    ADD UNIQUE (repo_id);
ALTER TABLE RepoSize
    DROP CONSTRAINT reposize_pkey;
ALTER TABLE RepoSize
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoSize
    ADD CONSTRAINT RepoSize_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoSize_repo_id ON RepoSize USING btree (repo_id);

ALTER TABLE RepoHistoryLimit
    DROP CONSTRAINT repohistorylimit_pkey;
ALTER TABLE RepoHistoryLimit
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoHistoryLimit
    ADD CONSTRAINT RepoHistoryLimit_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoHistoryLimit_repo_id ON RepoHistoryLimit USING btree (repo_id);

ALTER TABLE RepoValidSince
    DROP CONSTRAINT repovalidsince_pkey;
ALTER TABLE RepoValidSince
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoValidSince
    ADD CONSTRAINT RepoValidSince_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoValidSince_repo_id ON RepoValidSince USING btree (repo_id);

ALTER TABLE WebAP
    DROP CONSTRAINT webap_pkey;
ALTER TABLE WebAP
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY WebAP
    ADD CONSTRAINT WebAP_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX WebAP_repo_id ON WebAP USING btree (repo_id);

ALTER TABLE VirtualRepo
    DROP CONSTRAINT virtualrepo_pkey;
ALTER TABLE VirtualRepo
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY VirtualRepo
    ADD CONSTRAINT VirtualRepo_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX VirtualRepo_repo_id ON VirtualRepo USING btree (repo_id);

ALTER TABLE GarbageRepos
    DROP CONSTRAINT garbagerepos_pkey;
ALTER TABLE GarbageRepos
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY GarbageRepos
    ADD CONSTRAINT GarbageRepos_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX GarbageRepos_repo_id ON GarbageRepos USING btree (repo_id);

ALTER TABLE RepoTrash
    DROP CONSTRAINT repotrash_pkey;
ALTER TABLE RepoTrash
    ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY RepoTrash
    ADD CONSTRAINT RepoTrash_id_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX RepoTrash_repo_id ON RepoTrash USING btree (repo_id);
