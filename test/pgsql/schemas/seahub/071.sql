--
-- Name: abuse_reports_abusereport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abuse_reports_abusereport (
    id integer NOT NULL,
    reporter text,
    repo_id character varying(36) NOT NULL,
    repo_name character varying(255) NOT NULL,
    file_path text,
    abuse_type character varying(255) NOT NULL,
    description text,
    handled boolean NOT NULL,
    "time" timestamp with time zone NOT NULL
);


ALTER TABLE public.abuse_reports_abusereport OWNER TO postgres;

--
-- Name: abuse_reports_abusereport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.abuse_reports_abusereport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.abuse_reports_abusereport_id_seq OWNER TO postgres;

--
-- Name: abuse_reports_abusereport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.abuse_reports_abusereport_id_seq OWNED BY public.abuse_reports_abusereport.id;


--
-- Name: admin_log_adminlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_log_adminlog (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    operation character varying(255) NOT NULL,
    detail text NOT NULL,
    datetime timestamp with time zone NOT NULL
);


ALTER TABLE public.admin_log_adminlog OWNER TO postgres;

--
-- Name: admin_log_adminlog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_log_adminlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_log_adminlog_id_seq OWNER TO postgres;

--
-- Name: admin_log_adminlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_log_adminlog_id_seq OWNED BY public.admin_log_adminlog.id;


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
-- Name: api2_tokenv2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api2_tokenv2 (
    key character varying(40) NOT NULL,
    "user" character varying(255) NOT NULL,
    platform character varying(32) NOT NULL,
    device_id character varying(40) NOT NULL,
    device_name character varying(40) NOT NULL,
    platform_version character varying(16) NOT NULL,
    client_version character varying(16) NOT NULL,
    last_accessed timestamp with time zone NOT NULL,
    last_login_ip inet,
    created_at timestamp with time zone NOT NULL,
    wiped_at timestamp with time zone
);


ALTER TABLE public.api2_tokenv2 OWNER TO postgres;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


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
-- Name: base_clientlogintoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_clientlogintoken (
    token character varying(32) NOT NULL,
    username character varying(255) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.base_clientlogintoken OWNER TO postgres;

--
-- Name: base_commandslastcheck; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_commandslastcheck (
    id integer NOT NULL,
    command_type character varying(100) NOT NULL,
    last_check timestamp with time zone NOT NULL
);


ALTER TABLE public.base_commandslastcheck OWNER TO postgres;

--
-- Name: base_commandslastcheck_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_commandslastcheck_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_commandslastcheck_id_seq OWNER TO postgres;

--
-- Name: base_commandslastcheck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_commandslastcheck_id_seq OWNED BY public.base_commandslastcheck.id;


--
-- Name: base_devicetoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_devicetoken (
    id integer NOT NULL,
    token character varying(80) NOT NULL,
    "user" character varying(255) NOT NULL,
    platform character varying(32) NOT NULL,
    version character varying(16) NOT NULL,
    pversion character varying(16) NOT NULL
);


ALTER TABLE public.base_devicetoken OWNER TO postgres;

--
-- Name: base_devicetoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_devicetoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_devicetoken_id_seq OWNER TO postgres;

--
-- Name: base_devicetoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_devicetoken_id_seq OWNED BY public.base_devicetoken.id;


--
-- Name: base_filecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_filecomment (
    id integer NOT NULL,
    author character varying(255) NOT NULL,
    comment text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    uuid_id uuid NOT NULL,
    detail text NOT NULL,
    resolved boolean NOT NULL
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
-- Name: base_filediscuss; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_filediscuss (
    id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    path text NOT NULL,
    path_hash character varying(12) NOT NULL,
    group_message_id integer NOT NULL
);


ALTER TABLE public.base_filediscuss OWNER TO postgres;

--
-- Name: base_filediscuss_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_filediscuss_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_filediscuss_id_seq OWNER TO postgres;

--
-- Name: base_filediscuss_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_filediscuss_id_seq OWNED BY public.base_filediscuss.id;


--
-- Name: base_groupenabledmodule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_groupenabledmodule (
    id integer NOT NULL,
    group_id character varying(10) NOT NULL,
    module_name character varying(20) NOT NULL
);


ALTER TABLE public.base_groupenabledmodule OWNER TO postgres;

--
-- Name: base_groupenabledmodule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_groupenabledmodule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_groupenabledmodule_id_seq OWNER TO postgres;

--
-- Name: base_groupenabledmodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_groupenabledmodule_id_seq OWNED BY public.base_groupenabledmodule.id;


--
-- Name: base_innerpubmsg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_innerpubmsg (
    id integer NOT NULL,
    from_email character varying(254) NOT NULL,
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
    from_email character varying(254) NOT NULL,
    message character varying(150) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    reply_to_id integer NOT NULL
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
-- Name: base_reposecretkey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_reposecretkey (
    id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    secret_key character varying(44) NOT NULL
);


ALTER TABLE public.base_reposecretkey OWNER TO postgres;

--
-- Name: base_reposecretkey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_reposecretkey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_reposecretkey_id_seq OWNER TO postgres;

--
-- Name: base_reposecretkey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_reposecretkey_id_seq OWNED BY public.base_reposecretkey.id;


--
-- Name: base_userenabledmodule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_userenabledmodule (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    module_name character varying(20) NOT NULL
);


ALTER TABLE public.base_userenabledmodule OWNER TO postgres;

--
-- Name: base_userenabledmodule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_userenabledmodule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_userenabledmodule_id_seq OWNER TO postgres;

--
-- Name: base_userenabledmodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_userenabledmodule_id_seq OWNED BY public.base_userenabledmodule.id;


--
-- Name: base_userlastlogin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_userlastlogin (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    last_login timestamp with time zone NOT NULL
);


ALTER TABLE public.base_userlastlogin OWNER TO postgres;

--
-- Name: base_userlastlogin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_userlastlogin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_userlastlogin_id_seq OWNER TO postgres;

--
-- Name: base_userlastlogin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_userlastlogin_id_seq OWNED BY public.base_userlastlogin.id;


--
-- Name: base_userstarredfiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_userstarredfiles (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
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
-- Name: captcha_captchastore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.captcha_captchastore (
    id integer NOT NULL,
    challenge character varying(32) NOT NULL,
    response character varying(32) NOT NULL,
    hashkey character varying(40) NOT NULL,
    expiration timestamp with time zone NOT NULL
);


ALTER TABLE public.captcha_captchastore OWNER TO postgres;

--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.captcha_captchastore_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.captcha_captchastore_id_seq OWNER TO postgres;

--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.captcha_captchastore_id_seq OWNED BY public.captcha_captchastore.id;


--
-- Name: constance_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constance_config (
    id integer NOT NULL,
    constance_key character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.constance_config OWNER TO postgres;

--
-- Name: constance_config_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.constance_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.constance_config_id_seq OWNER TO postgres;

--
-- Name: constance_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.constance_config_id_seq OWNED BY public.constance_config.id;


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
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


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
-- Name: drafts_draft; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drafts_draft (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    username character varying(255) NOT NULL,
    origin_repo_id character varying(36) NOT NULL,
    origin_file_version character varying(100) NOT NULL,
    draft_file_path character varying(1024) NOT NULL,
    origin_file_uuid uuid NOT NULL,
    publish_file_version character varying(100),
    status character varying(20) NOT NULL
);


ALTER TABLE public.drafts_draft OWNER TO postgres;

--
-- Name: drafts_draft_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drafts_draft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drafts_draft_id_seq OWNER TO postgres;

--
-- Name: drafts_draft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drafts_draft_id_seq OWNED BY public.drafts_draft.id;


--
-- Name: drafts_draftreviewer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drafts_draftreviewer (
    id integer NOT NULL,
    reviewer character varying(255) NOT NULL,
    draft_id integer NOT NULL
);


ALTER TABLE public.drafts_draftreviewer OWNER TO postgres;

--
-- Name: drafts_draftreviewer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drafts_draftreviewer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drafts_draftreviewer_id_seq OWNER TO postgres;

--
-- Name: drafts_draftreviewer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drafts_draftreviewer_id_seq OWNED BY public.drafts_draftreviewer.id;


--
-- Name: file_participants_fileparticipant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.file_participants_fileparticipant (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    uuid_id uuid NOT NULL
);


ALTER TABLE public.file_participants_fileparticipant OWNER TO postgres;

--
-- Name: file_participants_fileparticipant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.file_participants_fileparticipant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.file_participants_fileparticipant_id_seq OWNER TO postgres;

--
-- Name: file_participants_fileparticipant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.file_participants_fileparticipant_id_seq OWNED BY public.file_participants_fileparticipant.id;


--
-- Name: file_tags_filetags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.file_tags_filetags (
    id integer NOT NULL,
    file_uuid_id uuid NOT NULL,
    repo_tag_id integer NOT NULL
);


ALTER TABLE public.file_tags_filetags OWNER TO postgres;

--
-- Name: file_tags_filetags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.file_tags_filetags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.file_tags_filetags_id_seq OWNER TO postgres;

--
-- Name: file_tags_filetags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.file_tags_filetags_id_seq OWNED BY public.file_tags_filetags.id;


--
-- Name: group_groupmessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_groupmessage (
    id integer NOT NULL,
    group_id integer NOT NULL,
    from_email character varying(255) NOT NULL,
    message text NOT NULL,
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
    repo_id character varying(40) NOT NULL,
    attach_type character varying(5) NOT NULL,
    path text NOT NULL,
    src character varying(20) NOT NULL,
    group_message_id integer NOT NULL
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
    from_email character varying(255) NOT NULL,
    message text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    reply_to_id integer NOT NULL
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
-- Name: group_publicgroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_publicgroup (
    id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.group_publicgroup OWNER TO postgres;

--
-- Name: group_publicgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_publicgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.group_publicgroup_id_seq OWNER TO postgres;

--
-- Name: group_publicgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_publicgroup_id_seq OWNED BY public.group_publicgroup.id;


--
-- Name: institutions_institution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institutions_institution (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    create_time timestamp with time zone NOT NULL
);


ALTER TABLE public.institutions_institution OWNER TO postgres;

--
-- Name: institutions_institution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institutions_institution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.institutions_institution_id_seq OWNER TO postgres;

--
-- Name: institutions_institution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institutions_institution_id_seq OWNED BY public.institutions_institution.id;


--
-- Name: institutions_institutionadmin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institutions_institutionadmin (
    id integer NOT NULL,
    "user" character varying(255) NOT NULL,
    institution_id integer NOT NULL
);


ALTER TABLE public.institutions_institutionadmin OWNER TO postgres;

--
-- Name: institutions_institutionadmin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institutions_institutionadmin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.institutions_institutionadmin_id_seq OWNER TO postgres;

--
-- Name: institutions_institutionadmin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institutions_institutionadmin_id_seq OWNED BY public.institutions_institutionadmin.id;


--
-- Name: institutions_institutionquota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institutions_institutionquota (
    id integer NOT NULL,
    quota bigint NOT NULL,
    institution_id integer NOT NULL
);


ALTER TABLE public.institutions_institutionquota OWNER TO postgres;

--
-- Name: institutions_institutionquota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institutions_institutionquota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.institutions_institutionquota_id_seq OWNER TO postgres;

--
-- Name: institutions_institutionquota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institutions_institutionquota_id_seq OWNED BY public.institutions_institutionquota.id;


--
-- Name: invitations_invitation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invitations_invitation (
    id integer NOT NULL,
    token character varying(40) NOT NULL,
    inviter character varying(255) NOT NULL,
    accepter character varying(255) NOT NULL,
    invite_time timestamp with time zone NOT NULL,
    accept_time timestamp with time zone,
    invite_type character varying(20) NOT NULL,
    expire_time timestamp with time zone NOT NULL
);


ALTER TABLE public.invitations_invitation OWNER TO postgres;

--
-- Name: invitations_invitation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invitations_invitation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invitations_invitation_id_seq OWNER TO postgres;

--
-- Name: invitations_invitation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invitations_invitation_id_seq OWNED BY public.invitations_invitation.id;


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
    "timestamp" timestamp with time zone NOT NULL,
    seen boolean NOT NULL
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
-- Name: options_useroptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options_useroptions (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    option_key character varying(50) NOT NULL,
    option_val character varying(50) NOT NULL
);


ALTER TABLE public.options_useroptions OWNER TO postgres;

--
-- Name: options_useroptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.options_useroptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.options_useroptions_id_seq OWNER TO postgres;

--
-- Name: options_useroptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.options_useroptions_id_seq OWNED BY public.options_useroptions.id;


--
-- Name: post_office_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_office_attachment (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    name character varying(255) NOT NULL,
    mimetype character varying(255) NOT NULL,
    headers text
);


ALTER TABLE public.post_office_attachment OWNER TO postgres;

--
-- Name: post_office_attachment_emails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_office_attachment_emails (
    id integer NOT NULL,
    attachment_id integer NOT NULL,
    email_id integer NOT NULL
);


ALTER TABLE public.post_office_attachment_emails OWNER TO postgres;

--
-- Name: post_office_attachment_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_office_attachment_emails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_office_attachment_emails_id_seq OWNER TO postgres;

--
-- Name: post_office_attachment_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_office_attachment_emails_id_seq OWNED BY public.post_office_attachment_emails.id;


--
-- Name: post_office_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_office_attachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_office_attachment_id_seq OWNER TO postgres;

--
-- Name: post_office_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_office_attachment_id_seq OWNED BY public.post_office_attachment.id;


--
-- Name: post_office_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_office_email (
    id integer NOT NULL,
    from_email character varying(254) NOT NULL,
    "to" text NOT NULL,
    cc text NOT NULL,
    bcc text NOT NULL,
    subject character varying(989) NOT NULL,
    message text NOT NULL,
    html_message text NOT NULL,
    status smallint,
    priority smallint,
    created timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    scheduled_time timestamp with time zone,
    headers text,
    context text,
    template_id integer,
    backend_alias character varying(64) NOT NULL,
    CONSTRAINT post_office_email_priority_check CHECK ((priority >= 0)),
    CONSTRAINT post_office_email_status_check CHECK ((status >= 0))
);


ALTER TABLE public.post_office_email OWNER TO postgres;

--
-- Name: post_office_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_office_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_office_email_id_seq OWNER TO postgres;

--
-- Name: post_office_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_office_email_id_seq OWNED BY public.post_office_email.id;


--
-- Name: post_office_emailtemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_office_emailtemplate (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    subject character varying(255) NOT NULL,
    content text NOT NULL,
    html_content text NOT NULL,
    created timestamp with time zone NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    default_template_id integer,
    language character varying(12) NOT NULL
);


ALTER TABLE public.post_office_emailtemplate OWNER TO postgres;

--
-- Name: post_office_emailtemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_office_emailtemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_office_emailtemplate_id_seq OWNER TO postgres;

--
-- Name: post_office_emailtemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_office_emailtemplate_id_seq OWNED BY public.post_office_emailtemplate.id;


--
-- Name: post_office_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_office_log (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    status smallint NOT NULL,
    exception_type character varying(255) NOT NULL,
    message text NOT NULL,
    email_id integer NOT NULL,
    CONSTRAINT post_office_log_status_check CHECK ((status >= 0))
);


ALTER TABLE public.post_office_log OWNER TO postgres;

--
-- Name: post_office_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_office_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_office_log_id_seq OWNER TO postgres;

--
-- Name: post_office_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_office_log_id_seq OWNED BY public.post_office_log.id;


--
-- Name: profile_detailedprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_detailedprofile (
    id integer NOT NULL,
    "user" character varying(255) NOT NULL,
    department character varying(512) NOT NULL,
    telephone character varying(100) NOT NULL
);


ALTER TABLE public.profile_detailedprofile OWNER TO postgres;

--
-- Name: profile_detailedprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profile_detailedprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profile_detailedprofile_id_seq OWNER TO postgres;

--
-- Name: profile_detailedprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profile_detailedprofile_id_seq OWNED BY public.profile_detailedprofile.id;


--
-- Name: profile_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_profile (
    id integer NOT NULL,
    "user" character varying(254) NOT NULL,
    nickname character varying(64) NOT NULL,
    intro text NOT NULL,
    lang_code text,
    login_id character varying(225),
    contact_email character varying(225),
    institution character varying(225),
    list_in_address_book boolean NOT NULL
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
-- Name: related_files_relatedfiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.related_files_relatedfiles (
    id integer NOT NULL,
    o_uuid_id uuid NOT NULL,
    r_uuid_id uuid NOT NULL
);


ALTER TABLE public.related_files_relatedfiles OWNER TO postgres;

--
-- Name: related_files_relatedfiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.related_files_relatedfiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.related_files_relatedfiles_id_seq OWNER TO postgres;

--
-- Name: related_files_relatedfiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.related_files_relatedfiles_id_seq OWNED BY public.related_files_relatedfiles.id;


--
-- Name: repo_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo_api_tokens (
    id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    app_name character varying(255) NOT NULL,
    token character varying(40) NOT NULL,
    generated_at timestamp with time zone NOT NULL,
    generated_by character varying(255) NOT NULL,
    last_access timestamp with time zone NOT NULL,
    permission character varying(15) NOT NULL
);


ALTER TABLE public.repo_api_tokens OWNER TO postgres;

--
-- Name: repo_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repo_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.repo_api_tokens_id_seq OWNER TO postgres;

--
-- Name: repo_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repo_api_tokens_id_seq OWNED BY public.repo_api_tokens.id;


--
-- Name: repo_tags_repotags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repo_tags_repotags (
    id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    color character varying(255) NOT NULL
);


ALTER TABLE public.repo_tags_repotags OWNER TO postgres;

--
-- Name: repo_tags_repotags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repo_tags_repotags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.repo_tags_repotags_id_seq OWNER TO postgres;

--
-- Name: repo_tags_repotags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repo_tags_repotags_id_seq OWNED BY public.repo_tags_repotags.id;


--
-- Name: revision_tag_revisiontags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revision_tag_revisiontags (
    id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    path text NOT NULL,
    revision_id character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.revision_tag_revisiontags OWNER TO postgres;

--
-- Name: revision_tag_revisiontags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.revision_tag_revisiontags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.revision_tag_revisiontags_id_seq OWNER TO postgres;

--
-- Name: revision_tag_revisiontags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.revision_tag_revisiontags_id_seq OWNED BY public.revision_tag_revisiontags.id;


--
-- Name: revision_tag_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revision_tag_tags (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.revision_tag_tags OWNER TO postgres;

--
-- Name: revision_tag_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.revision_tag_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.revision_tag_tags_id_seq OWNER TO postgres;

--
-- Name: revision_tag_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.revision_tag_tags_id_seq OWNED BY public.revision_tag_tags.id;


--
-- Name: role_permissions_adminrole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions_adminrole (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    role character varying(255) NOT NULL
);


ALTER TABLE public.role_permissions_adminrole OWNER TO postgres;

--
-- Name: role_permissions_adminrole_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_permissions_adminrole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_permissions_adminrole_id_seq OWNER TO postgres;

--
-- Name: role_permissions_adminrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_permissions_adminrole_id_seq OWNED BY public.role_permissions_adminrole.id;


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
-- Name: share_extragroupssharepermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share_extragroupssharepermission (
    id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    group_id integer NOT NULL,
    permission character varying(30) NOT NULL
);


ALTER TABLE public.share_extragroupssharepermission OWNER TO postgres;

--
-- Name: share_extragroupssharepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.share_extragroupssharepermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.share_extragroupssharepermission_id_seq OWNER TO postgres;

--
-- Name: share_extragroupssharepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.share_extragroupssharepermission_id_seq OWNED BY public.share_extragroupssharepermission.id;


--
-- Name: share_extrasharepermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share_extrasharepermission (
    id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    share_to character varying(255) NOT NULL,
    permission character varying(30) NOT NULL
);


ALTER TABLE public.share_extrasharepermission OWNER TO postgres;

--
-- Name: share_extrasharepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.share_extrasharepermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.share_extrasharepermission_id_seq OWNER TO postgres;

--
-- Name: share_extrasharepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.share_extrasharepermission_id_seq OWNED BY public.share_extrasharepermission.id;


--
-- Name: share_fileshare; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share_fileshare (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    repo_id character varying(36) NOT NULL,
    path text NOT NULL,
    token character varying(100) NOT NULL,
    ctime timestamp with time zone NOT NULL,
    view_cnt integer NOT NULL,
    s_type character varying(2) NOT NULL,
    password character varying(128),
    expire_date timestamp with time zone,
    permission character varying(50) NOT NULL
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
-- Name: share_orgfileshare; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share_orgfileshare (
    id integer NOT NULL,
    org_id integer NOT NULL,
    file_share_id integer NOT NULL
);


ALTER TABLE public.share_orgfileshare OWNER TO postgres;

--
-- Name: share_orgfileshare_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.share_orgfileshare_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.share_orgfileshare_id_seq OWNER TO postgres;

--
-- Name: share_orgfileshare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.share_orgfileshare_id_seq OWNED BY public.share_orgfileshare.id;


--
-- Name: share_privatefiledirshare; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share_privatefiledirshare (
    id integer NOT NULL,
    from_user character varying(255) NOT NULL,
    to_user character varying(255) NOT NULL,
    repo_id character varying(36) NOT NULL,
    path text NOT NULL,
    token character varying(10) NOT NULL,
    permission character varying(5) NOT NULL,
    s_type character varying(5) NOT NULL
);


ALTER TABLE public.share_privatefiledirshare OWNER TO postgres;

--
-- Name: share_privatefiledirshare_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.share_privatefiledirshare_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.share_privatefiledirshare_id_seq OWNER TO postgres;

--
-- Name: share_privatefiledirshare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.share_privatefiledirshare_id_seq OWNED BY public.share_privatefiledirshare.id;


--
-- Name: share_uploadlinkshare; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.share_uploadlinkshare (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    repo_id character varying(36) NOT NULL,
    path text NOT NULL,
    token character varying(100) NOT NULL,
    ctime timestamp with time zone NOT NULL,
    view_cnt integer NOT NULL,
    password character varying(128),
    expire_date timestamp with time zone
);


ALTER TABLE public.share_uploadlinkshare OWNER TO postgres;

--
-- Name: share_uploadlinkshare_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.share_uploadlinkshare_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.share_uploadlinkshare_id_seq OWNER TO postgres;

--
-- Name: share_uploadlinkshare_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.share_uploadlinkshare_id_seq OWNED BY public.share_uploadlinkshare.id;


--
-- Name: tags_filetag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags_filetag (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    tag_id integer NOT NULL,
    uuid_id uuid NOT NULL
);


ALTER TABLE public.tags_filetag OWNER TO postgres;

--
-- Name: tags_filetag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_filetag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_filetag_id_seq OWNER TO postgres;

--
-- Name: tags_filetag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_filetag_id_seq OWNED BY public.tags_filetag.id;


--
-- Name: tags_fileuuidmap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags_fileuuidmap (
    uuid uuid NOT NULL,
    repo_id character varying(36) NOT NULL,
    repo_id_parent_path_md5 character varying(100) NOT NULL,
    parent_path text NOT NULL,
    filename character varying(1024) NOT NULL,
    is_dir boolean NOT NULL
);


ALTER TABLE public.tags_fileuuidmap OWNER TO postgres;

--
-- Name: tags_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags_tags (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.tags_tags OWNER TO postgres;

--
-- Name: tags_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_tags_id_seq OWNER TO postgres;

--
-- Name: tags_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_tags_id_seq OWNED BY public.tags_tags.id;


--
-- Name: termsandconditions_termsandconditions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termsandconditions_termsandconditions (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name text NOT NULL,
    version_number numeric(6,2) NOT NULL,
    text text,
    info text,
    date_active timestamp with time zone,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.termsandconditions_termsandconditions OWNER TO postgres;

--
-- Name: termsandconditions_termsandconditions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.termsandconditions_termsandconditions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.termsandconditions_termsandconditions_id_seq OWNER TO postgres;

--
-- Name: termsandconditions_termsandconditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.termsandconditions_termsandconditions_id_seq OWNED BY public.termsandconditions_termsandconditions.id;


--
-- Name: termsandconditions_usertermsandconditions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.termsandconditions_usertermsandconditions (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    ip_address inet,
    date_accepted timestamp with time zone NOT NULL,
    terms_id integer NOT NULL
);


ALTER TABLE public.termsandconditions_usertermsandconditions OWNER TO postgres;

--
-- Name: termsandconditions_usertermsandconditions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.termsandconditions_usertermsandconditions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.termsandconditions_usertermsandconditions_id_seq OWNER TO postgres;

--
-- Name: termsandconditions_usertermsandconditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.termsandconditions_usertermsandconditions_id_seq OWNED BY public.termsandconditions_usertermsandconditions.id;


--
-- Name: trusted_ip_trustedip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trusted_ip_trustedip (
    id integer NOT NULL,
    ip character varying(255) NOT NULL
);


ALTER TABLE public.trusted_ip_trustedip OWNER TO postgres;

--
-- Name: trusted_ip_trustedip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trusted_ip_trustedip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trusted_ip_trustedip_id_seq OWNER TO postgres;

--
-- Name: trusted_ip_trustedip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trusted_ip_trustedip_id_seq OWNED BY public.trusted_ip_trustedip.id;


--
-- Name: two_factor_phonedevice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.two_factor_phonedevice (
    id integer NOT NULL,
    "user" character varying(255) NOT NULL,
    name character varying(64) NOT NULL,
    confirmed boolean NOT NULL,
    number character varying(40) NOT NULL,
    key character varying(40) NOT NULL,
    method character varying(4) NOT NULL
);


ALTER TABLE public.two_factor_phonedevice OWNER TO postgres;

--
-- Name: two_factor_phonedevice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.two_factor_phonedevice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.two_factor_phonedevice_id_seq OWNER TO postgres;

--
-- Name: two_factor_phonedevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.two_factor_phonedevice_id_seq OWNED BY public.two_factor_phonedevice.id;


--
-- Name: two_factor_staticdevice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.two_factor_staticdevice (
    id integer NOT NULL,
    "user" character varying(255) NOT NULL,
    name character varying(64) NOT NULL,
    confirmed boolean NOT NULL
);


ALTER TABLE public.two_factor_staticdevice OWNER TO postgres;

--
-- Name: two_factor_staticdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.two_factor_staticdevice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.two_factor_staticdevice_id_seq OWNER TO postgres;

--
-- Name: two_factor_staticdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.two_factor_staticdevice_id_seq OWNED BY public.two_factor_staticdevice.id;


--
-- Name: two_factor_statictoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.two_factor_statictoken (
    id integer NOT NULL,
    token character varying(16) NOT NULL,
    device_id integer NOT NULL
);


ALTER TABLE public.two_factor_statictoken OWNER TO postgres;

--
-- Name: two_factor_statictoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.two_factor_statictoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.two_factor_statictoken_id_seq OWNER TO postgres;

--
-- Name: two_factor_statictoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.two_factor_statictoken_id_seq OWNED BY public.two_factor_statictoken.id;


--
-- Name: two_factor_totpdevice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.two_factor_totpdevice (
    id integer NOT NULL,
    "user" character varying(255) NOT NULL,
    name character varying(64) NOT NULL,
    confirmed boolean NOT NULL,
    key character varying(80) NOT NULL,
    step smallint NOT NULL,
    t0 bigint NOT NULL,
    digits smallint NOT NULL,
    tolerance smallint NOT NULL,
    drift smallint NOT NULL,
    last_t bigint NOT NULL,
    CONSTRAINT two_factor_totpdevice_digits_check CHECK ((digits >= 0)),
    CONSTRAINT two_factor_totpdevice_step_check CHECK ((step >= 0)),
    CONSTRAINT two_factor_totpdevice_tolerance_check CHECK ((tolerance >= 0))
);


ALTER TABLE public.two_factor_totpdevice OWNER TO postgres;

--
-- Name: two_factor_totpdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.two_factor_totpdevice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.two_factor_totpdevice_id_seq OWNER TO postgres;

--
-- Name: two_factor_totpdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.two_factor_totpdevice_id_seq OWNED BY public.two_factor_totpdevice.id;


--
-- Name: wiki_groupwiki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiki_groupwiki (
    id integer NOT NULL,
    group_id integer NOT NULL,
    repo_id character varying(36) NOT NULL
);


ALTER TABLE public.wiki_groupwiki OWNER TO postgres;

--
-- Name: wiki_groupwiki_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiki_groupwiki_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wiki_groupwiki_id_seq OWNER TO postgres;

--
-- Name: wiki_groupwiki_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiki_groupwiki_id_seq OWNED BY public.wiki_groupwiki.id;


--
-- Name: wiki_personalwiki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiki_personalwiki (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    repo_id character varying(36) NOT NULL
);


ALTER TABLE public.wiki_personalwiki OWNER TO postgres;

--
-- Name: wiki_personalwiki_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiki_personalwiki_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wiki_personalwiki_id_seq OWNER TO postgres;

--
-- Name: wiki_personalwiki_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiki_personalwiki_id_seq OWNED BY public.wiki_personalwiki.id;


--
-- Name: wiki_wiki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiki_wiki (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    repo_id character varying(36) NOT NULL,
    permission character varying(50) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.wiki_wiki OWNER TO postgres;

--
-- Name: wiki_wiki_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiki_wiki_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wiki_wiki_id_seq OWNER TO postgres;

--
-- Name: wiki_wiki_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiki_wiki_id_seq OWNED BY public.wiki_wiki.id;


--
-- Name: abuse_reports_abusereport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abuse_reports_abusereport ALTER COLUMN id SET DEFAULT nextval('public.abuse_reports_abusereport_id_seq'::regclass);


--
-- Name: admin_log_adminlog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_log_adminlog ALTER COLUMN id SET DEFAULT nextval('public.admin_log_adminlog_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: avatar_avatar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avatar_avatar ALTER COLUMN id SET DEFAULT nextval('public.avatar_avatar_id_seq'::regclass);


--
-- Name: avatar_groupavatar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avatar_groupavatar ALTER COLUMN id SET DEFAULT nextval('public.avatar_groupavatar_id_seq'::regclass);


--
-- Name: base_commandslastcheck id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_commandslastcheck ALTER COLUMN id SET DEFAULT nextval('public.base_commandslastcheck_id_seq'::regclass);


--
-- Name: base_devicetoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_devicetoken ALTER COLUMN id SET DEFAULT nextval('public.base_devicetoken_id_seq'::regclass);


--
-- Name: base_filecomment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filecomment ALTER COLUMN id SET DEFAULT nextval('public.base_filecomment_id_seq'::regclass);


--
-- Name: base_filediscuss id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filediscuss ALTER COLUMN id SET DEFAULT nextval('public.base_filediscuss_id_seq'::regclass);


--
-- Name: base_groupenabledmodule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_groupenabledmodule ALTER COLUMN id SET DEFAULT nextval('public.base_groupenabledmodule_id_seq'::regclass);


--
-- Name: base_innerpubmsg id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_innerpubmsg ALTER COLUMN id SET DEFAULT nextval('public.base_innerpubmsg_id_seq'::regclass);


--
-- Name: base_innerpubmsgreply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_innerpubmsgreply ALTER COLUMN id SET DEFAULT nextval('public.base_innerpubmsgreply_id_seq'::regclass);


--
-- Name: base_reposecretkey id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_reposecretkey ALTER COLUMN id SET DEFAULT nextval('public.base_reposecretkey_id_seq'::regclass);


--
-- Name: base_userenabledmodule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_userenabledmodule ALTER COLUMN id SET DEFAULT nextval('public.base_userenabledmodule_id_seq'::regclass);


--
-- Name: base_userlastlogin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_userlastlogin ALTER COLUMN id SET DEFAULT nextval('public.base_userlastlogin_id_seq'::regclass);


--
-- Name: base_userstarredfiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_userstarredfiles ALTER COLUMN id SET DEFAULT nextval('public.base_userstarredfiles_id_seq'::regclass);


--
-- Name: captcha_captchastore id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.captcha_captchastore ALTER COLUMN id SET DEFAULT nextval('public.captcha_captchastore_id_seq'::regclass);


--
-- Name: constance_config id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constance_config ALTER COLUMN id SET DEFAULT nextval('public.constance_config_id_seq'::regclass);


--
-- Name: contacts_contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact ALTER COLUMN id SET DEFAULT nextval('public.contacts_contact_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: drafts_draft id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drafts_draft ALTER COLUMN id SET DEFAULT nextval('public.drafts_draft_id_seq'::regclass);


--
-- Name: drafts_draftreviewer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drafts_draftreviewer ALTER COLUMN id SET DEFAULT nextval('public.drafts_draftreviewer_id_seq'::regclass);


--
-- Name: file_participants_fileparticipant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_participants_fileparticipant ALTER COLUMN id SET DEFAULT nextval('public.file_participants_fileparticipant_id_seq'::regclass);


--
-- Name: file_tags_filetags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_tags_filetags ALTER COLUMN id SET DEFAULT nextval('public.file_tags_filetags_id_seq'::regclass);


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
-- Name: group_publicgroup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_publicgroup ALTER COLUMN id SET DEFAULT nextval('public.group_publicgroup_id_seq'::regclass);


--
-- Name: institutions_institution id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions_institution ALTER COLUMN id SET DEFAULT nextval('public.institutions_institution_id_seq'::regclass);


--
-- Name: institutions_institutionadmin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions_institutionadmin ALTER COLUMN id SET DEFAULT nextval('public.institutions_institutionadmin_id_seq'::regclass);


--
-- Name: institutions_institutionquota id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions_institutionquota ALTER COLUMN id SET DEFAULT nextval('public.institutions_institutionquota_id_seq'::regclass);


--
-- Name: invitations_invitation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitations_invitation ALTER COLUMN id SET DEFAULT nextval('public.invitations_invitation_id_seq'::regclass);


--
-- Name: notifications_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_notification ALTER COLUMN id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Name: notifications_usernotification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications_usernotification ALTER COLUMN id SET DEFAULT nextval('public.notifications_usernotification_id_seq'::regclass);


--
-- Name: options_useroptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options_useroptions ALTER COLUMN id SET DEFAULT nextval('public.options_useroptions_id_seq'::regclass);


--
-- Name: post_office_attachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_attachment ALTER COLUMN id SET DEFAULT nextval('public.post_office_attachment_id_seq'::regclass);


--
-- Name: post_office_attachment_emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_attachment_emails ALTER COLUMN id SET DEFAULT nextval('public.post_office_attachment_emails_id_seq'::regclass);


--
-- Name: post_office_email id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_email ALTER COLUMN id SET DEFAULT nextval('public.post_office_email_id_seq'::regclass);


--
-- Name: post_office_emailtemplate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_emailtemplate ALTER COLUMN id SET DEFAULT nextval('public.post_office_emailtemplate_id_seq'::regclass);


--
-- Name: post_office_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_log ALTER COLUMN id SET DEFAULT nextval('public.post_office_log_id_seq'::regclass);


--
-- Name: profile_detailedprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_detailedprofile ALTER COLUMN id SET DEFAULT nextval('public.profile_detailedprofile_id_seq'::regclass);


--
-- Name: profile_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_profile ALTER COLUMN id SET DEFAULT nextval('public.profile_profile_id_seq'::regclass);


--
-- Name: registration_registrationprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('public.registration_registrationprofile_id_seq'::regclass);


--
-- Name: related_files_relatedfiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.related_files_relatedfiles ALTER COLUMN id SET DEFAULT nextval('public.related_files_relatedfiles_id_seq'::regclass);


--
-- Name: repo_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.repo_api_tokens_id_seq'::regclass);


--
-- Name: repo_tags_repotags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_tags_repotags ALTER COLUMN id SET DEFAULT nextval('public.repo_tags_repotags_id_seq'::regclass);


--
-- Name: revision_tag_revisiontags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revision_tag_revisiontags ALTER COLUMN id SET DEFAULT nextval('public.revision_tag_revisiontags_id_seq'::regclass);


--
-- Name: revision_tag_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revision_tag_tags ALTER COLUMN id SET DEFAULT nextval('public.revision_tag_tags_id_seq'::regclass);


--
-- Name: role_permissions_adminrole id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions_adminrole ALTER COLUMN id SET DEFAULT nextval('public.role_permissions_adminrole_id_seq'::regclass);


--
-- Name: share_anonymousshare id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_anonymousshare ALTER COLUMN id SET DEFAULT nextval('public.share_anonymousshare_id_seq'::regclass);


--
-- Name: share_extragroupssharepermission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_extragroupssharepermission ALTER COLUMN id SET DEFAULT nextval('public.share_extragroupssharepermission_id_seq'::regclass);


--
-- Name: share_extrasharepermission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_extrasharepermission ALTER COLUMN id SET DEFAULT nextval('public.share_extrasharepermission_id_seq'::regclass);


--
-- Name: share_fileshare id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_fileshare ALTER COLUMN id SET DEFAULT nextval('public.share_fileshare_id_seq'::regclass);


--
-- Name: share_orgfileshare id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_orgfileshare ALTER COLUMN id SET DEFAULT nextval('public.share_orgfileshare_id_seq'::regclass);


--
-- Name: share_privatefiledirshare id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_privatefiledirshare ALTER COLUMN id SET DEFAULT nextval('public.share_privatefiledirshare_id_seq'::regclass);


--
-- Name: share_uploadlinkshare id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_uploadlinkshare ALTER COLUMN id SET DEFAULT nextval('public.share_uploadlinkshare_id_seq'::regclass);


--
-- Name: tags_filetag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_filetag ALTER COLUMN id SET DEFAULT nextval('public.tags_filetag_id_seq'::regclass);


--
-- Name: tags_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_tags ALTER COLUMN id SET DEFAULT nextval('public.tags_tags_id_seq'::regclass);


--
-- Name: termsandconditions_termsandconditions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_termsandconditions ALTER COLUMN id SET DEFAULT nextval('public.termsandconditions_termsandconditions_id_seq'::regclass);


--
-- Name: termsandconditions_usertermsandconditions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_usertermsandconditions ALTER COLUMN id SET DEFAULT nextval('public.termsandconditions_usertermsandconditions_id_seq'::regclass);


--
-- Name: trusted_ip_trustedip id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trusted_ip_trustedip ALTER COLUMN id SET DEFAULT nextval('public.trusted_ip_trustedip_id_seq'::regclass);


--
-- Name: two_factor_phonedevice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_phonedevice ALTER COLUMN id SET DEFAULT nextval('public.two_factor_phonedevice_id_seq'::regclass);


--
-- Name: two_factor_staticdevice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_staticdevice ALTER COLUMN id SET DEFAULT nextval('public.two_factor_staticdevice_id_seq'::regclass);


--
-- Name: two_factor_statictoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_statictoken ALTER COLUMN id SET DEFAULT nextval('public.two_factor_statictoken_id_seq'::regclass);


--
-- Name: two_factor_totpdevice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_totpdevice ALTER COLUMN id SET DEFAULT nextval('public.two_factor_totpdevice_id_seq'::regclass);


--
-- Name: wiki_groupwiki id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_groupwiki ALTER COLUMN id SET DEFAULT nextval('public.wiki_groupwiki_id_seq'::regclass);


--
-- Name: wiki_personalwiki id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_personalwiki ALTER COLUMN id SET DEFAULT nextval('public.wiki_personalwiki_id_seq'::regclass);


--
-- Name: wiki_wiki id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_wiki ALTER COLUMN id SET DEFAULT nextval('public.wiki_wiki_id_seq'::regclass);


--
-- Name: abuse_reports_abusereport abuse_reports_abusereport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abuse_reports_abusereport
    ADD CONSTRAINT abuse_reports_abusereport_pkey PRIMARY KEY (id);


--
-- Name: admin_log_adminlog admin_log_adminlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_log_adminlog
    ADD CONSTRAINT admin_log_adminlog_pkey PRIMARY KEY (id);


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
-- Name: api2_tokenv2 api2_tokenv2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api2_tokenv2
    ADD CONSTRAINT api2_tokenv2_pkey PRIMARY KEY (key);


--
-- Name: api2_tokenv2 api2_tokenv2_user_platform_device_id_37005c24_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api2_tokenv2
    ADD CONSTRAINT api2_tokenv2_user_platform_device_id_37005c24_uniq UNIQUE ("user", platform, device_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


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
-- Name: base_clientlogintoken base_clientlogintoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_clientlogintoken
    ADD CONSTRAINT base_clientlogintoken_pkey PRIMARY KEY (token);


--
-- Name: base_commandslastcheck base_commandslastcheck_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_commandslastcheck
    ADD CONSTRAINT base_commandslastcheck_pkey PRIMARY KEY (id);


--
-- Name: base_devicetoken base_devicetoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_devicetoken
    ADD CONSTRAINT base_devicetoken_pkey PRIMARY KEY (id);


--
-- Name: base_devicetoken base_devicetoken_token_user_38535636_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_devicetoken
    ADD CONSTRAINT base_devicetoken_token_user_38535636_uniq UNIQUE (token, "user");


--
-- Name: base_filecomment base_filecomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filecomment
    ADD CONSTRAINT base_filecomment_pkey PRIMARY KEY (id);


--
-- Name: base_filediscuss base_filediscuss_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filediscuss
    ADD CONSTRAINT base_filediscuss_pkey PRIMARY KEY (id);


--
-- Name: base_groupenabledmodule base_groupenabledmodule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_groupenabledmodule
    ADD CONSTRAINT base_groupenabledmodule_pkey PRIMARY KEY (id);


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
-- Name: base_reposecretkey base_reposecretkey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_reposecretkey
    ADD CONSTRAINT base_reposecretkey_pkey PRIMARY KEY (id);


--
-- Name: base_reposecretkey base_reposecretkey_repo_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_reposecretkey
    ADD CONSTRAINT base_reposecretkey_repo_id_key UNIQUE (repo_id);


--
-- Name: base_userenabledmodule base_userenabledmodule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_userenabledmodule
    ADD CONSTRAINT base_userenabledmodule_pkey PRIMARY KEY (id);


--
-- Name: base_userlastlogin base_userlastlogin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_userlastlogin
    ADD CONSTRAINT base_userlastlogin_pkey PRIMARY KEY (id);


--
-- Name: base_userstarredfiles base_userstarredfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_userstarredfiles
    ADD CONSTRAINT base_userstarredfiles_pkey PRIMARY KEY (id);


--
-- Name: captcha_captchastore captcha_captchastore_hashkey_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_hashkey_key UNIQUE (hashkey);


--
-- Name: captcha_captchastore captcha_captchastore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_pkey PRIMARY KEY (id);


--
-- Name: constance_config constance_config_constance_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constance_config
    ADD CONSTRAINT constance_config_constance_key_key UNIQUE (constance_key);


--
-- Name: constance_config constance_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constance_config
    ADD CONSTRAINT constance_config_pkey PRIMARY KEY (id);


--
-- Name: contacts_contact contacts_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact
    ADD CONSTRAINT contacts_contact_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: drafts_draft drafts_draft_origin_file_uuid_7c003c98_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drafts_draft
    ADD CONSTRAINT drafts_draft_origin_file_uuid_7c003c98_uniq UNIQUE (origin_file_uuid);


--
-- Name: drafts_draft drafts_draft_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drafts_draft
    ADD CONSTRAINT drafts_draft_pkey PRIMARY KEY (id);


--
-- Name: drafts_draftreviewer drafts_draftreviewer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drafts_draftreviewer
    ADD CONSTRAINT drafts_draftreviewer_pkey PRIMARY KEY (id);


--
-- Name: file_participants_fileparticipant file_participants_filepa_uuid_id_username_c747dd36_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_participants_fileparticipant
    ADD CONSTRAINT file_participants_filepa_uuid_id_username_c747dd36_uniq UNIQUE (uuid_id, username);


--
-- Name: file_participants_fileparticipant file_participants_fileparticipant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_participants_fileparticipant
    ADD CONSTRAINT file_participants_fileparticipant_pkey PRIMARY KEY (id);


--
-- Name: file_tags_filetags file_tags_filetags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_tags_filetags
    ADD CONSTRAINT file_tags_filetags_pkey PRIMARY KEY (id);


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
-- Name: group_publicgroup group_publicgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_publicgroup
    ADD CONSTRAINT group_publicgroup_pkey PRIMARY KEY (id);


--
-- Name: institutions_institution institutions_institution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions_institution
    ADD CONSTRAINT institutions_institution_pkey PRIMARY KEY (id);


--
-- Name: institutions_institutionadmin institutions_institutionadmin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions_institutionadmin
    ADD CONSTRAINT institutions_institutionadmin_pkey PRIMARY KEY (id);


--
-- Name: institutions_institutionquota institutions_institutionquota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions_institutionquota
    ADD CONSTRAINT institutions_institutionquota_pkey PRIMARY KEY (id);


--
-- Name: invitations_invitation invitations_invitation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invitations_invitation
    ADD CONSTRAINT invitations_invitation_pkey PRIMARY KEY (id);


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
-- Name: options_useroptions options_useroptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options_useroptions
    ADD CONSTRAINT options_useroptions_pkey PRIMARY KEY (id);


--
-- Name: post_office_attachment_emails post_office_attachment_e_attachment_id_email_id_8e046917_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_attachment_emails
    ADD CONSTRAINT post_office_attachment_e_attachment_id_email_id_8e046917_uniq UNIQUE (attachment_id, email_id);


--
-- Name: post_office_attachment_emails post_office_attachment_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_attachment_emails
    ADD CONSTRAINT post_office_attachment_emails_pkey PRIMARY KEY (id);


--
-- Name: post_office_attachment post_office_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_attachment
    ADD CONSTRAINT post_office_attachment_pkey PRIMARY KEY (id);


--
-- Name: post_office_email post_office_email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_email
    ADD CONSTRAINT post_office_email_pkey PRIMARY KEY (id);


--
-- Name: post_office_emailtemplate post_office_emailtemplat_name_language_default_te_4023e3e4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_emailtemplate
    ADD CONSTRAINT post_office_emailtemplat_name_language_default_te_4023e3e4_uniq UNIQUE (name, language, default_template_id);


--
-- Name: post_office_emailtemplate post_office_emailtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_emailtemplate
    ADD CONSTRAINT post_office_emailtemplate_pkey PRIMARY KEY (id);


--
-- Name: post_office_log post_office_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_log
    ADD CONSTRAINT post_office_log_pkey PRIMARY KEY (id);


--
-- Name: profile_detailedprofile profile_detailedprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_detailedprofile
    ADD CONSTRAINT profile_detailedprofile_pkey PRIMARY KEY (id);


--
-- Name: profile_profile profile_profile_contact_email_0975e4bf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_profile
    ADD CONSTRAINT profile_profile_contact_email_0975e4bf_uniq UNIQUE (contact_email);


--
-- Name: profile_profile profile_profile_login_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_profile
    ADD CONSTRAINT profile_profile_login_id_key UNIQUE (login_id);


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
-- Name: related_files_relatedfiles related_files_relatedfiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.related_files_relatedfiles
    ADD CONSTRAINT related_files_relatedfiles_pkey PRIMARY KEY (id);


--
-- Name: repo_api_tokens repo_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_api_tokens
    ADD CONSTRAINT repo_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: repo_api_tokens repo_api_tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_api_tokens
    ADD CONSTRAINT repo_api_tokens_token_key UNIQUE (token);


--
-- Name: repo_tags_repotags repo_tags_repotags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repo_tags_repotags
    ADD CONSTRAINT repo_tags_repotags_pkey PRIMARY KEY (id);


--
-- Name: revision_tag_revisiontags revision_tag_revisiontags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revision_tag_revisiontags
    ADD CONSTRAINT revision_tag_revisiontags_pkey PRIMARY KEY (id);


--
-- Name: revision_tag_tags revision_tag_tags_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revision_tag_tags
    ADD CONSTRAINT revision_tag_tags_name_key UNIQUE (name);


--
-- Name: revision_tag_tags revision_tag_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revision_tag_tags
    ADD CONSTRAINT revision_tag_tags_pkey PRIMARY KEY (id);


--
-- Name: role_permissions_adminrole role_permissions_adminrole_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions_adminrole
    ADD CONSTRAINT role_permissions_adminrole_email_key UNIQUE (email);


--
-- Name: role_permissions_adminrole role_permissions_adminrole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions_adminrole
    ADD CONSTRAINT role_permissions_adminrole_pkey PRIMARY KEY (id);


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
-- Name: share_extragroupssharepermission share_extragroupssharepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_extragroupssharepermission
    ADD CONSTRAINT share_extragroupssharepermission_pkey PRIMARY KEY (id);


--
-- Name: share_extrasharepermission share_extrasharepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_extrasharepermission
    ADD CONSTRAINT share_extrasharepermission_pkey PRIMARY KEY (id);


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
-- Name: share_orgfileshare share_orgfileshare_file_share_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_orgfileshare
    ADD CONSTRAINT share_orgfileshare_file_share_id_key UNIQUE (file_share_id);


--
-- Name: share_orgfileshare share_orgfileshare_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_orgfileshare
    ADD CONSTRAINT share_orgfileshare_pkey PRIMARY KEY (id);


--
-- Name: share_privatefiledirshare share_privatefiledirshare_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_privatefiledirshare
    ADD CONSTRAINT share_privatefiledirshare_pkey PRIMARY KEY (id);


--
-- Name: share_privatefiledirshare share_privatefiledirshare_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_privatefiledirshare
    ADD CONSTRAINT share_privatefiledirshare_token_key UNIQUE (token);


--
-- Name: share_uploadlinkshare share_uploadlinkshare_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_uploadlinkshare
    ADD CONSTRAINT share_uploadlinkshare_pkey PRIMARY KEY (id);


--
-- Name: share_uploadlinkshare share_uploadlinkshare_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_uploadlinkshare
    ADD CONSTRAINT share_uploadlinkshare_token_key UNIQUE (token);


--
-- Name: tags_filetag tags_filetag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_filetag
    ADD CONSTRAINT tags_filetag_pkey PRIMARY KEY (id);


--
-- Name: tags_fileuuidmap tags_fileuuidmap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_fileuuidmap
    ADD CONSTRAINT tags_fileuuidmap_pkey PRIMARY KEY (uuid);


--
-- Name: tags_tags tags_tags_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_tags
    ADD CONSTRAINT tags_tags_name_key UNIQUE (name);


--
-- Name: tags_tags tags_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_tags
    ADD CONSTRAINT tags_tags_pkey PRIMARY KEY (id);


--
-- Name: termsandconditions_termsandconditions termsandconditions_termsandconditions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_termsandconditions
    ADD CONSTRAINT termsandconditions_termsandconditions_pkey PRIMARY KEY (id);


--
-- Name: termsandconditions_usertermsandconditions termsandconditions_usert_username_terms_id_a7dabb70_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_usertermsandconditions
    ADD CONSTRAINT termsandconditions_usert_username_terms_id_a7dabb70_uniq UNIQUE (username, terms_id);


--
-- Name: termsandconditions_usertermsandconditions termsandconditions_usertermsandconditions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_usertermsandconditions
    ADD CONSTRAINT termsandconditions_usertermsandconditions_pkey PRIMARY KEY (id);


--
-- Name: trusted_ip_trustedip trusted_ip_trustedip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trusted_ip_trustedip
    ADD CONSTRAINT trusted_ip_trustedip_pkey PRIMARY KEY (id);


--
-- Name: two_factor_phonedevice two_factor_phonedevice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_phonedevice
    ADD CONSTRAINT two_factor_phonedevice_pkey PRIMARY KEY (id);


--
-- Name: two_factor_phonedevice two_factor_phonedevice_user_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_phonedevice
    ADD CONSTRAINT two_factor_phonedevice_user_key UNIQUE ("user");


--
-- Name: two_factor_staticdevice two_factor_staticdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_staticdevice
    ADD CONSTRAINT two_factor_staticdevice_pkey PRIMARY KEY (id);


--
-- Name: two_factor_staticdevice two_factor_staticdevice_user_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_staticdevice
    ADD CONSTRAINT two_factor_staticdevice_user_key UNIQUE ("user");


--
-- Name: two_factor_statictoken two_factor_statictoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_statictoken
    ADD CONSTRAINT two_factor_statictoken_pkey PRIMARY KEY (id);


--
-- Name: two_factor_totpdevice two_factor_totpdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_totpdevice
    ADD CONSTRAINT two_factor_totpdevice_pkey PRIMARY KEY (id);


--
-- Name: two_factor_totpdevice two_factor_totpdevice_user_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_totpdevice
    ADD CONSTRAINT two_factor_totpdevice_user_key UNIQUE ("user");


--
-- Name: wiki_groupwiki wiki_groupwiki_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_groupwiki
    ADD CONSTRAINT wiki_groupwiki_group_id_key UNIQUE (group_id);


--
-- Name: wiki_groupwiki wiki_groupwiki_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_groupwiki
    ADD CONSTRAINT wiki_groupwiki_pkey PRIMARY KEY (id);


--
-- Name: wiki_personalwiki wiki_personalwiki_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_personalwiki
    ADD CONSTRAINT wiki_personalwiki_pkey PRIMARY KEY (id);


--
-- Name: wiki_personalwiki wiki_personalwiki_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_personalwiki
    ADD CONSTRAINT wiki_personalwiki_username_key UNIQUE (username);


--
-- Name: wiki_wiki wiki_wiki_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_wiki
    ADD CONSTRAINT wiki_wiki_pkey PRIMARY KEY (id);


--
-- Name: wiki_wiki wiki_wiki_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_wiki
    ADD CONSTRAINT wiki_wiki_slug_key UNIQUE (slug);


--
-- Name: wiki_wiki wiki_wiki_username_repo_id_4c8925af_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_wiki
    ADD CONSTRAINT wiki_wiki_username_repo_id_4c8925af_uniq UNIQUE (username, repo_id);


--
-- Name: abuse_reports_abusereport_abuse_type_703d5335; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX abuse_reports_abusereport_abuse_type_703d5335 ON public.abuse_reports_abusereport USING btree (abuse_type);


--
-- Name: abuse_reports_abusereport_abuse_type_703d5335_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX abuse_reports_abusereport_abuse_type_703d5335_like ON public.abuse_reports_abusereport USING btree (abuse_type varchar_pattern_ops);


--
-- Name: abuse_reports_abusereport_handled_94b8304c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX abuse_reports_abusereport_handled_94b8304c ON public.abuse_reports_abusereport USING btree (handled);


--
-- Name: admin_log_adminlog_email_7213c993; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_log_adminlog_email_7213c993 ON public.admin_log_adminlog USING btree (email);


--
-- Name: admin_log_adminlog_email_7213c993_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_log_adminlog_email_7213c993_like ON public.admin_log_adminlog USING btree (email varchar_pattern_ops);


--
-- Name: admin_log_adminlog_operation_4bad7bd1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_log_adminlog_operation_4bad7bd1 ON public.admin_log_adminlog USING btree (operation);


--
-- Name: admin_log_adminlog_operation_4bad7bd1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_log_adminlog_operation_4bad7bd1_like ON public.admin_log_adminlog USING btree (operation varchar_pattern_ops);


--
-- Name: api2_token_key_147c7063_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api2_token_key_147c7063_like ON public.api2_token USING btree (key varchar_pattern_ops);


--
-- Name: api2_token_user_5f6e7405_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api2_token_user_5f6e7405_like ON public.api2_token USING btree ("user" varchar_pattern_ops);


--
-- Name: api2_tokenv2_key_c197586d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api2_tokenv2_key_c197586d_like ON public.api2_tokenv2 USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: base_clientlogintoken_token_efb94fed_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_clientlogintoken_token_efb94fed_like ON public.base_clientlogintoken USING btree (token varchar_pattern_ops);


--
-- Name: base_clientlogintoken_username_4ad5d42c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_clientlogintoken_username_4ad5d42c ON public.base_clientlogintoken USING btree (username);


--
-- Name: base_clientlogintoken_username_4ad5d42c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_clientlogintoken_username_4ad5d42c_like ON public.base_clientlogintoken USING btree (username varchar_pattern_ops);


--
-- Name: base_filecomment_author_8a4d7e91; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_author_8a4d7e91 ON public.base_filecomment USING btree (author);


--
-- Name: base_filecomment_author_8a4d7e91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_author_8a4d7e91_like ON public.base_filecomment USING btree (author varchar_pattern_ops);


--
-- Name: base_filecomment_resolved_e0717eca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_resolved_e0717eca ON public.base_filecomment USING btree (resolved);


--
-- Name: base_filecomment_uuid_id_4f9a2ca2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_uuid_id_4f9a2ca2 ON public.base_filecomment USING btree (uuid_id);


--
-- Name: base_filediscuss_group_message_id_2f7d7046; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filediscuss_group_message_id_2f7d7046 ON public.base_filediscuss USING btree (group_message_id);


--
-- Name: base_filediscuss_path_hash_fd9f7348; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filediscuss_path_hash_fd9f7348 ON public.base_filediscuss USING btree (path_hash);


--
-- Name: base_filediscuss_path_hash_fd9f7348_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filediscuss_path_hash_fd9f7348_like ON public.base_filediscuss USING btree (path_hash varchar_pattern_ops);


--
-- Name: base_groupenabledmodule_group_id_8c06b5bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_groupenabledmodule_group_id_8c06b5bc ON public.base_groupenabledmodule USING btree (group_id);


--
-- Name: base_groupenabledmodule_group_id_8c06b5bc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_groupenabledmodule_group_id_8c06b5bc_like ON public.base_groupenabledmodule USING btree (group_id varchar_pattern_ops);


--
-- Name: base_innerpubmsgreply_reply_to_id_62ce6fe5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_innerpubmsgreply_reply_to_id_62ce6fe5 ON public.base_innerpubmsgreply USING btree (reply_to_id);


--
-- Name: base_reposecretkey_repo_id_a8a8b46b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_reposecretkey_repo_id_a8a8b46b_like ON public.base_reposecretkey USING btree (repo_id varchar_pattern_ops);


--
-- Name: base_userenabledmodule_username_4f1c3c88; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userenabledmodule_username_4f1c3c88 ON public.base_userenabledmodule USING btree (username);


--
-- Name: base_userenabledmodule_username_4f1c3c88_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userenabledmodule_username_4f1c3c88_like ON public.base_userenabledmodule USING btree (username varchar_pattern_ops);


--
-- Name: base_userlastlogin_username_270de06f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userlastlogin_username_270de06f ON public.base_userlastlogin USING btree (username);


--
-- Name: base_userlastlogin_username_270de06f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userlastlogin_username_270de06f_like ON public.base_userlastlogin USING btree (username varchar_pattern_ops);


--
-- Name: base_userstarredfiles_email_29e69053; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_email_29e69053 ON public.base_userstarredfiles USING btree (email);


--
-- Name: base_userstarredfiles_email_29e69053_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_email_29e69053_like ON public.base_userstarredfiles USING btree (email varchar_pattern_ops);


--
-- Name: base_userstarredfiles_repo_id_f5ecc00a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_repo_id_f5ecc00a ON public.base_userstarredfiles USING btree (repo_id);


--
-- Name: base_userstarredfiles_repo_id_f5ecc00a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_repo_id_f5ecc00a_like ON public.base_userstarredfiles USING btree (repo_id varchar_pattern_ops);


--
-- Name: captcha_captchastore_hashkey_cbe8d15a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX captcha_captchastore_hashkey_cbe8d15a_like ON public.captcha_captchastore USING btree (hashkey varchar_pattern_ops);


--
-- Name: constance_config_constance_key_3f797b95_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX constance_config_constance_key_3f797b95_like ON public.constance_config USING btree (constance_key varchar_pattern_ops);


--
-- Name: contacts_contact_user_email_149035d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_contact_user_email_149035d4 ON public.contacts_contact USING btree (user_email);


--
-- Name: contacts_contact_user_email_149035d4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_contact_user_email_149035d4_like ON public.contacts_contact USING btree (user_email varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: drafts_draft_created_at_e9f4523f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drafts_draft_created_at_e9f4523f ON public.drafts_draft USING btree (created_at);


--
-- Name: drafts_draft_origin_repo_id_8978ca2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drafts_draft_origin_repo_id_8978ca2c ON public.drafts_draft USING btree (origin_repo_id);


--
-- Name: drafts_draft_origin_repo_id_8978ca2c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drafts_draft_origin_repo_id_8978ca2c_like ON public.drafts_draft USING btree (origin_repo_id varchar_pattern_ops);


--
-- Name: drafts_draft_updated_at_0a144b05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drafts_draft_updated_at_0a144b05 ON public.drafts_draft USING btree (updated_at);


--
-- Name: drafts_draft_username_73e6738b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drafts_draft_username_73e6738b ON public.drafts_draft USING btree (username);


--
-- Name: drafts_draft_username_73e6738b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drafts_draft_username_73e6738b_like ON public.drafts_draft USING btree (username varchar_pattern_ops);


--
-- Name: drafts_draftreviewer_draft_id_4ea59775; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drafts_draftreviewer_draft_id_4ea59775 ON public.drafts_draftreviewer USING btree (draft_id);


--
-- Name: drafts_draftreviewer_reviewer_e4c777ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drafts_draftreviewer_reviewer_e4c777ac ON public.drafts_draftreviewer USING btree (reviewer);


--
-- Name: drafts_draftreviewer_reviewer_e4c777ac_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX drafts_draftreviewer_reviewer_e4c777ac_like ON public.drafts_draftreviewer USING btree (reviewer varchar_pattern_ops);


--
-- Name: file_participants_fileparticipant_uuid_id_861b7339; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_participants_fileparticipant_uuid_id_861b7339 ON public.file_participants_fileparticipant USING btree (uuid_id);


--
-- Name: file_tags_filetags_file_uuid_id_e30f0ec8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_tags_filetags_file_uuid_id_e30f0ec8 ON public.file_tags_filetags USING btree (file_uuid_id);


--
-- Name: file_tags_filetags_repo_tag_id_c39660cb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX file_tags_filetags_repo_tag_id_c39660cb ON public.file_tags_filetags USING btree (repo_tag_id);


--
-- Name: group_groupmessage_group_id_acc24329; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_groupmessage_group_id_acc24329 ON public.group_groupmessage USING btree (group_id);


--
-- Name: group_messageattachment_group_message_id_6edb6096; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_messageattachment_group_message_id_6edb6096 ON public.group_messageattachment USING btree (group_message_id);


--
-- Name: group_messagereply_reply_to_id_6562f0ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_messagereply_reply_to_id_6562f0ac ON public.group_messagereply USING btree (reply_to_id);


--
-- Name: group_publicgroup_group_id_c91e54ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_publicgroup_group_id_c91e54ce ON public.group_publicgroup USING btree (group_id);


--
-- Name: institutions_institutionadmin_institution_id_1e9bb58b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX institutions_institutionadmin_institution_id_1e9bb58b ON public.institutions_institutionadmin USING btree (institution_id);


--
-- Name: institutions_institutionadmin_user_c71d766d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX institutions_institutionadmin_user_c71d766d ON public.institutions_institutionadmin USING btree ("user");


--
-- Name: institutions_institutionadmin_user_c71d766d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX institutions_institutionadmin_user_c71d766d_like ON public.institutions_institutionadmin USING btree ("user" varchar_pattern_ops);


--
-- Name: institutions_institutionquota_institution_id_d23201d9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX institutions_institutionquota_institution_id_d23201d9 ON public.institutions_institutionquota USING btree (institution_id);


--
-- Name: invitations_invitation_inviter_b0a7b855; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invitations_invitation_inviter_b0a7b855 ON public.invitations_invitation USING btree (inviter);


--
-- Name: invitations_invitation_inviter_b0a7b855_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invitations_invitation_inviter_b0a7b855_like ON public.invitations_invitation USING btree (inviter varchar_pattern_ops);


--
-- Name: invitations_invitation_token_25a92a38; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invitations_invitation_token_25a92a38 ON public.invitations_invitation USING btree (token);


--
-- Name: invitations_invitation_token_25a92a38_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invitations_invitation_token_25a92a38_like ON public.invitations_invitation USING btree (token varchar_pattern_ops);


--
-- Name: notifications_notification_primary_4f95ec21; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_notification_primary_4f95ec21 ON public.notifications_notification USING btree ("primary");


--
-- Name: notifications_usernotification_msg_type_985afd02; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_msg_type_985afd02 ON public.notifications_usernotification USING btree (msg_type);


--
-- Name: notifications_usernotification_msg_type_985afd02_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_msg_type_985afd02_like ON public.notifications_usernotification USING btree (msg_type varchar_pattern_ops);


--
-- Name: notifications_usernotification_timestamp_125067e8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_timestamp_125067e8 ON public.notifications_usernotification USING btree ("timestamp");


--
-- Name: notifications_usernotification_to_user_6cadafa1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_to_user_6cadafa1 ON public.notifications_usernotification USING btree (to_user);


--
-- Name: notifications_usernotification_to_user_6cadafa1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_to_user_6cadafa1_like ON public.notifications_usernotification USING btree (to_user varchar_pattern_ops);


--
-- Name: options_useroptions_email_77d5726a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX options_useroptions_email_77d5726a ON public.options_useroptions USING btree (email);


--
-- Name: options_useroptions_email_77d5726a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX options_useroptions_email_77d5726a_like ON public.options_useroptions USING btree (email varchar_pattern_ops);


--
-- Name: options_useroptions_option_key_7bf7ae4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX options_useroptions_option_key_7bf7ae4b ON public.options_useroptions USING btree (option_key);


--
-- Name: options_useroptions_option_key_7bf7ae4b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX options_useroptions_option_key_7bf7ae4b_like ON public.options_useroptions USING btree (option_key varchar_pattern_ops);


--
-- Name: post_office_attachment_emails_attachment_id_6136fd9a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_attachment_emails_attachment_id_6136fd9a ON public.post_office_attachment_emails USING btree (attachment_id);


--
-- Name: post_office_attachment_emails_email_id_96875fd9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_attachment_emails_email_id_96875fd9 ON public.post_office_attachment_emails USING btree (email_id);


--
-- Name: post_office_email_created_1306952f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_email_created_1306952f ON public.post_office_email USING btree (created);


--
-- Name: post_office_email_last_updated_0ffcec35; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_email_last_updated_0ffcec35 ON public.post_office_email USING btree (last_updated);


--
-- Name: post_office_email_scheduled_time_3869ebec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_email_scheduled_time_3869ebec ON public.post_office_email USING btree (scheduled_time);


--
-- Name: post_office_email_status_013a896c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_email_status_013a896c ON public.post_office_email USING btree (status);


--
-- Name: post_office_email_template_id_417da7da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_email_template_id_417da7da ON public.post_office_email USING btree (template_id);


--
-- Name: post_office_emailtemplate_default_template_id_2ac2f889; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_emailtemplate_default_template_id_2ac2f889 ON public.post_office_emailtemplate USING btree (default_template_id);


--
-- Name: post_office_log_email_id_d42c8808; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_log_email_id_d42c8808 ON public.post_office_log USING btree (email_id);


--
-- Name: profile_detailedprofile_user_612c11ba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_detailedprofile_user_612c11ba ON public.profile_detailedprofile USING btree ("user");


--
-- Name: profile_detailedprofile_user_612c11ba_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_detailedprofile_user_612c11ba_like ON public.profile_detailedprofile USING btree ("user" varchar_pattern_ops);


--
-- Name: profile_profile_contact_email_0975e4bf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_contact_email_0975e4bf_like ON public.profile_profile USING btree (contact_email varchar_pattern_ops);


--
-- Name: profile_profile_institution_c0286bd1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_institution_c0286bd1 ON public.profile_profile USING btree (institution);


--
-- Name: profile_profile_institution_c0286bd1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_institution_c0286bd1_like ON public.profile_profile USING btree (institution varchar_pattern_ops);


--
-- Name: profile_profile_list_in_address_book_b1009a78; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_list_in_address_book_b1009a78 ON public.profile_profile USING btree (list_in_address_book);


--
-- Name: profile_profile_login_id_4f1c7256_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_login_id_4f1c7256_like ON public.profile_profile USING btree (login_id varchar_pattern_ops);


--
-- Name: profile_profile_user_bc7738b6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_user_bc7738b6_like ON public.profile_profile USING btree ("user" varchar_pattern_ops);


--
-- Name: related_files_relatedfiles_o_uuid_id_aaa8e613; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX related_files_relatedfiles_o_uuid_id_aaa8e613 ON public.related_files_relatedfiles USING btree (o_uuid_id);


--
-- Name: related_files_relatedfiles_r_uuid_id_031751df; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX related_files_relatedfiles_r_uuid_id_031751df ON public.related_files_relatedfiles USING btree (r_uuid_id);


--
-- Name: repo_api_tokens_app_name_7c395c31; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_api_tokens_app_name_7c395c31 ON public.repo_api_tokens USING btree (app_name);


--
-- Name: repo_api_tokens_app_name_7c395c31_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_api_tokens_app_name_7c395c31_like ON public.repo_api_tokens USING btree (app_name varchar_pattern_ops);


--
-- Name: repo_api_tokens_repo_id_47a50fef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_api_tokens_repo_id_47a50fef ON public.repo_api_tokens USING btree (repo_id);


--
-- Name: repo_api_tokens_repo_id_47a50fef_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_api_tokens_repo_id_47a50fef_like ON public.repo_api_tokens USING btree (repo_id varchar_pattern_ops);


--
-- Name: repo_api_tokens_token_59514aa5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_api_tokens_token_59514aa5_like ON public.repo_api_tokens USING btree (token varchar_pattern_ops);


--
-- Name: repo_tags_repotags_color_1292b6c1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_tags_repotags_color_1292b6c1 ON public.repo_tags_repotags USING btree (color);


--
-- Name: repo_tags_repotags_color_1292b6c1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_tags_repotags_color_1292b6c1_like ON public.repo_tags_repotags USING btree (color varchar_pattern_ops);


--
-- Name: repo_tags_repotags_name_3f4c9027; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_tags_repotags_name_3f4c9027 ON public.repo_tags_repotags USING btree (name);


--
-- Name: repo_tags_repotags_name_3f4c9027_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_tags_repotags_name_3f4c9027_like ON public.repo_tags_repotags USING btree (name varchar_pattern_ops);


--
-- Name: repo_tags_repotags_repo_id_1163a48f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_tags_repotags_repo_id_1163a48f ON public.repo_tags_repotags USING btree (repo_id);


--
-- Name: repo_tags_repotags_repo_id_1163a48f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX repo_tags_repotags_repo_id_1163a48f_like ON public.repo_tags_repotags USING btree (repo_id varchar_pattern_ops);


--
-- Name: revision_tag_revisiontags_repo_id_212c0c69; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX revision_tag_revisiontags_repo_id_212c0c69 ON public.revision_tag_revisiontags USING btree (repo_id);


--
-- Name: revision_tag_revisiontags_repo_id_212c0c69_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX revision_tag_revisiontags_repo_id_212c0c69_like ON public.revision_tag_revisiontags USING btree (repo_id varchar_pattern_ops);


--
-- Name: revision_tag_revisiontags_revision_id_fd9fe0f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX revision_tag_revisiontags_revision_id_fd9fe0f9 ON public.revision_tag_revisiontags USING btree (revision_id);


--
-- Name: revision_tag_revisiontags_revision_id_fd9fe0f9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX revision_tag_revisiontags_revision_id_fd9fe0f9_like ON public.revision_tag_revisiontags USING btree (revision_id varchar_pattern_ops);


--
-- Name: revision_tag_revisiontags_tag_id_ee4e9b00; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX revision_tag_revisiontags_tag_id_ee4e9b00 ON public.revision_tag_revisiontags USING btree (tag_id);


--
-- Name: revision_tag_revisiontags_username_3007d29e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX revision_tag_revisiontags_username_3007d29e ON public.revision_tag_revisiontags USING btree (username);


--
-- Name: revision_tag_revisiontags_username_3007d29e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX revision_tag_revisiontags_username_3007d29e_like ON public.revision_tag_revisiontags USING btree (username varchar_pattern_ops);


--
-- Name: revision_tag_tags_name_ee5c8866_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX revision_tag_tags_name_ee5c8866_like ON public.revision_tag_tags USING btree (name varchar_pattern_ops);


--
-- Name: role_permissions_adminrole_email_05521d46_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX role_permissions_adminrole_email_05521d46_like ON public.role_permissions_adminrole USING btree (email varchar_pattern_ops);


--
-- Name: share_anonymousshare_token_8345a5de_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_anonymousshare_token_8345a5de_like ON public.share_anonymousshare USING btree (token varchar_pattern_ops);


--
-- Name: share_extragroupssharepermission_group_id_6ca34bb2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_extragroupssharepermission_group_id_6ca34bb2 ON public.share_extragroupssharepermission USING btree (group_id);


--
-- Name: share_extragroupssharepermission_repo_id_38dbaea1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_extragroupssharepermission_repo_id_38dbaea1 ON public.share_extragroupssharepermission USING btree (repo_id);


--
-- Name: share_extragroupssharepermission_repo_id_38dbaea1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_extragroupssharepermission_repo_id_38dbaea1_like ON public.share_extragroupssharepermission USING btree (repo_id varchar_pattern_ops);


--
-- Name: share_extrasharepermission_repo_id_23cc10fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_extrasharepermission_repo_id_23cc10fc ON public.share_extrasharepermission USING btree (repo_id);


--
-- Name: share_extrasharepermission_repo_id_23cc10fc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_extrasharepermission_repo_id_23cc10fc_like ON public.share_extrasharepermission USING btree (repo_id varchar_pattern_ops);


--
-- Name: share_extrasharepermission_share_to_823c16cb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_extrasharepermission_share_to_823c16cb ON public.share_extrasharepermission USING btree (share_to);


--
-- Name: share_extrasharepermission_share_to_823c16cb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_extrasharepermission_share_to_823c16cb_like ON public.share_extrasharepermission USING btree (share_to varchar_pattern_ops);


--
-- Name: share_fileshare_permission_d12c353f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_permission_d12c353f ON public.share_fileshare USING btree (permission);


--
-- Name: share_fileshare_permission_d12c353f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_permission_d12c353f_like ON public.share_fileshare USING btree (permission varchar_pattern_ops);


--
-- Name: share_fileshare_repo_id_9b5ae27a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_repo_id_9b5ae27a ON public.share_fileshare USING btree (repo_id);


--
-- Name: share_fileshare_repo_id_9b5ae27a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_repo_id_9b5ae27a_like ON public.share_fileshare USING btree (repo_id varchar_pattern_ops);


--
-- Name: share_fileshare_s_type_724eb6c1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_s_type_724eb6c1 ON public.share_fileshare USING btree (s_type);


--
-- Name: share_fileshare_s_type_724eb6c1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_s_type_724eb6c1_like ON public.share_fileshare USING btree (s_type varchar_pattern_ops);


--
-- Name: share_fileshare_token_ccfce35c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_token_ccfce35c_like ON public.share_fileshare USING btree (token varchar_pattern_ops);


--
-- Name: share_fileshare_username_5cb6de75; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_username_5cb6de75 ON public.share_fileshare USING btree (username);


--
-- Name: share_fileshare_username_5cb6de75_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_username_5cb6de75_like ON public.share_fileshare USING btree (username varchar_pattern_ops);


--
-- Name: share_orgfileshare_org_id_8d17998c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_orgfileshare_org_id_8d17998c ON public.share_orgfileshare USING btree (org_id);


--
-- Name: share_privatefiledirshare_from_user_d568d535; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_from_user_d568d535 ON public.share_privatefiledirshare USING btree (from_user);


--
-- Name: share_privatefiledirshare_from_user_d568d535_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_from_user_d568d535_like ON public.share_privatefiledirshare USING btree (from_user varchar_pattern_ops);


--
-- Name: share_privatefiledirshare_repo_id_97c5cb6f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_repo_id_97c5cb6f ON public.share_privatefiledirshare USING btree (repo_id);


--
-- Name: share_privatefiledirshare_repo_id_97c5cb6f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_repo_id_97c5cb6f_like ON public.share_privatefiledirshare USING btree (repo_id varchar_pattern_ops);


--
-- Name: share_privatefiledirshare_to_user_2a92a044; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_to_user_2a92a044 ON public.share_privatefiledirshare USING btree (to_user);


--
-- Name: share_privatefiledirshare_to_user_2a92a044_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_to_user_2a92a044_like ON public.share_privatefiledirshare USING btree (to_user varchar_pattern_ops);


--
-- Name: share_privatefiledirshare_token_0f27ee3a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_token_0f27ee3a_like ON public.share_privatefiledirshare USING btree (token varchar_pattern_ops);


--
-- Name: share_uploadlinkshare_repo_id_c519f857; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_repo_id_c519f857 ON public.share_uploadlinkshare USING btree (repo_id);


--
-- Name: share_uploadlinkshare_repo_id_c519f857_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_repo_id_c519f857_like ON public.share_uploadlinkshare USING btree (repo_id varchar_pattern_ops);


--
-- Name: share_uploadlinkshare_token_a176e0d2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_token_a176e0d2_like ON public.share_uploadlinkshare USING btree (token varchar_pattern_ops);


--
-- Name: share_uploadlinkshare_username_3203c243; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_username_3203c243 ON public.share_uploadlinkshare USING btree (username);


--
-- Name: share_uploadlinkshare_username_3203c243_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_username_3203c243_like ON public.share_uploadlinkshare USING btree (username varchar_pattern_ops);


--
-- Name: tags_filetag_tag_id_0f264fc9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_filetag_tag_id_0f264fc9 ON public.tags_filetag USING btree (tag_id);


--
-- Name: tags_filetag_uuid_id_2aa2266c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_filetag_uuid_id_2aa2266c ON public.tags_filetag USING btree (uuid_id);


--
-- Name: tags_fileuuidmap_repo_id_ac67aa33; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_fileuuidmap_repo_id_ac67aa33 ON public.tags_fileuuidmap USING btree (repo_id);


--
-- Name: tags_fileuuidmap_repo_id_ac67aa33_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_fileuuidmap_repo_id_ac67aa33_like ON public.tags_fileuuidmap USING btree (repo_id varchar_pattern_ops);


--
-- Name: tags_fileuuidmap_repo_id_parent_path_md5_c8bb0860; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_fileuuidmap_repo_id_parent_path_md5_c8bb0860 ON public.tags_fileuuidmap USING btree (repo_id_parent_path_md5);


--
-- Name: tags_fileuuidmap_repo_id_parent_path_md5_c8bb0860_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_fileuuidmap_repo_id_parent_path_md5_c8bb0860_like ON public.tags_fileuuidmap USING btree (repo_id_parent_path_md5 varchar_pattern_ops);


--
-- Name: tags_tags_name_f991aa2c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_tags_name_f991aa2c_like ON public.tags_tags USING btree (name varchar_pattern_ops);


--
-- Name: termsandconditions_termsandconditions_slug_489d1e9d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termsandconditions_termsandconditions_slug_489d1e9d ON public.termsandconditions_termsandconditions USING btree (slug);


--
-- Name: termsandconditions_termsandconditions_slug_489d1e9d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termsandconditions_termsandconditions_slug_489d1e9d_like ON public.termsandconditions_termsandconditions USING btree (slug varchar_pattern_ops);


--
-- Name: termsandconditions_usertermsandconditions_terms_id_eacdbcc7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termsandconditions_usertermsandconditions_terms_id_eacdbcc7 ON public.termsandconditions_usertermsandconditions USING btree (terms_id);


--
-- Name: trusted_ip_trustedip_ip_e898970c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX trusted_ip_trustedip_ip_e898970c ON public.trusted_ip_trustedip USING btree (ip);


--
-- Name: trusted_ip_trustedip_ip_e898970c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX trusted_ip_trustedip_ip_e898970c_like ON public.trusted_ip_trustedip USING btree (ip varchar_pattern_ops);


--
-- Name: two_factor_phonedevice_user_0dbcb75b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX two_factor_phonedevice_user_0dbcb75b_like ON public.two_factor_phonedevice USING btree ("user" varchar_pattern_ops);


--
-- Name: two_factor_staticdevice_user_0356acab_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX two_factor_staticdevice_user_0356acab_like ON public.two_factor_staticdevice USING btree ("user" varchar_pattern_ops);


--
-- Name: two_factor_statictoken_device_id_93095b45; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX two_factor_statictoken_device_id_93095b45 ON public.two_factor_statictoken USING btree (device_id);


--
-- Name: two_factor_statictoken_token_2ade1084; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX two_factor_statictoken_token_2ade1084 ON public.two_factor_statictoken USING btree (token);


--
-- Name: two_factor_statictoken_token_2ade1084_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX two_factor_statictoken_token_2ade1084_like ON public.two_factor_statictoken USING btree (token varchar_pattern_ops);


--
-- Name: two_factor_totpdevice_user_16f296cb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX two_factor_totpdevice_user_16f296cb_like ON public.two_factor_totpdevice USING btree ("user" varchar_pattern_ops);


--
-- Name: wiki_personalwiki_username_3a4be339_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_personalwiki_username_3a4be339_like ON public.wiki_personalwiki USING btree (username varchar_pattern_ops);


--
-- Name: wiki_wiki_created_at_54930e39; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_wiki_created_at_54930e39 ON public.wiki_wiki USING btree (created_at);


--
-- Name: wiki_wiki_repo_id_2ee93c37; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_wiki_repo_id_2ee93c37 ON public.wiki_wiki USING btree (repo_id);


--
-- Name: wiki_wiki_repo_id_2ee93c37_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_wiki_repo_id_2ee93c37_like ON public.wiki_wiki USING btree (repo_id varchar_pattern_ops);


--
-- Name: wiki_wiki_slug_b4cf48af_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_wiki_slug_b4cf48af_like ON public.wiki_wiki USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_filecomment base_filecomment_uuid_id_4f9a2ca2_fk_tags_fileuuidmap_uuid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filecomment
    ADD CONSTRAINT base_filecomment_uuid_id_4f9a2ca2_fk_tags_fileuuidmap_uuid FOREIGN KEY (uuid_id) REFERENCES public.tags_fileuuidmap(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_filediscuss base_filediscuss_group_message_id_2f7d7046_fk_group_gro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filediscuss
    ADD CONSTRAINT base_filediscuss_group_message_id_2f7d7046_fk_group_gro FOREIGN KEY (group_message_id) REFERENCES public.group_groupmessage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_innerpubmsgreply base_innerpubmsgrepl_reply_to_id_62ce6fe5_fk_base_inne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_innerpubmsgreply
    ADD CONSTRAINT base_innerpubmsgrepl_reply_to_id_62ce6fe5_fk_base_inne FOREIGN KEY (reply_to_id) REFERENCES public.base_innerpubmsg(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: drafts_draftreviewer drafts_draftreviewer_draft_id_4ea59775_fk_drafts_draft_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drafts_draftreviewer
    ADD CONSTRAINT drafts_draftreviewer_draft_id_4ea59775_fk_drafts_draft_id FOREIGN KEY (draft_id) REFERENCES public.drafts_draft(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: file_participants_fileparticipant file_participants_fi_uuid_id_861b7339_fk_tags_file; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_participants_fileparticipant
    ADD CONSTRAINT file_participants_fi_uuid_id_861b7339_fk_tags_file FOREIGN KEY (uuid_id) REFERENCES public.tags_fileuuidmap(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: file_tags_filetags file_tags_filetags_file_uuid_id_e30f0ec8_fk_tags_file; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_tags_filetags
    ADD CONSTRAINT file_tags_filetags_file_uuid_id_e30f0ec8_fk_tags_file FOREIGN KEY (file_uuid_id) REFERENCES public.tags_fileuuidmap(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: file_tags_filetags file_tags_filetags_repo_tag_id_c39660cb_fk_repo_tags; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_tags_filetags
    ADD CONSTRAINT file_tags_filetags_repo_tag_id_c39660cb_fk_repo_tags FOREIGN KEY (repo_tag_id) REFERENCES public.repo_tags_repotags(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_messageattachment group_messageattachm_group_message_id_6edb6096_fk_group_gro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_messageattachment
    ADD CONSTRAINT group_messageattachm_group_message_id_6edb6096_fk_group_gro FOREIGN KEY (group_message_id) REFERENCES public.group_groupmessage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_messagereply group_messagereply_reply_to_id_6562f0ac_fk_group_gro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_messagereply
    ADD CONSTRAINT group_messagereply_reply_to_id_6562f0ac_fk_group_gro FOREIGN KEY (reply_to_id) REFERENCES public.group_groupmessage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: institutions_institutionadmin institutions_institu_institution_id_1e9bb58b_fk_instituti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions_institutionadmin
    ADD CONSTRAINT institutions_institu_institution_id_1e9bb58b_fk_instituti FOREIGN KEY (institution_id) REFERENCES public.institutions_institution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: institutions_institutionquota institutions_institu_institution_id_d23201d9_fk_instituti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions_institutionquota
    ADD CONSTRAINT institutions_institu_institution_id_d23201d9_fk_instituti FOREIGN KEY (institution_id) REFERENCES public.institutions_institution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_attachment_emails post_office_attachme_attachment_id_6136fd9a_fk_post_offi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_attachment_emails
    ADD CONSTRAINT post_office_attachme_attachment_id_6136fd9a_fk_post_offi FOREIGN KEY (attachment_id) REFERENCES public.post_office_attachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_attachment_emails post_office_attachme_email_id_96875fd9_fk_post_offi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_attachment_emails
    ADD CONSTRAINT post_office_attachme_email_id_96875fd9_fk_post_offi FOREIGN KEY (email_id) REFERENCES public.post_office_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_email post_office_email_template_id_417da7da_fk_post_offi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_email
    ADD CONSTRAINT post_office_email_template_id_417da7da_fk_post_offi FOREIGN KEY (template_id) REFERENCES public.post_office_emailtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_emailtemplate post_office_emailtem_default_template_id_2ac2f889_fk_post_offi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_emailtemplate
    ADD CONSTRAINT post_office_emailtem_default_template_id_2ac2f889_fk_post_offi FOREIGN KEY (default_template_id) REFERENCES public.post_office_emailtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_log post_office_log_email_id_d42c8808_fk_post_office_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_log
    ADD CONSTRAINT post_office_log_email_id_d42c8808_fk_post_office_email_id FOREIGN KEY (email_id) REFERENCES public.post_office_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: related_files_relatedfiles related_files_relate_o_uuid_id_aaa8e613_fk_tags_file; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.related_files_relatedfiles
    ADD CONSTRAINT related_files_relate_o_uuid_id_aaa8e613_fk_tags_file FOREIGN KEY (o_uuid_id) REFERENCES public.tags_fileuuidmap(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: related_files_relatedfiles related_files_relate_r_uuid_id_031751df_fk_tags_file; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.related_files_relatedfiles
    ADD CONSTRAINT related_files_relate_r_uuid_id_031751df_fk_tags_file FOREIGN KEY (r_uuid_id) REFERENCES public.tags_fileuuidmap(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: revision_tag_revisiontags revision_tag_revisio_tag_id_ee4e9b00_fk_revision_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revision_tag_revisiontags
    ADD CONSTRAINT revision_tag_revisio_tag_id_ee4e9b00_fk_revision_ FOREIGN KEY (tag_id) REFERENCES public.revision_tag_tags(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: share_orgfileshare share_orgfileshare_file_share_id_7890388b_fk_share_fileshare_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_orgfileshare
    ADD CONSTRAINT share_orgfileshare_file_share_id_7890388b_fk_share_fileshare_id FOREIGN KEY (file_share_id) REFERENCES public.share_fileshare(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tags_filetag tags_filetag_tag_id_0f264fc9_fk_tags_tags_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_filetag
    ADD CONSTRAINT tags_filetag_tag_id_0f264fc9_fk_tags_tags_id FOREIGN KEY (tag_id) REFERENCES public.tags_tags(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tags_filetag tags_filetag_uuid_id_2aa2266c_fk_tags_fileuuidmap_uuid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_filetag
    ADD CONSTRAINT tags_filetag_uuid_id_2aa2266c_fk_tags_fileuuidmap_uuid FOREIGN KEY (uuid_id) REFERENCES public.tags_fileuuidmap(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: termsandconditions_usertermsandconditions termsandconditions_u_terms_id_eacdbcc7_fk_termsandc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_usertermsandconditions
    ADD CONSTRAINT termsandconditions_u_terms_id_eacdbcc7_fk_termsandc FOREIGN KEY (terms_id) REFERENCES public.termsandconditions_termsandconditions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: two_factor_statictoken two_factor_statictok_device_id_93095b45_fk_two_facto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.two_factor_statictoken
    ADD CONSTRAINT two_factor_statictok_device_id_93095b45_fk_two_facto FOREIGN KEY (device_id) REFERENCES public.two_factor_staticdevice(id) DEFERRABLE INITIALLY DEFERRED;
