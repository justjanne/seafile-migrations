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
    last_login_ip inet
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
-- Name: base_filelastmodifiedinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_filelastmodifiedinfo (
    id integer NOT NULL,
    repo_id character varying(36) NOT NULL,
    file_id character varying(40) NOT NULL,
    file_path text NOT NULL,
    file_path_hash character varying(12) NOT NULL,
    last_modified bigint NOT NULL,
    email character varying(75) NOT NULL
);


ALTER TABLE public.base_filelastmodifiedinfo OWNER TO postgres;

--
-- Name: base_filelastmodifiedinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_filelastmodifiedinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.base_filelastmodifiedinfo_id_seq OWNER TO postgres;

--
-- Name: base_filelastmodifiedinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_filelastmodifiedinfo_id_seq OWNED BY public.base_filelastmodifiedinfo.id;


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
-- Name: group_groupmessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_groupmessage (
    id integer NOT NULL,
    group_id integer NOT NULL,
    from_email character varying(255) NOT NULL,
    message character varying(2048) NOT NULL,
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
    message character varying(2048) NOT NULL,
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
-- Name: message_usermessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message_usermessage (
    message_id integer NOT NULL,
    message character varying(512) NOT NULL,
    from_email character varying(255) NOT NULL,
    to_email character varying(255) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    ifread boolean NOT NULL,
    sender_deleted_at timestamp with time zone,
    recipient_deleted_at timestamp with time zone
);


ALTER TABLE public.message_usermessage OWNER TO postgres;

--
-- Name: message_usermessage_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_usermessage_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.message_usermessage_message_id_seq OWNER TO postgres;

--
-- Name: message_usermessage_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_usermessage_message_id_seq OWNED BY public.message_usermessage.message_id;


--
-- Name: message_usermsgattachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message_usermsgattachment (
    id integer NOT NULL,
    user_msg_id integer NOT NULL,
    priv_file_dir_share_id integer
);


ALTER TABLE public.message_usermsgattachment OWNER TO postgres;

--
-- Name: message_usermsgattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_usermsgattachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.message_usermsgattachment_id_seq OWNER TO postgres;

--
-- Name: message_usermsgattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_usermsgattachment_id_seq OWNED BY public.message_usermsgattachment.id;


--
-- Name: message_usermsglastcheck; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message_usermsglastcheck (
    id integer NOT NULL,
    check_time timestamp with time zone NOT NULL
);


ALTER TABLE public.message_usermsglastcheck OWNER TO postgres;

--
-- Name: message_usermsglastcheck_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_usermsglastcheck_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.message_usermsglastcheck_id_seq OWNER TO postgres;

--
-- Name: message_usermsglastcheck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_usermsglastcheck_id_seq OWNED BY public.message_usermsglastcheck.id;


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
    "user" character varying(75) NOT NULL,
    nickname character varying(64) NOT NULL,
    intro text NOT NULL,
    lang_code text
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
    s_type character varying(2) NOT NULL,
    password character varying(128),
    expire_date timestamp with time zone
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
    token character varying(10) NOT NULL,
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
-- Name: base_dirfileslastmodifiedinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_dirfileslastmodifiedinfo ALTER COLUMN id SET DEFAULT nextval('public.base_dirfileslastmodifiedinfo_id_seq'::regclass);


--
-- Name: base_filecontributors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filecontributors ALTER COLUMN id SET DEFAULT nextval('public.base_filecontributors_id_seq'::regclass);


--
-- Name: base_filediscuss id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filediscuss ALTER COLUMN id SET DEFAULT nextval('public.base_filediscuss_id_seq'::regclass);


--
-- Name: base_filelastmodifiedinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filelastmodifiedinfo ALTER COLUMN id SET DEFAULT nextval('public.base_filelastmodifiedinfo_id_seq'::regclass);


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
-- Name: base_uuidobjidmap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_uuidobjidmap ALTER COLUMN id SET DEFAULT nextval('public.base_uuidobjidmap_id_seq'::regclass);


--
-- Name: captcha_captchastore id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.captcha_captchastore ALTER COLUMN id SET DEFAULT nextval('public.captcha_captchastore_id_seq'::regclass);


--
-- Name: contacts_contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact ALTER COLUMN id SET DEFAULT nextval('public.contacts_contact_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


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
-- Name: message_usermessage message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_usermessage ALTER COLUMN message_id SET DEFAULT nextval('public.message_usermessage_message_id_seq'::regclass);


--
-- Name: message_usermsgattachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_usermsgattachment ALTER COLUMN id SET DEFAULT nextval('public.message_usermsgattachment_id_seq'::regclass);


--
-- Name: message_usermsglastcheck id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_usermsglastcheck ALTER COLUMN id SET DEFAULT nextval('public.message_usermsglastcheck_id_seq'::regclass);


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
-- Name: wiki_groupwiki id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_groupwiki ALTER COLUMN id SET DEFAULT nextval('public.wiki_groupwiki_id_seq'::regclass);


--
-- Name: wiki_personalwiki id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_personalwiki ALTER COLUMN id SET DEFAULT nextval('public.wiki_personalwiki_id_seq'::regclass);


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
-- Name: base_filecontributors base_filecontributors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filecontributors
    ADD CONSTRAINT base_filecontributors_pkey PRIMARY KEY (id);


--
-- Name: base_filediscuss base_filediscuss_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filediscuss
    ADD CONSTRAINT base_filediscuss_pkey PRIMARY KEY (id);


--
-- Name: base_filelastmodifiedinfo base_filelastmodifiedinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filelastmodifiedinfo
    ADD CONSTRAINT base_filelastmodifiedinfo_pkey PRIMARY KEY (id);


--
-- Name: base_filelastmodifiedinfo base_filelastmodifiedinfo_repo_id_file_path_hash_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filelastmodifiedinfo
    ADD CONSTRAINT base_filelastmodifiedinfo_repo_id_file_path_hash_key UNIQUE (repo_id, file_path_hash);


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
-- Name: message_usermessage message_usermessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_usermessage
    ADD CONSTRAINT message_usermessage_pkey PRIMARY KEY (message_id);


--
-- Name: message_usermsgattachment message_usermsgattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_usermsgattachment
    ADD CONSTRAINT message_usermsgattachment_pkey PRIMARY KEY (id);


--
-- Name: message_usermsglastcheck message_usermsglastcheck_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_usermsglastcheck
    ADD CONSTRAINT message_usermsglastcheck_pkey PRIMARY KEY (id);


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
-- Name: profile_detailedprofile profile_detailedprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_detailedprofile
    ADD CONSTRAINT profile_detailedprofile_pkey PRIMARY KEY (id);


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
-- Name: api2_token_key_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api2_token_key_like ON public.api2_token USING btree (key varchar_pattern_ops);


--
-- Name: api2_token_user_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api2_token_user_like ON public.api2_token USING btree ("user" varchar_pattern_ops);


--
-- Name: api2_tokenv2_key_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api2_tokenv2_key_like ON public.api2_tokenv2 USING btree (key varchar_pattern_ops);


--
-- Name: base_filecontributors_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecontributors_repo_id ON public.base_filecontributors USING btree (repo_id);


--
-- Name: base_filecontributors_repo_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filecontributors_repo_id_like ON public.base_filecontributors USING btree (repo_id varchar_pattern_ops);


--
-- Name: base_filediscuss_group_message_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filediscuss_group_message_id ON public.base_filediscuss USING btree (group_message_id);


--
-- Name: base_filediscuss_path_hash; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filediscuss_path_hash ON public.base_filediscuss USING btree (path_hash);


--
-- Name: base_filediscuss_path_hash_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filediscuss_path_hash_like ON public.base_filediscuss USING btree (path_hash varchar_pattern_ops);


--
-- Name: base_filelastmodifiedinfo_file_path_hash; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filelastmodifiedinfo_file_path_hash ON public.base_filelastmodifiedinfo USING btree (file_path_hash);


--
-- Name: base_filelastmodifiedinfo_file_path_hash_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filelastmodifiedinfo_file_path_hash_like ON public.base_filelastmodifiedinfo USING btree (file_path_hash varchar_pattern_ops);


--
-- Name: base_filelastmodifiedinfo_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filelastmodifiedinfo_repo_id ON public.base_filelastmodifiedinfo USING btree (repo_id);


--
-- Name: base_filelastmodifiedinfo_repo_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_filelastmodifiedinfo_repo_id_like ON public.base_filelastmodifiedinfo USING btree (repo_id varchar_pattern_ops);


--
-- Name: base_groupenabledmodule_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_groupenabledmodule_group_id ON public.base_groupenabledmodule USING btree (group_id);


--
-- Name: base_groupenabledmodule_group_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_groupenabledmodule_group_id_like ON public.base_groupenabledmodule USING btree (group_id varchar_pattern_ops);


--
-- Name: base_innerpubmsgreply_reply_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_innerpubmsgreply_reply_to_id ON public.base_innerpubmsgreply USING btree (reply_to_id);


--
-- Name: base_userenabledmodule_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userenabledmodule_username ON public.base_userenabledmodule USING btree (username);


--
-- Name: base_userenabledmodule_username_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userenabledmodule_username_like ON public.base_userenabledmodule USING btree (username varchar_pattern_ops);


--
-- Name: base_userlastlogin_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userlastlogin_username ON public.base_userlastlogin USING btree (username);


--
-- Name: base_userlastlogin_username_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userlastlogin_username_like ON public.base_userlastlogin USING btree (username varchar_pattern_ops);


--
-- Name: base_userstarredfiles_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_email ON public.base_userstarredfiles USING btree (email);


--
-- Name: base_userstarredfiles_email_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_email_like ON public.base_userstarredfiles USING btree (email varchar_pattern_ops);


--
-- Name: base_userstarredfiles_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_repo_id ON public.base_userstarredfiles USING btree (repo_id);


--
-- Name: base_userstarredfiles_repo_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_userstarredfiles_repo_id_like ON public.base_userstarredfiles USING btree (repo_id varchar_pattern_ops);


--
-- Name: base_uuidobjidmap_obj_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_uuidobjidmap_obj_id_like ON public.base_uuidobjidmap USING btree (obj_id varchar_pattern_ops);


--
-- Name: captcha_captchastore_hashkey_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX captcha_captchastore_hashkey_like ON public.captcha_captchastore USING btree (hashkey varchar_pattern_ops);


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
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_like ON public.django_session USING btree (session_key varchar_pattern_ops);


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
-- Name: group_publicgroup_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_publicgroup_group_id ON public.group_publicgroup USING btree (group_id);


--
-- Name: message_usermessage_from_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX message_usermessage_from_email ON public.message_usermessage USING btree (from_email);


--
-- Name: message_usermessage_from_email_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX message_usermessage_from_email_like ON public.message_usermessage USING btree (from_email varchar_pattern_ops);


--
-- Name: message_usermessage_to_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX message_usermessage_to_email ON public.message_usermessage USING btree (to_email);


--
-- Name: message_usermessage_to_email_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX message_usermessage_to_email_like ON public.message_usermessage USING btree (to_email varchar_pattern_ops);


--
-- Name: message_usermsgattachment_priv_file_dir_share_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX message_usermsgattachment_priv_file_dir_share_id ON public.message_usermsgattachment USING btree (priv_file_dir_share_id);


--
-- Name: message_usermsgattachment_user_msg_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX message_usermsgattachment_user_msg_id ON public.message_usermsgattachment USING btree (user_msg_id);


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
-- Name: options_useroptions_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX options_useroptions_email ON public.options_useroptions USING btree (email);


--
-- Name: options_useroptions_email_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX options_useroptions_email_like ON public.options_useroptions USING btree (email varchar_pattern_ops);


--
-- Name: profile_detailedprofile_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_detailedprofile_user ON public.profile_detailedprofile USING btree ("user");


--
-- Name: profile_detailedprofile_user_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_detailedprofile_user_like ON public.profile_detailedprofile USING btree ("user" varchar_pattern_ops);


--
-- Name: profile_profile_user_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX profile_profile_user_like ON public.profile_profile USING btree ("user" varchar_pattern_ops);


--
-- Name: share_anonymousshare_token_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_anonymousshare_token_like ON public.share_anonymousshare USING btree (token varchar_pattern_ops);


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
-- Name: share_fileshare_token_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_token_like ON public.share_fileshare USING btree (token varchar_pattern_ops);


--
-- Name: share_fileshare_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_username ON public.share_fileshare USING btree (username);


--
-- Name: share_fileshare_username_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_fileshare_username_like ON public.share_fileshare USING btree (username varchar_pattern_ops);


--
-- Name: share_orgfileshare_org_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_orgfileshare_org_id ON public.share_orgfileshare USING btree (org_id);


--
-- Name: share_privatefiledirshare_from_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_from_user ON public.share_privatefiledirshare USING btree (from_user);


--
-- Name: share_privatefiledirshare_from_user_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_from_user_like ON public.share_privatefiledirshare USING btree (from_user varchar_pattern_ops);


--
-- Name: share_privatefiledirshare_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_repo_id ON public.share_privatefiledirshare USING btree (repo_id);


--
-- Name: share_privatefiledirshare_repo_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_repo_id_like ON public.share_privatefiledirshare USING btree (repo_id varchar_pattern_ops);


--
-- Name: share_privatefiledirshare_to_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_to_user ON public.share_privatefiledirshare USING btree (to_user);


--
-- Name: share_privatefiledirshare_to_user_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_to_user_like ON public.share_privatefiledirshare USING btree (to_user varchar_pattern_ops);


--
-- Name: share_privatefiledirshare_token_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_privatefiledirshare_token_like ON public.share_privatefiledirshare USING btree (token varchar_pattern_ops);


--
-- Name: share_uploadlinkshare_repo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_repo_id ON public.share_uploadlinkshare USING btree (repo_id);


--
-- Name: share_uploadlinkshare_repo_id_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_repo_id_like ON public.share_uploadlinkshare USING btree (repo_id varchar_pattern_ops);


--
-- Name: share_uploadlinkshare_token_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_token_like ON public.share_uploadlinkshare USING btree (token varchar_pattern_ops);


--
-- Name: share_uploadlinkshare_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_username ON public.share_uploadlinkshare USING btree (username);


--
-- Name: share_uploadlinkshare_username_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX share_uploadlinkshare_username_like ON public.share_uploadlinkshare USING btree (username varchar_pattern_ops);


--
-- Name: wiki_personalwiki_username_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_personalwiki_username_like ON public.wiki_personalwiki USING btree (username varchar_pattern_ops);


--
-- Name: base_innerpubmsgreply base_innerpubmsgreply_reply_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_innerpubmsgreply
    ADD CONSTRAINT base_innerpubmsgreply_reply_to_id_fkey FOREIGN KEY (reply_to_id) REFERENCES public.base_innerpubmsg(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_filediscuss group_message_id_refs_id_c336ac2f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_filediscuss
    ADD CONSTRAINT group_message_id_refs_id_c336ac2f FOREIGN KEY (group_message_id) REFERENCES public.group_groupmessage(id) DEFERRABLE INITIALLY DEFERRED;


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


--
-- Name: message_usermsgattachment message_usermsgattachment_user_msg_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_usermsgattachment
    ADD CONSTRAINT message_usermsgattachment_user_msg_id_fkey FOREIGN KEY (user_msg_id) REFERENCES public.message_usermessage(message_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: message_usermsgattachment priv_file_dir_share_id_refs_id_163f8f83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_usermsgattachment
    ADD CONSTRAINT priv_file_dir_share_id_refs_id_163f8f83 FOREIGN KEY (priv_file_dir_share_id) REFERENCES public.share_privatefiledirshare(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: share_orgfileshare share_orgfileshare_file_share_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.share_orgfileshare
    ADD CONSTRAINT share_orgfileshare_file_share_id_fkey FOREIGN KEY (file_share_id) REFERENCES public.share_fileshare(id) DEFERRABLE INITIALLY DEFERRED;
