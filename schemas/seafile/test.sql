SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER SCHEMA public OWNER TO postgres;

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.branch (
    name character varying(10) NOT NULL,
    repo_id character(40) NOT NULL,
    commit_id character(40)
);

ALTER TABLE public.branch OWNER TO seafile;

CREATE TABLE public.garbagerepos (
    repo_id character(36) NOT NULL
);

ALTER TABLE public.garbagerepos OWNER TO seafile;

CREATE TABLE public.innerpubrepo (
    repo_id character(36) NOT NULL,
    permission character varying(15)
);

ALTER TABLE public.innerpubrepo OWNER TO seafile;

CREATE TABLE public.orgquota (
    org_id integer NOT NULL,
    quota bigint
);

ALTER TABLE public.orgquota OWNER TO seafile;

CREATE TABLE public.orguserquota (
    org_id integer NOT NULL,
    "user" character varying(255) NOT NULL,
    quota bigint
);

ALTER TABLE public.orguserquota OWNER TO seafile;

CREATE TABLE public.repo (
    repo_id character(36) NOT NULL
);

ALTER TABLE public.repo OWNER TO seafile;

CREATE TABLE public.repofilecount (
    repo_id character(36) NOT NULL,
    file_count bigint
);

ALTER TABLE public.repofilecount OWNER TO seafile;

CREATE TABLE public.repogroup (
    repo_id character(36),
    group_id integer,
    user_name character varying(255),
    permission character varying(15)
);

ALTER TABLE public.repogroup OWNER TO seafile;

CREATE TABLE public.repohead (
    repo_id character(36) NOT NULL,
    branch_name character varying(10)
);

ALTER TABLE public.repohead OWNER TO seafile;

CREATE TABLE public.repohistorylimit (
    repo_id character(36) NOT NULL,
    days integer
);

ALTER TABLE public.repohistorylimit OWNER TO seafile;

CREATE TABLE public.repoinfo (
    repo_id character(36) NOT NULL,
    name character varying(255) NOT NULL,
    update_time bigint,
    version integer,
    is_encrypted integer,
    last_modifier character varying(255),
    status integer DEFAULT 0
);

ALTER TABLE public.repoinfo OWNER TO seafile;

CREATE TABLE public.repoowner (
    repo_id character(36) NOT NULL,
    owner_id character varying(255)
);

ALTER TABLE public.repoowner OWNER TO seafile;

CREATE TABLE public.reposize (
    repo_id character(36) NOT NULL,
    size bigint,
    head_id character(40)
);

ALTER TABLE public.reposize OWNER TO seafile;

CREATE TABLE public.reposyncerror (
    id bigint NOT NULL,
    token character(41),
    error_time bigint,
    error_con character varying(1024)
);

ALTER TABLE public.reposyncerror OWNER TO seafile;

CREATE SEQUENCE public.reposyncerror_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.reposyncerror_id_seq OWNER TO seafile;

ALTER SEQUENCE public.reposyncerror_id_seq OWNED BY public.reposyncerror.id;

CREATE TABLE public.repotokenpeerinfo (
    token character(40) NOT NULL,
    peer_id character(40),
    peer_ip character varying(40),
    peer_name character varying(255),
    sync_time bigint,
    client_ver character varying(20)
);

ALTER TABLE public.repotokenpeerinfo OWNER TO seafile;

CREATE TABLE public.repotrash (
    repo_id character(36) NOT NULL,
    repo_name character varying(255),
    head_id character(40),
    owner_id character varying(255),
    size bigint,
    org_id integer,
    del_time bigint
);

ALTER TABLE public.repotrash OWNER TO seafile;

CREATE TABLE public.repousertoken (
    repo_id character(36),
    email character varying(255),
    token character(40)
);

ALTER TABLE public.repousertoken OWNER TO seafile;

CREATE TABLE public.repovalidsince (
    repo_id character(36) NOT NULL,
    "timestamp" bigint
);

ALTER TABLE public.repovalidsince OWNER TO seafile;

CREATE TABLE public.seafileconf (
    cfg_group character varying(255) NOT NULL,
    cfg_key character varying(255) NOT NULL,
    value character varying(255),
    property integer
);

ALTER TABLE public.seafileconf OWNER TO seafile;

CREATE TABLE public.sharedrepo (
    repo_id character(36),
    from_email character varying(255),
    to_email character varying(255),
    permission character varying(15)
);

ALTER TABLE public.sharedrepo OWNER TO seafile;

CREATE TABLE public.systeminfo (
    info_key character varying(256),
    info_value character varying(1024)
);

ALTER TABLE public.systeminfo OWNER TO seafile;

CREATE TABLE public.userquota (
    "user" character varying(255) NOT NULL,
    quota bigint
);

ALTER TABLE public.userquota OWNER TO seafile;

CREATE TABLE public.usersharequota (
    "user" character varying(255) NOT NULL,
    quota bigint
);

ALTER TABLE public.usersharequota OWNER TO seafile;

CREATE TABLE public.virtualrepo (
    repo_id character(36) NOT NULL,
    origin_repo character(36),
    path text,
    base_commit character(40)
);

ALTER TABLE public.virtualrepo OWNER TO seafile;

CREATE TABLE public.webap (
    repo_id character(36) NOT NULL,
    access_property character varying(10)
);

ALTER TABLE public.webap OWNER TO seafile;

CREATE TABLE public.webuploadtempfiles (
    repo_id character(40) NOT NULL,
    file_path text NOT NULL,
    tmp_file_path text NOT NULL
);

ALTER TABLE public.webuploadtempfiles OWNER TO seafile;

ALTER TABLE ONLY public.reposyncerror ALTER COLUMN id SET DEFAULT nextval('public.reposyncerror_id_seq'::regclass);

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (repo_id, name);

ALTER TABLE ONLY public.garbagerepos
    ADD CONSTRAINT garbagerepos_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.innerpubrepo
    ADD CONSTRAINT innerpubrepo_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.orgquota
    ADD CONSTRAINT orgquota_pkey PRIMARY KEY (org_id);

ALTER TABLE ONLY public.orguserquota
    ADD CONSTRAINT orguserquota_pkey PRIMARY KEY (org_id, "user");

ALTER TABLE ONLY public.repo
    ADD CONSTRAINT repo_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.repofilecount
    ADD CONSTRAINT repofilecount_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.repogroup
    ADD CONSTRAINT repogroup_group_id_repo_id_key UNIQUE (group_id, repo_id);

ALTER TABLE ONLY public.repohead
    ADD CONSTRAINT repohead_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.repohistorylimit
    ADD CONSTRAINT repohistorylimit_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.repoinfo
    ADD CONSTRAINT repoinfo_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.repoowner
    ADD CONSTRAINT repoowner_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.reposize
    ADD CONSTRAINT reposize_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.reposyncerror
    ADD CONSTRAINT reposyncerror_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.reposyncerror
    ADD CONSTRAINT reposyncerror_token_key UNIQUE (token);

ALTER TABLE ONLY public.repotokenpeerinfo
    ADD CONSTRAINT repotokenpeerinfo_pkey PRIMARY KEY (token);

ALTER TABLE ONLY public.repotrash
    ADD CONSTRAINT repotrash_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.repousertoken
    ADD CONSTRAINT repousertoken_repo_id_token_key UNIQUE (repo_id, token);

ALTER TABLE ONLY public.repovalidsince
    ADD CONSTRAINT repovalidsince_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.userquota
    ADD CONSTRAINT userquota_pkey PRIMARY KEY ("user");

ALTER TABLE ONLY public.usersharequota
    ADD CONSTRAINT usersharequota_pkey PRIMARY KEY ("user");

ALTER TABLE ONLY public.virtualrepo
    ADD CONSTRAINT virtualrepo_pkey PRIMARY KEY (repo_id);

ALTER TABLE ONLY public.webap
    ADD CONSTRAINT webap_pkey PRIMARY KEY (repo_id);

CREATE UNIQUE INDEX branch_repoidname_idx ON public.branch USING btree (repo_id, name);

CREATE UNIQUE INDEX garbagerepos_repoid_idx ON public.garbagerepos USING btree (repo_id);

CREATE UNIQUE INDEX innerpubrepo_repoid_idx ON public.innerpubrepo USING btree (repo_id);

CREATE UNIQUE INDEX orgquota_orgid_idx ON public.orgquota USING btree (org_id);

CREATE UNIQUE INDEX orguserquota_orgid_user_idx ON public.orguserquota USING btree (org_id, "user");

CREATE UNIQUE INDEX repo_repoid_idx ON public.repo USING btree (repo_id);

CREATE UNIQUE INDEX repofilecount_repoid_idx ON public.repofilecount USING btree (repo_id);

CREATE UNIQUE INDEX repogroup_group_id_repo_id_idx ON public.repogroup USING btree (group_id, repo_id);

CREATE INDEX repogroup_repoid_idx ON public.repogroup USING btree (repo_id);

CREATE INDEX repogroup_username_idx ON public.repogroup USING btree (user_name);

CREATE UNIQUE INDEX repohead_repoid_idx ON public.repohead USING btree (repo_id);

CREATE UNIQUE INDEX repohistorylimit_repoid_idx ON public.repohistorylimit USING btree (repo_id);

CREATE UNIQUE INDEX repoinfo_repoid_idx ON public.repoinfo USING btree (repo_id);

CREATE INDEX repoowner_owner_idx ON public.repoowner USING btree (owner_id);

CREATE UNIQUE INDEX repoowner_repoid_idx ON public.repoowner USING btree (repo_id);

CREATE UNIQUE INDEX reposize_repoid_idx ON public.reposize USING btree (repo_id);

CREATE INDEX repotokenpeerinfo_peerid_idx ON public.repotokenpeerinfo USING btree (peer_id);

CREATE UNIQUE INDEX repotokenpeerinfo_token_idx ON public.repotokenpeerinfo USING btree (token);

CREATE INDEX repotrash_org_id ON public.repotrash USING btree (org_id);

CREATE INDEX repotrash_owner_id ON public.repotrash USING btree (owner_id);

CREATE UNIQUE INDEX repotrash_repoid_idx ON public.repotrash USING btree (repo_id);

CREATE INDEX repousertoken_email_idx ON public.repousertoken USING btree (email);

CREATE INDEX repousertoken_token_idx ON public.repousertoken USING btree (token);

CREATE UNIQUE INDEX repovalidsince_repoid_idx ON public.repovalidsince USING btree (repo_id);

CREATE INDEX sharedrepo_from_email_idx ON public.sharedrepo USING btree (from_email);

CREATE INDEX sharedrepo_repoid_idx ON public.sharedrepo USING btree (repo_id);

CREATE INDEX sharedrepo_to_email_idx ON public.sharedrepo USING btree (to_email);

CREATE UNIQUE INDEX userquota_user_idx ON public.userquota USING btree ("user");

CREATE UNIQUE INDEX usersharequota_user_idx ON public.usersharequota USING btree ("user");

CREATE INDEX virtualrepo_origin_repo_idx ON public.virtualrepo USING btree (origin_repo);

CREATE UNIQUE INDEX virtualrepo_repoid_idx ON public.virtualrepo USING btree (repo_id);

CREATE UNIQUE INDEX webap_repoid_idx ON public.webap USING btree (repo_id);

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
