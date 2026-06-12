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
    repo_id character varying(36) NOT NULL,
    parent_path text NOT NULL,
    repo_id_parent_path_md5 character varying(100) NOT NULL,
    item_name text NOT NULL,
    author character varying(255) NOT NULL,
    comment text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
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
    group_message_id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    path text NOT NULL,
    path_hash character varying(12) NOT NULL
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
    reply_to_id integer NOT NULL,
    from_email character varying(254) NOT NULL,
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
    key character varying(255) NOT NULL,
    value text NOT NULL
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
    from_email character varying(255) NOT NULL,
    message text NOT NULL,
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
    "user" character varying(254) NOT NULL,
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
    name character varying(255) NOT NULL
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
    institution character varying(225)
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
-- Name: admin_log_adminlog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_log_adminlog ALTER COLUMN id SET DEFAULT nextval('public.admin_log_adminlog_id_seq'::regclass);


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
-- Name: share_anonymousshare id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_anonymousshare ALTER COLUMN id SET DEFAULT nextval('public.share_anonymousshare_id_seq'::regclass);


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
-- Name: termsandconditions_termsandconditions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_termsandconditions ALTER COLUMN id SET DEFAULT nextval('public.termsandconditions_termsandconditions_id_seq'::regclass);


--
-- Name: termsandconditions_usertermsandconditions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_usertermsandconditions ALTER COLUMN id SET DEFAULT nextval('public.termsandconditions_usertermsandconditions_id_seq'::regclass);


--
-- Name: wiki_groupwiki id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_groupwiki ALTER COLUMN id SET DEFAULT nextval('public.wiki_groupwiki_id_seq'::regclass);


--
-- Name: wiki_personalwiki id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_personalwiki ALTER COLUMN id SET DEFAULT nextval('public.wiki_personalwiki_id_seq'::regclass);


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
-- Name: api2_tokenv2 api2_tokenv2_user_platform_device_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api2_tokenv2
    ADD CONSTRAINT api2_tokenv2_user_platform_device_id_key UNIQUE ("user", platform, device_id);


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
-- Name: base_devicetoken base_devicetoken_token_user_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_devicetoken
    ADD CONSTRAINT base_devicetoken_token_user_key UNIQUE (token, "user");


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
-- Name: constance_config constance_config_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constance_config
    ADD CONSTRAINT constance_config_key_key UNIQUE (key);


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
-- Name: django_content_type django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


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
-- Name: post_office_attachment_emails post_office_attachment_emails_attachment_id_email_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_attachment_emails
    ADD CONSTRAINT post_office_attachment_emails_attachment_id_email_id_key UNIQUE (attachment_id, email_id);


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
-- Name: post_office_emailtemplate post_office_emailtemplate_language_29c8606d390b61ee_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_emailtemplate
    ADD CONSTRAINT post_office_emailtemplate_language_29c8606d390b61ee_uniq UNIQUE (language, default_template_id);


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
-- Name: termsandconditions_termsandconditions termsandconditions_termsandconditions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_termsandconditions
    ADD CONSTRAINT termsandconditions_termsandconditions_pkey PRIMARY KEY (id);


--
-- Name: termsandconditions_usertermsandconditions termsandconditions_usertermsandco_username_f4ab54cafa29322_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_usertermsandconditions
    ADD CONSTRAINT termsandconditions_usertermsandco_username_f4ab54cafa29322_uniq UNIQUE (username, terms_id);


--
-- Name: termsandconditions_usertermsandconditions termsandconditions_usertermsandconditions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_usertermsandconditions
    ADD CONSTRAINT termsandconditions_usertermsandconditions_pkey PRIMARY KEY (id);


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
-- Name: admin_log_adminlog_0c83f57c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_log_adminlog_0c83f57c ON public.admin_log_adminlog USING btree (email);


--
-- Name: admin_log_adminlog_email_692496e4e4ee76b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_log_adminlog_email_692496e4e4ee76b2_like ON public.admin_log_adminlog USING btree (email varchar_pattern_ops);


--
-- Name: admin_log_adminlog_f7235a61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_log_adminlog_f7235a61 ON public.admin_log_adminlog USING btree (operation);


--
-- Name: admin_log_adminlog_operation_70f64a82ef3b649d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_log_adminlog_operation_70f64a82ef3b649d_like ON public.admin_log_adminlog USING btree (operation varchar_pattern_ops);


--
-- Name: api2_token_key_1702fca53b2111dd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api2_token_key_1702fca53b2111dd_like ON public.api2_token USING btree (key varchar_pattern_ops);


--
-- Name: api2_token_user_2f7f6f880da976fa_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api2_token_user_2f7f6f880da976fa_like ON public.api2_token USING btree ("user" varchar_pattern_ops);


--
-- Name: api2_tokenv2_key_6aceee8fc64abacb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api2_tokenv2_key_6aceee8fc64abacb_like ON public.api2_tokenv2 USING btree (key varchar_pattern_ops);


--
-- Name: base_clientlogintoken_14c4b06b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_clientlogintoken_14c4b06b ON public.base_clientlogintoken USING btree (username);


--
-- Name: base_clientlogintoken_token_1a3cc4c3743786ed_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_clientlogintoken_token_1a3cc4c3743786ed_like ON public.base_clientlogintoken USING btree (token varchar_pattern_ops);


--
-- Name: base_clientlogintoken_username_6d801137abeca97d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_clientlogintoken_username_6d801137abeca97d_like ON public.base_clientlogintoken USING btree (username varchar_pattern_ops);


--
-- Name: base_filecomment_02bd92fa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_02bd92fa ON public.base_filecomment USING btree (author);


--
-- Name: base_filecomment_9a8c79bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_9a8c79bf ON public.base_filecomment USING btree (repo_id);


--
-- Name: base_filecomment_author_4bc7d2c4c5e2aea5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_author_4bc7d2c4c5e2aea5_like ON public.base_filecomment USING btree (author varchar_pattern_ops);


--
-- Name: base_filecomment_c5bf47d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_c5bf47d4 ON public.base_filecomment USING btree (repo_id_parent_path_md5);


--
-- Name: base_filecomment_repo_id_5e56401f7f531e67_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_repo_id_5e56401f7f531e67_like ON public.base_filecomment USING btree (repo_id varchar_pattern_ops);


--
-- Name: base_filecomment_repo_id_parent_path_md5_51a8406973fbd3ef_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecomment_repo_id_parent_path_md5_51a8406973fbd3ef_like ON public.base_filecomment USING btree (repo_id_parent_path_md5 varchar_pattern_ops);


--
-- Name: base_filediscuss_06a351d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filediscuss_06a351d8 ON public.base_filediscuss USING btree (group_message_id);


--
-- Name: base_filediscuss_b57d9b6b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filediscuss_b57d9b6b ON public.base_filediscuss USING btree (path_hash);


--
-- Name: base_filediscuss_path_hash_7c8f55cb46f72eb2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filediscuss_path_hash_7c8f55cb46f72eb2_like ON public.base_filediscuss USING btree (path_hash varchar_pattern_ops);


--
-- Name: base_groupenabledmodule_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_groupenabledmodule_0e939a4f ON public.base_groupenabledmodule USING btree (group_id);


--
-- Name: base_groupenabledmodule_group_id_1e08fcbec4c7b817_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_groupenabledmodule_group_id_1e08fcbec4c7b817_like ON public.base_groupenabledmodule USING btree (group_id varchar_pattern_ops);


--
-- Name: base_innerpubmsgreply_6ec85d95; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_innerpubmsgreply_6ec85d95 ON public.base_innerpubmsgreply USING btree (reply_to_id);


--
-- Name: base_userenabledmodule_14c4b06b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userenabledmodule_14c4b06b ON public.base_userenabledmodule USING btree (username);


--
-- Name: base_userenabledmodule_username_4ee666ad4b01f34f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userenabledmodule_username_4ee666ad4b01f34f_like ON public.base_userenabledmodule USING btree (username varchar_pattern_ops);


--
-- Name: base_userlastlogin_14c4b06b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userlastlogin_14c4b06b ON public.base_userlastlogin USING btree (username);


--
-- Name: base_userlastlogin_username_2ca74a3c6267a781_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userlastlogin_username_2ca74a3c6267a781_like ON public.base_userlastlogin USING btree (username varchar_pattern_ops);


--
-- Name: base_userstarredfiles_0c83f57c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_0c83f57c ON public.base_userstarredfiles USING btree (email);


--
-- Name: base_userstarredfiles_9a8c79bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_9a8c79bf ON public.base_userstarredfiles USING btree (repo_id);


--
-- Name: base_userstarredfiles_email_1a51b84a5db93d08_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_email_1a51b84a5db93d08_like ON public.base_userstarredfiles USING btree (email varchar_pattern_ops);


--
-- Name: base_userstarredfiles_repo_id_45317074751c3eb2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_repo_id_45317074751c3eb2_like ON public.base_userstarredfiles USING btree (repo_id varchar_pattern_ops);


--
-- Name: captcha_captchastore_hashkey_1b174beafa2fcebb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX captcha_captchastore_hashkey_1b174beafa2fcebb_like ON public.captcha_captchastore USING btree (hashkey varchar_pattern_ops);


--
-- Name: constance_config_key_301aec6d7a4fb304_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX constance_config_key_301aec6d7a4fb304_like ON public.constance_config USING btree (key varchar_pattern_ops);


--
-- Name: contacts_contact_40c27bdc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_contact_40c27bdc ON public.contacts_contact USING btree (user_email);


--
-- Name: contacts_contact_user_email_263a5c37243533f5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_contact_user_email_263a5c37243533f5_like ON public.contacts_contact USING btree (user_email varchar_pattern_ops);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_de54fa62 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: group_groupmessage_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_groupmessage_0e939a4f ON public.group_groupmessage USING btree (group_id);


--
-- Name: group_messageattachment_06a351d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_messageattachment_06a351d8 ON public.group_messageattachment USING btree (group_message_id);


--
-- Name: group_messagereply_6ec85d95; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_messagereply_6ec85d95 ON public.group_messagereply USING btree (reply_to_id);


--
-- Name: group_publicgroup_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_publicgroup_0e939a4f ON public.group_publicgroup USING btree (group_id);


--
-- Name: institutions_institutionadmin_a964baeb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX institutions_institutionadmin_a964baeb ON public.institutions_institutionadmin USING btree (institution_id);


--
-- Name: institutions_institutionquota_a964baeb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX institutions_institutionquota_a964baeb ON public.institutions_institutionquota USING btree (institution_id);


--
-- Name: invitations_invitation_d5dd16f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invitations_invitation_d5dd16f8 ON public.invitations_invitation USING btree (inviter);


--
-- Name: invitations_invitation_inviter_690eefce1e856ecf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invitations_invitation_inviter_690eefce1e856ecf_like ON public.invitations_invitation USING btree (inviter varchar_pattern_ops);


--
-- Name: invitations_invitation_token_1961fbb98c05e5fd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invitations_invitation_token_1961fbb98c05e5fd_like ON public.invitations_invitation USING btree (token varchar_pattern_ops);


--
-- Name: invitations_invitation_token_1961fbb98c05e5fd_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX invitations_invitation_token_1961fbb98c05e5fd_uniq ON public.invitations_invitation USING btree (token);


--
-- Name: notifications_usernotification_486af403; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_486af403 ON public.notifications_usernotification USING btree (msg_type);


--
-- Name: notifications_usernotification_86899d6f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_86899d6f ON public.notifications_usernotification USING btree (to_user);


--
-- Name: notifications_usernotification_msg_type_69ef5b6a61b73b64_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_msg_type_69ef5b6a61b73b64_like ON public.notifications_usernotification USING btree (msg_type varchar_pattern_ops);


--
-- Name: notifications_usernotification_to_user_1c3555156c65e152_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX notifications_usernotification_to_user_1c3555156c65e152_like ON public.notifications_usernotification USING btree (to_user varchar_pattern_ops);


--
-- Name: options_useroptions_0c83f57c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX options_useroptions_0c83f57c ON public.options_useroptions USING btree (email);


--
-- Name: options_useroptions_email_1c08438469127c2f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX options_useroptions_email_1c08438469127c2f_like ON public.options_useroptions USING btree (email varchar_pattern_ops);


--
-- Name: post_office_attachment_emails_07ba63f5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_attachment_emails_07ba63f5 ON public.post_office_attachment_emails USING btree (attachment_id);


--
-- Name: post_office_attachment_emails_fdfd0ebf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_attachment_emails_fdfd0ebf ON public.post_office_attachment_emails USING btree (email_id);


--
-- Name: post_office_email_3acc0b7a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_email_3acc0b7a ON public.post_office_email USING btree (last_updated);


--
-- Name: post_office_email_74f53564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_email_74f53564 ON public.post_office_email USING btree (template_id);


--
-- Name: post_office_email_9acb4454; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_email_9acb4454 ON public.post_office_email USING btree (status);


--
-- Name: post_office_email_e2fa5388; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_email_e2fa5388 ON public.post_office_email USING btree (created);


--
-- Name: post_office_email_ed24d584; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_email_ed24d584 ON public.post_office_email USING btree (scheduled_time);


--
-- Name: post_office_emailtemplate_dea6f63e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_emailtemplate_dea6f63e ON public.post_office_emailtemplate USING btree (default_template_id);


--
-- Name: post_office_log_fdfd0ebf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX post_office_log_fdfd0ebf ON public.post_office_log USING btree (email_id);


--
-- Name: profile_detailedprofile_ee11cbb1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_detailedprofile_ee11cbb1 ON public.profile_detailedprofile USING btree ("user");


--
-- Name: profile_detailedprofile_user_64852500f1c0af2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_detailedprofile_user_64852500f1c0af2_like ON public.profile_detailedprofile USING btree ("user" varchar_pattern_ops);


--
-- Name: profile_profile_955bfff7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_955bfff7 ON public.profile_profile USING btree (institution);


--
-- Name: profile_profile_b9973d8c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_b9973d8c ON public.profile_profile USING btree (contact_email);


--
-- Name: profile_profile_contact_email_7121cd324fedc4f7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_contact_email_7121cd324fedc4f7_like ON public.profile_profile USING btree (contact_email varchar_pattern_ops);


--
-- Name: profile_profile_institution_59b08bd38324528e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_institution_59b08bd38324528e_like ON public.profile_profile USING btree (institution varchar_pattern_ops);


--
-- Name: profile_profile_login_id_7e0d1cf31a7c497e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_login_id_7e0d1cf31a7c497e_like ON public.profile_profile USING btree (login_id varchar_pattern_ops);


--
-- Name: profile_profile_user_89328d5f019c126_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_user_89328d5f019c126_like ON public.profile_profile USING btree ("user" varchar_pattern_ops);


--
-- Name: share_anonymousshare_token_5514412a302f212b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_anonymousshare_token_5514412a302f212b_like ON public.share_anonymousshare USING btree (token varchar_pattern_ops);


--
-- Name: share_fileshare_14c4b06b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_14c4b06b ON public.share_fileshare USING btree (username);


--
-- Name: share_fileshare_1abd88b5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_1abd88b5 ON public.share_fileshare USING btree (s_type);


--
-- Name: share_fileshare_4b65ca0f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_4b65ca0f ON public.share_fileshare USING btree (permission);


--
-- Name: share_fileshare_9a8c79bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_9a8c79bf ON public.share_fileshare USING btree (repo_id);


--
-- Name: share_fileshare_permission_53c52b7f7af4a102_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_permission_53c52b7f7af4a102_like ON public.share_fileshare USING btree (permission varchar_pattern_ops);


--
-- Name: share_fileshare_repo_id_348d56e711ef6a6a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_repo_id_348d56e711ef6a6a_like ON public.share_fileshare USING btree (repo_id varchar_pattern_ops);


--
-- Name: share_fileshare_s_type_644ae3465e93e1f1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_s_type_644ae3465e93e1f1_like ON public.share_fileshare USING btree (s_type varchar_pattern_ops);


--
-- Name: share_fileshare_token_69d7c063d05e5c97_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_token_69d7c063d05e5c97_like ON public.share_fileshare USING btree (token varchar_pattern_ops);


--
-- Name: share_fileshare_username_410018e6fdfff61_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_username_410018e6fdfff61_like ON public.share_fileshare USING btree (username varchar_pattern_ops);


--
-- Name: share_orgfileshare_9cf869aa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_orgfileshare_9cf869aa ON public.share_orgfileshare USING btree (org_id);


--
-- Name: share_privatefiledirshare_86899d6f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_86899d6f ON public.share_privatefiledirshare USING btree (to_user);


--
-- Name: share_privatefiledirshare_9a8c79bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_9a8c79bf ON public.share_privatefiledirshare USING btree (repo_id);


--
-- Name: share_privatefiledirshare_f4f87abd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_f4f87abd ON public.share_privatefiledirshare USING btree (from_user);


--
-- Name: share_privatefiledirshare_from_user_34cc0dc0ff26c4a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_from_user_34cc0dc0ff26c4a_like ON public.share_privatefiledirshare USING btree (from_user varchar_pattern_ops);


--
-- Name: share_privatefiledirshare_repo_id_676f698a972f80ee_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_repo_id_676f698a972f80ee_like ON public.share_privatefiledirshare USING btree (repo_id varchar_pattern_ops);


--
-- Name: share_privatefiledirshare_to_user_106fde7088d917eb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_to_user_106fde7088d917eb_like ON public.share_privatefiledirshare USING btree (to_user varchar_pattern_ops);


--
-- Name: share_privatefiledirshare_token_2336aeb96958f805_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_token_2336aeb96958f805_like ON public.share_privatefiledirshare USING btree (token varchar_pattern_ops);


--
-- Name: share_uploadlinkshare_14c4b06b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_14c4b06b ON public.share_uploadlinkshare USING btree (username);


--
-- Name: share_uploadlinkshare_9a8c79bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_9a8c79bf ON public.share_uploadlinkshare USING btree (repo_id);


--
-- Name: share_uploadlinkshare_repo_id_3ee7375b0d26d7c5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_repo_id_3ee7375b0d26d7c5_like ON public.share_uploadlinkshare USING btree (repo_id varchar_pattern_ops);


--
-- Name: share_uploadlinkshare_token_4728ed614a4cdb98_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_token_4728ed614a4cdb98_like ON public.share_uploadlinkshare USING btree (token varchar_pattern_ops);


--
-- Name: share_uploadlinkshare_username_7008430dc0e9278e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_username_7008430dc0e9278e_like ON public.share_uploadlinkshare USING btree (username varchar_pattern_ops);


--
-- Name: termsandconditions_termsandcondition_slug_731b38a4b18bba9a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termsandconditions_termsandcondition_slug_731b38a4b18bba9a_like ON public.termsandconditions_termsandconditions USING btree (slug varchar_pattern_ops);


--
-- Name: termsandconditions_termsandconditions_2dbcba41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termsandconditions_termsandconditions_2dbcba41 ON public.termsandconditions_termsandconditions USING btree (slug);


--
-- Name: termsandconditions_usertermsandconditions_2ab34720; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX termsandconditions_usertermsandconditions_2ab34720 ON public.termsandconditions_usertermsandconditions USING btree (terms_id);


--
-- Name: wiki_personalwiki_username_711bc091704d218d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_personalwiki_username_711bc091704d218d_like ON public.wiki_personalwiki USING btree (username varchar_pattern_ops);


--
-- Name: post_office_emailtemplate D10069961e621a6e7cf05885fc962d37; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_emailtemplate
    ADD CONSTRAINT "D10069961e621a6e7cf05885fc962d37" FOREIGN KEY (default_template_id) REFERENCES public.post_office_emailtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_filediscuss base_group_message_id_6915ac55a0bd929c_fk_group_groupmessage_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filediscuss
    ADD CONSTRAINT base_group_message_id_6915ac55a0bd929c_fk_group_groupmessage_id FOREIGN KEY (group_message_id) REFERENCES public.group_groupmessage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_innerpubmsgreply base_innerp_reply_to_id_27731e1a4586de01_fk_base_innerpubmsg_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_innerpubmsgreply
    ADD CONSTRAINT base_innerp_reply_to_id_27731e1a4586de01_fk_base_innerpubmsg_id FOREIGN KEY (reply_to_id) REFERENCES public.base_innerpubmsg(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: termsandconditions_usertermsandconditions fa34cdfb619d84d4891c017590646012; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.termsandconditions_usertermsandconditions
    ADD CONSTRAINT fa34cdfb619d84d4891c017590646012 FOREIGN KEY (terms_id) REFERENCES public.termsandconditions_termsandconditions(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_messageattachment grou_group_message_id_1cf3436c2d475be7_fk_group_groupmessage_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_messageattachment
    ADD CONSTRAINT grou_group_message_id_1cf3436c2d475be7_fk_group_groupmessage_id FOREIGN KEY (group_message_id) REFERENCES public.group_groupmessage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_messagereply group_mes_reply_to_id_23113ea180894951_fk_group_groupmessage_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_messagereply
    ADD CONSTRAINT group_mes_reply_to_id_23113ea180894951_fk_group_groupmessage_id FOREIGN KEY (reply_to_id) REFERENCES public.group_groupmessage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: institutions_institutionquota institution_id_2ca7c89373390e2c_fk_institutions_institution_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions_institutionquota
    ADD CONSTRAINT institution_id_2ca7c89373390e2c_fk_institutions_institution_id FOREIGN KEY (institution_id) REFERENCES public.institutions_institution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: institutions_institutionadmin institution_id_5f792d6fe9a87ac9_fk_institutions_institution_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions_institutionadmin
    ADD CONSTRAINT institution_id_5f792d6fe9a87ac9_fk_institutions_institution_id FOREIGN KEY (institution_id) REFERENCES public.institutions_institution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_email po_template_id_3c48ffa2f1c17f43_fk_post_office_emailtemplate_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_email
    ADD CONSTRAINT po_template_id_3c48ffa2f1c17f43_fk_post_office_emailtemplate_id FOREIGN KEY (template_id) REFERENCES public.post_office_emailtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_attachment_emails post_attachment_id_388fa287a684f8f_fk_post_office_attachment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_attachment_emails
    ADD CONSTRAINT post_attachment_id_388fa287a684f8f_fk_post_office_attachment_id FOREIGN KEY (attachment_id) REFERENCES public.post_office_attachment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_attachment_emails post_office_at_email_id_f053bb3a1fa4afd_fk_post_office_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_attachment_emails
    ADD CONSTRAINT post_office_at_email_id_f053bb3a1fa4afd_fk_post_office_email_id FOREIGN KEY (email_id) REFERENCES public.post_office_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: post_office_log post_office_l_email_id_72165efe97e2d836_fk_post_office_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_office_log
    ADD CONSTRAINT post_office_l_email_id_72165efe97e2d836_fk_post_office_email_id FOREIGN KEY (email_id) REFERENCES public.post_office_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: share_orgfileshare share_orgfi_file_share_id_7e98815f5df832f_fk_share_fileshare_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_orgfileshare
    ADD CONSTRAINT share_orgfi_file_share_id_7e98815f5df832f_fk_share_fileshare_id FOREIGN KEY (file_share_id) REFERENCES public.share_fileshare(id) DEFERRABLE INITIALLY DEFERRED;
