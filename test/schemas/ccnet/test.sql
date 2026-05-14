CREATE TABLE public."Group" (
    group_id serial NOT NULL,
    group_name character varying(255),
    creator_name character varying(255),
    "timestamp" bigint,
    type character varying(32),
    parent_group_id integer
);

CREATE TABLE public.binding (
    email character varying(255),
    peer_id character(41)
);

CREATE TABLE public.emailuser (
    id serial NOT NULL,
    email character varying(255),
    passwd character varying(256),
    is_staff integer NOT NULL,
    is_active integer NOT NULL,
    ctime bigint,
    reference_id character varying(255)
);

CREATE TABLE public.groupdnpair (
    group_id integer,
    dn character varying(255)
);

CREATE TABLE public.groupstructure (
    group_id integer NOT NULL,
    path character varying(1024)
);

CREATE TABLE public.groupuser (
    group_id integer,
    user_name character varying(255),
    is_staff smallint
);

CREATE TABLE public.ldapconfig (
    cfg_group character varying(255) NOT NULL,
    cfg_key character varying(255) NOT NULL,
    value character varying(255),
    property integer
);

CREATE TABLE public.ldapusers (
    id serial NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    is_staff smallint NOT NULL,
    is_active smallint NOT NULL,
    extra_attrs text,
    reference_id character varying(255)
);

CREATE TABLE public.organization (
    org_id serial NOT NULL,
    org_name character varying(255),
    url_prefix character varying(255),
    creator character varying(255),
    ctime bigint
);

CREATE TABLE public.orggroup (
    org_id integer,
    group_id integer
);

CREATE TABLE public.orguser (
    org_id integer,
    email character varying(255),
    is_staff integer NOT NULL
);

CREATE TABLE public.userrole (
    email character varying(255),
    role character varying(255),
    is_manual_set integer DEFAULT 0
);

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
