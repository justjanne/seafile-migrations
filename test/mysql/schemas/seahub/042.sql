SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS `api2_token` (
  `key` varchar(40) NOT NULL,
  `user` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `api2_tokenv2` (
  `key` varchar(40) NOT NULL,
  `user` varchar(255) NOT NULL,
  `platform` varchar(32) NOT NULL,
  `device_id` varchar(40) NOT NULL,
  `device_name` varchar(40) NOT NULL,
  `platform_version` varchar(16) NOT NULL,
  `client_version` varchar(16) NOT NULL,
  `last_accessed` datetime NOT NULL,
  `last_login_ip` char(39) DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user` (`user`,`platform`,`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `avatar_avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailuser` varchar(255) NOT NULL,
  `primary` boolean NOT NULL,
  `avatar` varchar(1024) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `avatar_groupavatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL,
  `avatar` varchar(1024) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_clientlogintoken` (
  `token` varchar(32) NOT NULL,
  `username` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`token`),
  KEY `base_clientlogintoken_ee0cafa2` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_commandslastcheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command_type` varchar(100) NOT NULL,
  `last_check` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_devicetoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(80) NOT NULL,
  `user` varchar(255) NOT NULL,
  `platform` varchar(32) NOT NULL,
  `version` varchar(16) NOT NULL,
  `pversion` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_dirfileslastmodifiedinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `parent_dir` longtext NOT NULL,
  `parent_dir_hash` varchar(12) NOT NULL,
  `dir_id` varchar(40) NOT NULL,
  `last_modified_info` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`,`parent_dir_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_filecontributors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `file_id` varchar(40) NOT NULL,
  `file_path` longtext NOT NULL,
  `file_path_hash` varchar(12) NOT NULL,
  `last_modified` bigint NOT NULL,
  `last_commit_id` varchar(40) NOT NULL,
  `emails` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_filecontributors_2059abe4` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_filediscuss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_message_id` int(11) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `path_hash` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_filediscuss_12d5396a` (`group_message_id`),
  KEY `base_filediscuss_656b4f4a` (`path_hash`),
  CONSTRAINT `group_message_id_refs_id_c336ac2f` FOREIGN KEY (`group_message_id`) REFERENCES `group_groupmessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_filelastmodifiedinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `file_id` varchar(40) NOT NULL,
  `file_path` longtext NOT NULL,
  `file_path_hash` varchar(12) NOT NULL,
  `last_modified` bigint NOT NULL,
  `email` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`,`file_path_hash`),
  KEY `base_filelastmodifiedinfo_2059abe4` (`repo_id`),
  KEY `base_filelastmodifiedinfo_880f7193` (`file_path_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_groupenabledmodule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(10) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_groupenabledmodule_dc00373b` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_innerpubmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_email` varchar(75) NOT NULL,
  `message` varchar(500) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_innerpubmsgreply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_to_id` int(11) NOT NULL,
  `from_email` varchar(75) NOT NULL,
  `message` varchar(150) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_innerpubmsgreply_3fde75e6` (`reply_to_id`),
  CONSTRAINT `reply_to_id_refs_id_bff92b48` FOREIGN KEY (`reply_to_id`) REFERENCES `base_innerpubmsg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_userenabledmodule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_userenabledmodule_ee0cafa2` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_userlastlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_userlastlogin_ee0cafa2` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_userstarredfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(75) NOT NULL,
  `org_id` int(11) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `is_dir` boolean NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_userstarredfiles_2059abe4` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_uuidobjidmap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) NOT NULL,
  `obj_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `obj_id` (`obj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contacts_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_contact_d3d8b136` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

INSERT INTO `django_content_type` VALUES (1,'content type','contenttypes','contenttype'),(2,'session','sessions','session'),(3,'registration profile','registration','registrationprofile'),(4,'captcha store','captcha','captchastore'),(5,'token','api2','token'),(6,'token v2','api2','tokenv2'),(7,'avatar','avatar','avatar'),(8,'group avatar','avatar','groupavatar'),(9,'group enabled module','base','groupenabledmodule'),(10,'uuid objid map','base','uuidobjidmap'),(11,'inner pub msg reply','base','innerpubmsgreply'),(12,'commands last check','base','commandslastcheck'),(13,'user enabled module','base','userenabledmodule'),(15,'device token','base','devicetoken'),(17,'file discuss','base','filediscuss'),(18,'inner pub msg','base','innerpubmsg'),(20,'user last login','base','userlastlogin'),(21,'user starred files','base','userstarredfiles'),(22,'contact','contacts','contact'),(23,'personal wiki','wiki','personalwiki'),(24,'group wiki','wiki','groupwiki'),(25,'public group','group','publicgroup'),(26,'group message','group','groupmessage'),(27,'message attachment','group','messageattachment'),(28,'message reply','group','messagereply'),(29,'user msg attachment','message','usermsgattachment'),(30,'user msg last check','message','usermsglastcheck'),(31,'user message','message','usermessage'),(32,'notification','notifications','notification'),(33,'user notification','notifications','usernotification'),(34,'user options','options','useroptions'),(35,'profile','profile','profile'),(36,'detailed profile','profile','detailedprofile'),(37,'private file dir share','share','privatefiledirshare'),(38,'upload link share','share','uploadlinkshare'),(39,'file share','share','fileshare'),(40,'anonymous share','share','anonymousshare'),(41,'org file share','share','orgfileshare'),(42,'group public file','pubfile','grouppublicfile'),(43,'user login log','sysadmin_extra','userloginlog'),(44,'client login token','base','clientlogintoken'),(45,'org member quota','organizations','orgmemberquota');

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `group_groupmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_groupmessage_dc00373b` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `group_messageattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_message_id` int(11) NOT NULL,
  `repo_id` varchar(40) NOT NULL,
  `attach_type` varchar(5) NOT NULL,
  `path` longtext NOT NULL,
  `src` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_messageattachment_12d5396a` (`group_message_id`),
  CONSTRAINT `group_message_id_refs_id_e9a00d2a` FOREIGN KEY (`group_message_id`) REFERENCES `group_groupmessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `group_messagereply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_to_id` int(11) NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `message` varchar(2048) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_messagereply_3fde75e6` (`reply_to_id`),
  CONSTRAINT `reply_to_id_refs_id_261fb244` FOREIGN KEY (`reply_to_id`) REFERENCES `group_groupmessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `group_publicgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_publicgroup_dc00373b` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `message_usermessage` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `to_email` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  `ifread` boolean NOT NULL,
  `sender_deleted_at` datetime DEFAULT NULL,
  `recipient_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `message_usermessage_8b1dd4eb` (`from_email`),
  KEY `message_usermessage_590d1560` (`to_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `message_usermsgattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_msg_id` int(11) NOT NULL,
  `priv_file_dir_share_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_usermsgattachment_72f290f5` (`user_msg_id`),
  KEY `message_usermsgattachment_cee41a9a` (`priv_file_dir_share_id`),
  CONSTRAINT `priv_file_dir_share_id_refs_id_163f8f83` FOREIGN KEY (`priv_file_dir_share_id`) REFERENCES `share_privatefiledirshare` (`id`),
  CONSTRAINT `user_msg_id_refs_message_id_debb82ad` FOREIGN KEY (`user_msg_id`) REFERENCES `message_usermessage` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `message_usermsglastcheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `notifications_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL,
  `primary` boolean NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `notifications_usernotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_user` varchar(255) NOT NULL,
  `msg_type` varchar(30) NOT NULL,
  `detail` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  `seen` boolean NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_usernotification_bc172800` (`to_user`),
  KEY `notifications_usernotification_265e5521` (`msg_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `options_useroptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `option_key` varchar(50) NOT NULL,
  `option_val` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `options_useroptions_830a6ccb` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `organizations_orgmemberquota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `quota` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organizations_orgmemberquota_944dadb6` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `profile_detailedprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `department` varchar(512) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_detailedprofile_6340c63c` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `profile_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(75) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `intro` longtext NOT NULL,
  `lang_code` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pubfile_grouppublicfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` varchar(4096) NOT NULL,
  `is_dir` boolean NOT NULL,
  `added_by` varchar(256) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `download_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pubfile_grouppublicfile_dc00373b` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailuser_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `share_anonymousshare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_owner` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `anonymous_email` varchar(255) NOT NULL,
  `token` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `share_fileshare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `token` varchar(10) NOT NULL,
  `ctime` datetime NOT NULL,
  `view_cnt` int(11) NOT NULL,
  `s_type` varchar(2) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `share_fileshare_ee0cafa2` (`username`),
  KEY `share_fileshare_2059abe4` (`repo_id`),
  KEY `share_fileshare_44096fd5` (`s_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `share_orgfileshare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `file_share_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_share_id` (`file_share_id`),
  KEY `share_orgfileshare_944dadb6` (`org_id`),
  CONSTRAINT `file_share_id_refs_id_bd2fd9f8` FOREIGN KEY (`file_share_id`) REFERENCES `share_fileshare` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `share_privatefiledirshare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` varchar(255) NOT NULL,
  `to_user` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `token` varchar(10) NOT NULL,
  `permission` varchar(5) NOT NULL,
  `s_type` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `share_privatefiledirshare_0e7efed3` (`from_user`),
  KEY `share_privatefiledirshare_bc172800` (`to_user`),
  KEY `share_privatefiledirshare_2059abe4` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `share_uploadlinkshare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `token` varchar(10) NOT NULL,
  `ctime` datetime NOT NULL,
  `view_cnt` int(11) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `share_uploadlinkshare_ee0cafa2` (`username`),
  KEY `share_uploadlinkshare_2059abe4` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sysadmin_extra_userloginlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `login_date` datetime NOT NULL,
  `login_ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_extra_userloginlog_ee0cafa2` (`username`),
  KEY `sysadmin_extra_userloginlog_c8db99ec` (`login_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wiki_groupwiki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `wiki_personalwiki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;