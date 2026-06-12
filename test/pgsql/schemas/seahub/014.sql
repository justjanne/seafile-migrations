--
-- Name: api2_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api2_token (
    key character varying(40) NOT NULL,
    "user" character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE public.api2_token OWNER TO postgres;

--
-- Name: avatar_avatar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avatar_avatar (
    id integer NOT NULL,
    emailuser character varying(255) NOT NULL,
    "primary" boolean NOT NULL,
    avatar character varying(1024) NOT NULL,
    date_uploaded timestamp with time zone NOT NULL
);


ALTER TABLE public.avatar_avatar OWNER TO postgres;

--
-- Name: avatar_avatar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avatar_avatar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avatar_avatar_id_seq OWNER TO postgres;

--
-- Name: avatar_avatar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avatar_avatar_id_seq OWNED BY public.avatar_avatar.id;


--
-- Name: avatar_groupavatar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avatar_groupavatar (
    id integer NOT NULL,
    group_id character varying(255) NOT NULL,
    avatar character varying(1024) NOT NULL,
    date_uploaded timestamp with time zone NOT NULL
);


ALTER TABLE public.avatar_groupavatar OWNER TO postgres;

--
-- Name: avatar_groupavatar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.avatar_groupavatar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.avatar_groupavatar_id_seq OWNER TO postgres;

--
-- Name: avatar_groupavatar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.avatar_groupavatar_id_seq OWNED BY public.avatar_groupavatar.id;


--
-- Name: base_dirfileslastmodifiedinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_dirfileslastmodifiedinfo (
    id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    parent_dir text NOT NULL,
    parent_dir_hash character varying(12) NOT NULL,
    dir_id character varying(40) NOT NULL,
    last_modified_info text NOT NULL
);


ALTER TABLE public.base_dirfileslastmodifiedinfo OWNER TO postgres;

--
-- Name: base_dirfileslastmodifiedinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_dirfileslastmodifiedinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_dirfileslastmodifiedinfo_id_seq OWNER TO postgres;

--
-- Name: base_dirfileslastmodifiedinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_dirfileslastmodifiedinfo_id_seq OWNED BY public.base_dirfileslastmodifiedinfo.id;


--
-- Name: base_filecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_filecomment (
    id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    file_path text NOT NULL,
    file_path_hash character varying(12) NOT NULL,
    from_email character varying(75) NOT NULL,
    message text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.base_filecomment OWNER TO postgres;

--
-- Name: base_filecomment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_filecomment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_filecomment_id_seq OWNER TO postgres;

--
-- Name: base_filecomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_filecomment_id_seq OWNED BY public.base_filecomment.id;


--
-- Name: base_filecontributors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_filecontributors (
    id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    file_id character varying(40) NOT NULL,
    file_path text NOT NULL,
    file_path_hash character varying(12) NOT NULL,
    last_modified bigint NOT NULL,
    last_commit_id character varying(40) NOT NULL,
    emails text NOT NULL
);


ALTER TABLE public.base_filecontributors OWNER TO postgres;

--
-- Name: base_filecontributors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_filecontributors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_filecontributors_id_seq OWNER TO postgres;

--
-- Name: base_filecontributors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_filecontributors_id_seq OWNED BY public.base_filecontributors.id;


--
-- Name: base_innerpubmsg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_innerpubmsg (
    id integer NOT NULL,
    from_email character varying(75) NOT NULL,
    message character varying(500) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.base_innerpubmsg OWNER TO postgres;

--
-- Name: base_innerpubmsg_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_innerpubmsg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_innerpubmsg_id_seq OWNER TO postgres;

--
-- Name: base_innerpubmsg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_innerpubmsg_id_seq OWNED BY public.base_innerpubmsg.id;


--
-- Name: base_innerpubmsgreply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_innerpubmsgreply (
    id integer NOT NULL,
    reply_to_id integer NOT NULL,
    from_email character varying(75) NOT NULL,
    message character varying(150) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.base_innerpubmsgreply OWNER TO postgres;

--
-- Name: base_innerpubmsgreply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_innerpubmsgreply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_innerpubmsgreply_id_seq OWNER TO postgres;

--
-- Name: base_innerpubmsgreply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_innerpubmsgreply_id_seq OWNED BY public.base_innerpubmsgreply.id;


--
-- Name: base_userstarredfiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_userstarredfiles (
    id integer NOT NULL,
    email character varying(75) NOT NULL,
    org_id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    path text NOT NULL,
    is_dir boolean NOT NULL
);


ALTER TABLE public.base_userstarredfiles OWNER TO postgres;

--
-- Name: base_userstarredfiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_userstarredfiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_userstarredfiles_id_seq OWNER TO postgres;

--
-- Name: base_userstarredfiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_userstarredfiles_id_seq OWNED BY public.base_userstarredfiles.id;


--
-- Name: base_uuidobjidmap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_uuidobjidmap (
    id integer NOT NULL,
    uuid character varying(40) NOT NULL,
    obj_id character varying(40) NOT NULL
);


ALTER TABLE public.base_uuidobjidmap OWNER TO postgres;

--
-- Name: base_uuidobjidmap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_uuidobjidmap_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_uuidobjidmap_id_seq OWNER TO postgres;

--
-- Name: base_uuidobjidmap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_uuidobjidmap_id_seq OWNED BY public.base_uuidobjidmap.id;


--
-- Name: contacts_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_contact (
    id integer NOT NULL,
    user_email character varying(255) NOT NULL,
    contact_email character varying(255) NOT NULL,
    contact_name character varying(255),
    note character varying(255)
);


ALTER TABLE public.contacts_contact OWNER TO postgres;

--
-- Name: contacts_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_contact_id_seq OWNER TO postgres;

--
-- Name: contacts_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_contact_id_seq OWNED BY public.contacts_contact.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: group_businessgroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_businessgroup (
    id integer NOT NULL,
    group_id integer NOT NULL,
    group_type character varying(10) NOT NULL
);


ALTER TABLE public.group_businessgroup OWNER TO postgres;

--
-- Name: group_businessgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_businessgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_businessgroup_id_seq OWNER TO postgres;

--
-- Name: group_businessgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_businessgroup_id_seq OWNED BY public.group_businessgroup.id;


--
-- Name: group_groupmessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_groupmessage (
    id integer NOT NULL,
    group_id integer NOT NULL,
    from_email character varying(75) NOT NULL,
    message character varying(500) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.group_groupmessage OWNER TO postgres;

--
-- Name: group_groupmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_groupmessage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_groupmessage_id_seq OWNER TO postgres;

--
-- Name: group_groupmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_groupmessage_id_seq OWNED BY public.group_groupmessage.id;


--
-- Name: group_messageattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_messageattachment (
    id integer NOT NULL,
    group_message_id integer NOT NULL,
    repo_id character varying(40) NOT NULL,
    attach_type character varying(5) NOT NULL,
    path text NOT NULL,
    src character varying(20) NOT NULL
);


ALTER TABLE public.group_messageattachment OWNER TO postgres;

--
-- Name: group_messageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_messageattachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_messageattachment_id_seq OWNER TO postgres;

--
-- Name: group_messageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_messageattachment_id_seq OWNED BY public.group_messageattachment.id;


--
-- Name: group_messagereply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_messagereply (
    id integer NOT NULL,
    reply_to_id integer NOT NULL,
    from_email character varying(75) NOT NULL,
    message character varying(150) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.group_messagereply OWNER TO postgres;

--
-- Name: group_messagereply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_messagereply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_messagereply_id_seq OWNER TO postgres;

--
-- Name: group_messagereply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_messagereply_id_seq OWNED BY public.group_messagereply.id;


--
-- Name: notifications_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications_notification (
    id integer NOT NULL,
    message character varying(512) NOT NULL,
    "primary" boolean NOT NULL
);


ALTER TABLE public.notifications_notification OWNER TO postgres;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_notification_id_seq OWNER TO postgres;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications_notification.id;


--
-- Name: notifications_usernotification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications_usernotification (
    id integer NOT NULL,
    to_user character varying(255) NOT NULL,
    msg_type character varying(30) NOT NULL,
    detail text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.notifications_usernotification OWNER TO postgres;

--
-- Name: notifications_usernotification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_usernotification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_usernotification_id_seq OWNER TO postgres;

--
-- Name: notifications_usernotification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_usernotification_id_seq OWNED BY public.notifications_usernotification.id;


--
-- Name: profile_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_profile (
    id integer NOT NULL,
    "user" character varying(75) NOT NULL,
    nickname character varying(64) NOT NULL,
    intro text NOT NULL
);


ALTER TABLE public.profile_profile OWNER TO postgres;

--
-- Name: profile_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profile_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profile_profile_id_seq OWNER TO postgres;

--
-- Name: profile_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profile_profile_id_seq OWNED BY public.profile_profile.id;


--
-- Name: registration_registrationprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_registrationprofile (
    id integer NOT NULL,
    emailuser_id integer NOT NULL,
    activation_key character varying(40) NOT NULL
);


ALTER TABLE public.registration_registrationprofile OWNER TO postgres;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registration_registrationprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.registration_registrationprofile_id_seq OWNER TO postgres;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registration_registrationprofile_id_seq OWNED BY public.registration_registrationprofile.id;


--
-- Name: share_anonymousshare; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share_anonymousshare (
    id integer NOT NULL,
    repo_owner character varying(255) NOT NULL,
    repo_id character varying(36) NOT NULL,
    anonymous_email character varying(255) NOT NULL,
    token character varying(25) NOT NULL
);


ALTER TABLE public.share_anonymousshare OWNER TO postgres;

--
-- Name: share_anonymousshare_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.share_anonymousshare_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.share_anonymousshare_id_seq OWNER TO postgres;

--
-- Name: share_anonymousshare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.share_anonymousshare_id_seq OWNED BY public.share_anonymousshare.id;


--
-- Name: share_fileshare; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share_fileshare (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    repo_id character varying(36) NOT NULL,
    path text NOT NULL,
    token character varying(10) NOT NULL,
    ctime timestamp with time zone NOT NULL,
    view_cnt integer NOT NULL,
    s_type character varying(2) NOT NULL
);


ALTER TABLE public.share_fileshare OWNER TO postgres;

--
-- Name: share_fileshare_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.share_fileshare_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.share_fileshare_id_seq OWNER TO postgres;

--
-- Name: share_fileshare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.share_fileshare_id_seq OWNED BY public.share_fileshare.id;


--
-- Name: avatar_avatar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avatar_avatar ALTER COLUMN id SET DEFAULT nextval('public.avatar_avatar_id_seq'::regclass);


--
-- Name: avatar_groupavatar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avatar_groupavatar ALTER COLUMN id SET DEFAULT nextval('public.avatar_groupavatar_id_seq'::regclass);


--
-- Name: base_dirfileslastmodifiedinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_dirfileslastmodifiedinfo ALTER COLUMN id SET DEFAULT nextval('public.base_dirfileslastmodifiedinfo_id_seq'::regclass);


--
-- Name: base_filecomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filecomment ALTER COLUMN id SET DEFAULT nextval('public.base_filecomment_id_seq'::regclass);


--
-- Name: base_filecontributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filecontributors ALTER COLUMN id SET DEFAULT nextval('public.base_filecontributors_id_seq'::regclass);


--
-- Name: base_innerpubmsg id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_innerpubmsg ALTER COLUMN id SET DEFAULT nextval('public.base_innerpubmsg_id_seq'::regclass);


--
-- Name: base_innerpubmsgreply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_innerpubmsgreply ALTER COLUMN id SET DEFAULT nextval('public.base_innerpubmsgreply_id_seq'::regclass);


--
-- Name: base_userstarredfiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_userstarredfiles ALTER COLUMN id SET DEFAULT nextval('public.base_userstarredfiles_id_seq'::regclass);


--
-- Name: base_uuidobjidmap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_uuidobjidmap ALTER COLUMN id SET DEFAULT nextval('public.base_uuidobjidmap_id_seq'::regclass);


--
-- Name: contacts_contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact ALTER COLUMN id SET DEFAULT nextval('public.contacts_contact_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: group_businessgroup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_businessgroup ALTER COLUMN id SET DEFAULT nextval('public.group_businessgroup_id_seq'::regclass);


--
-- Name: group_groupmessage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_groupmessage ALTER COLUMN id SET DEFAULT nextval('public.group_groupmessage_id_seq'::regclass);


--
-- Name: group_messageattachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_messageattachment ALTER COLUMN id SET DEFAULT nextval('public.group_messageattachment_id_seq'::regclass);


--
-- Name: group_messagereply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_messagereply ALTER COLUMN id SET DEFAULT nextval('public.group_messagereply_id_seq'::regclass);


--
-- Name: notifications_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_notification ALTER COLUMN id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Name: notifications_usernotification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_usernotification ALTER COLUMN id SET DEFAULT nextval('public.notifications_usernotification_id_seq'::regclass);


--
-- Name: profile_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_profile ALTER COLUMN id SET DEFAULT nextval('public.profile_profile_id_seq'::regclass);


--
-- Name: registration_registrationprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('public.registration_registrationprofile_id_seq'::regclass);


--
-- Name: share_anonymousshare id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_anonymousshare ALTER COLUMN id SET DEFAULT nextval('public.share_anonymousshare_id_seq'::regclass);


--
-- Name: share_fileshare id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_fileshare ALTER COLUMN id SET DEFAULT nextval('public.share_fileshare_id_seq'::regclass);


--
-- Name: api2_token api2_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api2_token
    ADD CONSTRAINT api2_token_pkey PRIMARY KEY (key);


--
-- Name: api2_token api2_token_user_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api2_token
    ADD CONSTRAINT api2_token_user_key UNIQUE ("user");


--
-- Name: avatar_avatar avatar_avatar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avatar_avatar
    ADD CONSTRAINT avatar_avatar_pkey PRIMARY KEY (id);


--
-- Name: avatar_groupavatar avatar_groupavatar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avatar_groupavatar
    ADD CONSTRAINT avatar_groupavatar_pkey PRIMARY KEY (id);


--
-- Name: base_dirfileslastmodifiedinfo base_dirfileslastmodifiedinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_dirfileslastmodifiedinfo
    ADD CONSTRAINT base_dirfileslastmodifiedinfo_pkey PRIMARY KEY (id);


--
-- Name: base_dirfileslastmodifiedinfo base_dirfileslastmodifiedinfo_repo_id_parent_dir_hash_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_dirfileslastmodifiedinfo
    ADD CONSTRAINT base_dirfileslastmodifiedinfo_repo_id_parent_dir_hash_key UNIQUE (repo_id, parent_dir_hash);


--
-- Name: base_filecomment base_filecomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filecomment
    ADD CONSTRAINT base_filecomment_pkey PRIMARY KEY (id);


--
-- Name: base_filecontributors base_filecontributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filecontributors
    ADD CONSTRAINT base_filecontributors_pkey PRIMARY KEY (id);


--
-- Name: base_innerpubmsg base_innerpubmsg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_innerpubmsg
    ADD CONSTRAINT base_innerpubmsg_pkey PRIMARY KEY (id);


--
-- Name: base_innerpubmsgreply base_innerpubmsgreply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_innerpubmsgreply
    ADD CONSTRAINT base_innerpubmsgreply_pkey PRIMARY KEY (id);


--
-- Name: base_userstarredfiles base_userstarredfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_userstarredfiles
    ADD CONSTRAINT base_userstarredfiles_pkey PRIMARY KEY (id);


--
-- Name: base_uuidobjidmap base_uuidobjidmap_obj_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_uuidobjidmap
    ADD CONSTRAINT base_uuidobjidmap_obj_id_key UNIQUE (obj_id);


--
-- Name: base_uuidobjidmap base_uuidobjidmap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_uuidobjidmap
    ADD CONSTRAINT base_uuidobjidmap_pkey PRIMARY KEY (id);


--
-- Name: contacts_contact contacts_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact
    ADD CONSTRAINT contacts_contact_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: group_businessgroup group_businessgroup_group_id_group_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_businessgroup
    ADD CONSTRAINT group_businessgroup_group_id_group_type_key UNIQUE (group_id, group_type);


--
-- Name: group_businessgroup group_businessgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_businessgroup
    ADD CONSTRAINT group_businessgroup_pkey PRIMARY KEY (id);


--
-- Name: group_groupmessage group_groupmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_groupmessage
    ADD CONSTRAINT group_groupmessage_pkey PRIMARY KEY (id);


--
-- Name: group_messageattachment group_messageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_messageattachment
    ADD CONSTRAINT group_messageattachment_pkey PRIMARY KEY (id);


--
-- Name: group_messagereply group_messagereply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_messagereply
    ADD CONSTRAINT group_messagereply_pkey PRIMARY KEY (id);


--
-- Name: notifications_notification notifications_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notification_pkey PRIMARY KEY (id);


--
-- Name: notifications_usernotification notifications_usernotification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_usernotification
    ADD CONSTRAINT notifications_usernotification_pkey PRIMARY KEY (id);


--
-- Name: profile_profile profile_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_profile
    ADD CONSTRAINT profile_profile_pkey PRIMARY KEY (id);


--
-- Name: profile_profile profile_profile_user_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_profile
    ADD CONSTRAINT profile_profile_user_key UNIQUE ("user");


--
-- Name: registration_registrationprofile registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: share_anonymousshare share_anonymousshare_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_anonymousshare
    ADD CONSTRAINT share_anonymousshare_pkey PRIMARY KEY (id);


--
-- Name: share_anonymousshare share_anonymousshare_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_anonymousshare
    ADD CONSTRAINT share_anonymousshare_token_key UNIQUE (token);


--
-- Name: share_fileshare share_fileshare_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_fileshare
    ADD CONSTRAINT share_fileshare_pkey PRIMARY KEY (id);


--
-- Name: share_fileshare share_fileshare_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_fileshare
    ADD CONSTRAINT share_fileshare_token_key UNIQUE (token);


--
-- Name: base_filecomment_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_repo_id ON public.base_filecomment USING btree (repo_id);


--
-- Name: base_filecomment_repo_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_repo_id_like ON public.base_filecomment USING btree (repo_id varchar_pattern_ops);


--
-- Name: base_filecontributors_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecontributors_repo_id ON public.base_filecontributors USING btree (repo_id);


--
-- Name: base_filecontributors_repo_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecontributors_repo_id_like ON public.base_filecontributors USING btree (repo_id varchar_pattern_ops);


--
-- Name: base_innerpubmsgreply_reply_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_innerpubmsgreply_reply_to_id ON public.base_innerpubmsgreply USING btree (reply_to_id);


--
-- Name: contacts_contact_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_contact_user_email ON public.contacts_contact USING btree (user_email);


--
-- Name: contacts_contact_user_email_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_contact_user_email_like ON public.contacts_contact USING btree (user_email varchar_pattern_ops);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date ON public.django_session USING btree (expire_date);


--
-- Name: group_groupmessage_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_groupmessage_group_id ON public.group_groupmessage USING btree (group_id);


--
-- Name: group_messageattachment_group_message_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_messageattachment_group_message_id ON public.group_messageattachment USING btree (group_message_id);


--
-- Name: group_messagereply_reply_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_messagereply_reply_to_id ON public.group_messagereply USING btree (reply_to_id);


--
-- Name: notifications_usernotification_msg_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_msg_type ON public.notifications_usernotification USING btree (msg_type);


--
-- Name: notifications_usernotification_msg_type_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_msg_type_like ON public.notifications_usernotification USING btree (msg_type varchar_pattern_ops);


--
-- Name: notifications_usernotification_to_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_to_user ON public.notifications_usernotification USING btree (to_user);


--
-- Name: notifications_usernotification_to_user_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_to_user_like ON public.notifications_usernotification USING btree (to_user varchar_pattern_ops);


--
-- Name: share_fileshare_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_repo_id ON public.share_fileshare USING btree (repo_id);


--
-- Name: share_fileshare_repo_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_repo_id_like ON public.share_fileshare USING btree (repo_id varchar_pattern_ops);


--
-- Name: share_fileshare_s_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_s_type ON public.share_fileshare USING btree (s_type);


--
-- Name: share_fileshare_s_type_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_s_type_like ON public.share_fileshare USING btree (s_type varchar_pattern_ops);


--
-- Name: share_fileshare_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_username ON public.share_fileshare USING btree (username);


--
-- Name: share_fileshare_username_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_username_like ON public.share_fileshare USING btree (username varchar_pattern_ops);


--
-- Name: base_innerpubmsgreply base_innerpubmsgreply_reply_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_innerpubmsgreply
    ADD CONSTRAINT base_innerpubmsgreply_reply_to_id_fkey FOREIGN KEY (reply_to_id) REFERENCES public.base_innerpubmsg(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_messageattachment group_messageattachment_group_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_messageattachment
    ADD CONSTRAINT group_messageattachment_group_message_id_fkey FOREIGN KEY (group_message_id) REFERENCES public.group_groupmessage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_messagereply group_messagereply_reply_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_messagereply
    ADD CONSTRAINT group_messagereply_reply_to_id_fkey FOREIGN KEY (reply_to_id) REFERENCES public.group_groupmessage(id) DEFERRABLE INITIALLY DEFERRED;
