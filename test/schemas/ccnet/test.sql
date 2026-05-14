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

CREATE TABLE public."Group" (
    group_id integer NOT NULL,
    group_name character varying(255),
    creator_name character varying(255),
    "timestamp" bigint,
    type character varying(32),
    parent_group_id integer
);

ALTER TABLE public."Group" OWNER TO seafile;

CREATE SEQUENCE public."Group_group_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public."Group_group_id_seq" OWNER TO seafile;

ALTER SEQUENCE public."Group_group_id_seq" OWNED BY public."Group".group_id;

CREATE TABLE public.binding (
    email character varying(255),
    peer_id character(41)
);

ALTER TABLE public.binding OWNER TO seafile;

CREATE TABLE public.emailuser (
    id integer NOT NULL,
    email character varying(255),
    passwd character varying(256),
    is_staff integer NOT NULL,
    is_active integer NOT NULL,
    ctime bigint,
    reference_id character varying(255)
);

ALTER TABLE public.emailuser OWNER TO seafile;

CREATE SEQUENCE public.emailuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.emailuser_id_seq OWNER TO seafile;

ALTER SEQUENCE public.emailuser_id_seq OWNED BY public.emailuser.id;

CREATE TABLE public.groupdnpair (
    group_id integer,
    dn character varying(255)
);

ALTER TABLE public.groupdnpair OWNER TO seafile;

CREATE TABLE public.groupstructure (
    group_id integer NOT NULL,
    path character varying(1024)
);

ALTER TABLE public.groupstructure OWNER TO seafile;

CREATE TABLE public.groupuser (
    group_id integer,
    user_name character varying(255),
    is_staff smallint
);

ALTER TABLE public.groupuser OWNER TO seafile;

CREATE TABLE public.ldapconfig (
    cfg_group character varying(255) NOT NULL,
    cfg_key character varying(255) NOT NULL,
    value character varying(255),
    property integer
);

ALTER TABLE public.ldapconfig OWNER TO seafile;

CREATE TABLE public.ldapusers (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    is_staff smallint NOT NULL,
    is_active smallint NOT NULL,
    extra_attrs text,
    reference_id character varying(255)
);

ALTER TABLE public.ldapusers OWNER TO seafile;

CREATE SEQUENCE public.ldapusers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.ldapusers_id_seq OWNER TO seafile;

ALTER SEQUENCE public.ldapusers_id_seq OWNED BY public.ldapusers.id;

CREATE TABLE public.organization (
    org_id integer NOT NULL,
    org_name character varying(255),
    url_prefix character varying(255),
    creator character varying(255),
    ctime bigint
);

ALTER TABLE public.organization OWNER TO seafile;

CREATE SEQUENCE public.organization_org_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.organization_org_id_seq OWNER TO seafile;

ALTER SEQUENCE public.organization_org_id_seq OWNED BY public.organization.org_id;

CREATE TABLE public.orggroup (
    org_id integer,
    group_id integer
);

ALTER TABLE public.orggroup OWNER TO seafile;

CREATE TABLE public.orguser (
    org_id integer,
    email character varying(255),
    is_staff integer NOT NULL
);

ALTER TABLE public.orguser OWNER TO seafile;

CREATE TABLE public.userrole (
    email character varying(255),
    role character varying(255),
    is_manual_set integer DEFAULT 0
);

ALTER TABLE public.userrole OWNER TO seafile;

ALTER TABLE ONLY public."Group" ALTER COLUMN group_id SET DEFAULT nextval('public."Group_group_id_seq"'::regclass);

ALTER TABLE ONLY public.emailuser ALTER COLUMN id SET DEFAULT nextval('public.emailuser_id_seq'::regclass);

ALTER TABLE ONLY public.ldapusers ALTER COLUMN id SET DEFAULT nextval('public.ldapusers_id_seq'::regclass);

ALTER TABLE ONLY public.organization ALTER COLUMN org_id SET DEFAULT nextval('public.organization_org_id_seq'::regclass);

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY (group_id);

ALTER TABLE ONLY public.binding
    ADD CONSTRAINT binding_peer_id_key UNIQUE (peer_id);

ALTER TABLE ONLY public.emailuser
    ADD CONSTRAINT emailuser_email_key UNIQUE (email);

ALTER TABLE ONLY public.emailuser
    ADD CONSTRAINT emailuser_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.groupstructure
    ADD CONSTRAINT groupstructure_pkey PRIMARY KEY (group_id);

ALTER TABLE ONLY public.groupuser
    ADD CONSTRAINT groupuser_group_id_user_name_key UNIQUE (group_id, user_name);

ALTER TABLE ONLY public.ldapusers
    ADD CONSTRAINT ldapusers_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (org_id);

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_url_prefix_key UNIQUE (url_prefix);

ALTER TABLE ONLY public.orggroup
    ADD CONSTRAINT orggroup_org_id_group_id_key UNIQUE (org_id, group_id);

ALTER TABLE ONLY public.orguser
    ADD CONSTRAINT orguser_org_id_email_key UNIQUE (org_id, email);

CREATE INDEX binding_email_idx ON public.binding USING btree (email);

CREATE UNIQUE INDEX binding_peerid_idx ON public.binding USING btree (peer_id);

CREATE UNIQUE INDEX emailuser_reference_id_idx ON public.emailuser USING btree (reference_id);

CREATE UNIQUE INDEX groupstructure_groupid_idx ON public.groupstructure USING btree (group_id);

CREATE INDEX groupuser_username_idx ON public.groupuser USING btree (user_name);

CREATE UNIQUE INDEX ldapusers_email_idx ON public.ldapusers USING btree (email);

CREATE UNIQUE INDEX ldapusers_reference_id_idx ON public.ldapusers USING btree (reference_id);

CREATE INDEX orggroup_groupid_idx ON public.orggroup USING btree (group_id);

CREATE INDEX orguser_email_idx ON public.orguser USING btree (email);

CREATE INDEX userrole_email_idx ON public.userrole USING btree (email);

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
