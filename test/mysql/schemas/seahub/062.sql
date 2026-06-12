SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS `admin_log_adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `detail` longtext NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_log_adminlog_0c83f57c` (`email`),
  KEY `admin_log_adminlog_f7235a61` (`operation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `created_at` datetime NOT NULL,
  `wiped_at` datetime DEFAULT NULL,
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
  KEY `base_clientlogintoken_14c4b06b` (`username`)
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

CREATE TABLE IF NOT EXISTS `base_filecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `parent_path` longtext NOT NULL,
  `repo_id_parent_path_md5` varchar(100) NOT NULL,
  `item_name` longtext NOT NULL,
  `author` varchar(255) NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_filecomment_9a8c79bf` (`repo_id`),
  KEY `base_filecomment_c5bf47d4` (`repo_id_parent_path_md5`),
  KEY `base_filecomment_02bd92fa` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_filediscuss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_message_id` int(11) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `path_hash` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base__group_message_id_6915ac55a0bd929c_fk_group_groupmessage_id` (`group_message_id`),
  KEY `base_filediscuss_b57d9b6b` (`path_hash`),
  CONSTRAINT `base__group_message_id_6915ac55a0bd929c_fk_group_groupmessage_id` FOREIGN KEY (`group_message_id`) REFERENCES `group_groupmessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_groupenabledmodule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(10) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_groupenabledmodule_0e939a4f` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_innerpubmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_email` varchar(254) NOT NULL,
  `message` varchar(500) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_innerpubmsgreply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_to_id` int(11) NOT NULL,
  `from_email` varchar(254) NOT NULL,
  `message` varchar(150) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_innerpu_reply_to_id_27731e1a4586de01_fk_base_innerpubmsg_id` (`reply_to_id`),
  CONSTRAINT `base_innerpu_reply_to_id_27731e1a4586de01_fk_base_innerpubmsg_id` FOREIGN KEY (`reply_to_id`) REFERENCES `base_innerpubmsg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_userenabledmodule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_userenabledmodule_14c4b06b` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_userlastlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_userlastlogin_14c4b06b` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `base_userstarredfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `org_id` int(11) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `is_dir` boolean NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_userstarredfiles_0c83f57c` (`email`),
  KEY `base_userstarredfiles_9a8c79bf` (`repo_id`)
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

CREATE TABLE IF NOT EXISTS `constance_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contacts_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_contact_40c27bdc` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

INSERT INTO `django_content_type` VALUES (50,'admin_log','adminlog'),(12,'api2','token'),(13,'api2','tokenv2'),(14,'avatar','avatar'),(15,'avatar','groupavatar'),(17,'base','clientlogintoken'),(22,'base','commandslastcheck'),(21,'base','devicetoken'),(19,'base','filecomment'),(20,'base','filediscuss'),(16,'base','groupenabledmodule'),(23,'base','innerpubmsg'),(24,'base','innerpubmsgreply'),(18,'base','userenabledmodule'),(25,'base','userlastlogin'),(26,'base','userstarredfiles'),(4,'captcha','captchastore'),(27,'contacts','contact'),(1,'contenttypes','contenttype'),(5,'database','constance'),(35,'group','groupmessage'),(36,'group','messageattachment'),(37,'group','messagereply'),(34,'group','publicgroup'),(29,'institutions','institution'),(28,'institutions','institutionadmin'),(30,'institutions','institutionquota'),(31,'invitations','invitation'),(38,'notifications','notification'),(39,'notifications','usernotification'),(40,'options','useroptions'),(63,'organizations','orgmemberquota'),(6,'post_office','attachment'),(8,'post_office','email'),(7,'post_office','emailtemplate'),(9,'post_office','log'),(42,'profile','detailedprofile'),(41,'profile','profile'),(3,'registration','registrationprofile'),(54,'revision_tag','revisiontags'),(55,'revision_tag','tags'),(60,'role_permissions','adminrole'),(2,'sessions','session'),(49,'share','anonymousshare'),(48,'share','extragroupssharepermission'),(47,'share','extrasharepermission'),(44,'share','fileshare'),(45,'share','orgfileshare'),(43,'share','privatefiledirshare'),(46,'share','uploadlinkshare'),(62,'sysadmin_extra','userloginlog'),(52,'tags','filetag'),(51,'tags','fileuuidmap'),(53,'tags','tags'),(10,'termsandconditions','termsandconditions'),(11,'termsandconditions','usertermsandconditions'),(61,'trusted_ip','trustedip'),(56,'two_factor','phonedevice'),(59,'two_factor','staticdevice'),(57,'two_factor','statictoken'),(58,'two_factor','totpdevice'),(33,'wiki','groupwiki'),(32,'wiki','personalwiki');

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

INSERT INTO `django_migrations` VALUES (1,'admin_log','0001_initial','2017-09-25 05:24:11.481714'),(2,'captcha','0001_initial','2017-09-25 05:24:11.499690'),(3,'contenttypes','0001_initial','2017-09-25 05:24:11.525681'),(4,'contenttypes','0002_remove_content_type_name','2017-09-25 05:24:11.584409'),(5,'database','0001_initial','2017-09-25 05:24:11.599982'),(6,'institutions','0001_initial','2017-09-25 05:24:11.653562'),(7,'institutions','0002_institutionquota','2017-09-25 05:24:11.735524'),(8,'invitations','0001_initial','2017-09-25 05:24:11.752853'),(9,'invitations','0002_invitation_invite_type','2017-09-25 05:24:11.783917'),(10,'invitations','0003_auto_20160510_1703','2017-09-25 05:24:11.807671'),(11,'invitations','0004_auto_20160629_1610','2017-09-25 05:24:11.855233'),(12,'invitations','0005_auto_20160629_1614','2017-09-25 05:24:11.867599'),(13,'post_office','0001_initial','2017-09-25 05:24:12.089393'),(14,'post_office','0002_add_i18n_and_backend_alias','2017-09-25 05:24:12.376311'),(15,'post_office','0003_auto_20170725_0206','2017-09-25 05:24:12.392530'),(16,'role_permissions','0001_initial','2017-09-25 05:24:12.408197'),(17,'sessions','0001_initial','2017-09-25 05:24:12.436008'),(18,'termsandconditions','0001_initial','2017-09-25 05:24:12.526533');

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `group_groupmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_groupmessage_0e939a4f` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `group_messageattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_message_id` int(11) NOT NULL,
  `repo_id` varchar(40) NOT NULL,
  `attach_type` varchar(5) NOT NULL,
  `path` longtext NOT NULL,
  `src` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_group_message_id_1cf3436c2d475be7_fk_group_groupmessage_id` (`group_message_id`),
  CONSTRAINT `group_group_message_id_1cf3436c2d475be7_fk_group_groupmessage_id` FOREIGN KEY (`group_message_id`) REFERENCES `group_groupmessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `group_messagereply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_to_id` int(11) NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_mess_reply_to_id_23113ea180894951_fk_group_groupmessage_id` (`reply_to_id`),
  CONSTRAINT `group_mess_reply_to_id_23113ea180894951_fk_group_groupmessage_id` FOREIGN KEY (`reply_to_id`) REFERENCES `group_groupmessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `group_publicgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_publicgroup_0e939a4f` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `institutions_institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `institutions_institutionadmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(254) NOT NULL,
  `institution_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_institution_id_5f792d6fe9a87ac9_fk_institutions_institution_id` (`institution_id`),
  CONSTRAINT `i_institution_id_5f792d6fe9a87ac9_fk_institutions_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `institutions_institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `institutions_institutionquota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quota` bigint NOT NULL,
  `institution_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i_institution_id_2ca7c89373390e2c_fk_institutions_institution_id` (`institution_id`),
  CONSTRAINT `i_institution_id_2ca7c89373390e2c_fk_institutions_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `institutions_institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `invitations_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(40) NOT NULL,
  `inviter` varchar(255) NOT NULL,
  `accepter` varchar(255) NOT NULL,
  `invite_time` datetime NOT NULL,
  `accept_time` datetime DEFAULT NULL,
  `invite_type` varchar(20) NOT NULL,
  `expire_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invitations_invitation_d5dd16f8` (`inviter`),
  KEY `invitations_invitation_token_1961fbb98c05e5fd_uniq` (`token`)
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
  KEY `notifications_usernotification_86899d6f` (`to_user`),
  KEY `notifications_usernotification_486af403` (`msg_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `options_useroptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `option_key` varchar(50) NOT NULL,
  `option_val` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `options_useroptions_0c83f57c` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `organizations_orgmemberquota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `quota` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organizations_orgmemberquota_9cf869aa` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `post_office_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `post_office_attachment_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_id` int(11) NOT NULL,
  `email_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attachment_id` (`attachment_id`,`email_id`),
  KEY `post_office_att_email_id_f053bb3a1fa4afd_fk_post_office_email_id` (`email_id`),
  CONSTRAINT `post__attachment_id_388fa287a684f8f_fk_post_office_attachment_id` FOREIGN KEY (`attachment_id`) REFERENCES `post_office_attachment` (`id`),
  CONSTRAINT `post_office_att_email_id_f053bb3a1fa4afd_fk_post_office_email_id` FOREIGN KEY (`email_id`) REFERENCES `post_office_email` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `post_office_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_email` varchar(254) NOT NULL,
  `to` longtext NOT NULL,
  `cc` longtext NOT NULL,
  `bcc` longtext NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `html_message` longtext NOT NULL,
  `status` int unsigned DEFAULT NULL,
  `priority` int unsigned DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `scheduled_time` datetime DEFAULT NULL,
  `headers` longtext,
  `context` longtext,
  `template_id` int(11),
  `backend_alias` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_office_email_9acb4454` (`status`),
  KEY `post_office_email_e2fa5388` (`created`),
  KEY `post_office_email_3acc0b7a` (`last_updated`),
  KEY `post_office_email_ed24d584` (`scheduled_time`),
  KEY `post_office_email_74f53564` (`template_id`),
  CONSTRAINT `pos_template_id_3c48ffa2f1c17f43_fk_post_office_emailtemplate_id` FOREIGN KEY (`template_id`) REFERENCES `post_office_emailtemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `post_office_emailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `html_content` longtext NOT NULL,
  `created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `default_template_id` int(11) DEFAULT NULL,
  `language` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_office_emailtemplate_language_29c8606d390b61ee_uniq` (`language`,`default_template_id`),
  KEY `post_office_emailtemplate_dea6f63e` (`default_template_id`),
  CONSTRAINT `D0d1b6711ab19cd27206adfa5a4f8f80` FOREIGN KEY (`default_template_id`) REFERENCES `post_office_emailtemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `post_office_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `status` int unsigned NOT NULL,
  `exception_type` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `email_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_office_lo_email_id_72165efe97e2d836_fk_post_office_email_id` (`email_id`),
  CONSTRAINT `post_office_lo_email_id_72165efe97e2d836_fk_post_office_email_id` FOREIGN KEY (`email_id`) REFERENCES `post_office_email` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `profile_detailedprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `department` varchar(512) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_detailedprofile_ee11cbb1` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `profile_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(254) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `intro` longtext NOT NULL,
  `lang_code` longtext,
  `login_id` varchar(225) DEFAULT NULL,
  `contact_email` varchar(225) DEFAULT NULL,
  `institution` varchar(225) DEFAULT NULL,
  `list_in_address_book` boolean NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`),
  UNIQUE KEY `login_id` (`login_id`),
  KEY `profile_profile_b9973d8c` (`contact_email`),
  KEY `profile_profile_955bfff7` (`institution`),
  KEY `profile_profile_3d5d3631` (`list_in_address_book`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailuser_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `revision_tag_revisiontags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `revision_id` varchar(255) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `revision_tag_rev_tag_id_37c2d76166c50597_fk_revision_tag_tags_id` (`tag_id`),
  KEY `revision_tag_revisiontags_9a8c79bf` (`repo_id`),
  KEY `revision_tag_revisiontags_5de09a8d` (`revision_id`),
  KEY `revision_tag_revisiontags_14c4b06b` (`username`),
  CONSTRAINT `revision_tag_rev_tag_id_37c2d76166c50597_fk_revision_tag_tags_id` FOREIGN KEY (`tag_id`) REFERENCES `revision_tag_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `revision_tag_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `role_permissions_adminrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
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

CREATE TABLE IF NOT EXISTS `share_extragroupssharepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `share_extragroupssharepermission_9a8c79bf` (`repo_id`),
  KEY `share_extragroupssharepermission_0e939a4f` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `share_extrasharepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repo_id` varchar(36) NOT NULL,
  `share_to` varchar(255) NOT NULL,
  `permission` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `share_extrasharepermission_9a8c79bf` (`repo_id`),
  KEY `share_extrasharepermission_e4fb1dad` (`share_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `share_fileshare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `token` varchar(100) NOT NULL,
  `ctime` datetime NOT NULL,
  `view_cnt` int(11) NOT NULL,
  `s_type` varchar(2) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `permission` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `share_fileshare_14c4b06b` (`username`),
  KEY `share_fileshare_9a8c79bf` (`repo_id`),
  KEY `share_fileshare_1abd88b5` (`s_type`),
  KEY `share_fileshare_4b65ca0f` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `share_orgfileshare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `file_share_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_share_id` (`file_share_id`),
  KEY `share_orgfileshare_9cf869aa` (`org_id`),
  CONSTRAINT `share_orgfil_file_share_id_7e98815f5df832f_fk_share_fileshare_id` FOREIGN KEY (`file_share_id`) REFERENCES `share_fileshare` (`id`)
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
  KEY `share_privatefiledirshare_f4f87abd` (`from_user`),
  KEY `share_privatefiledirshare_86899d6f` (`to_user`),
  KEY `share_privatefiledirshare_9a8c79bf` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `share_uploadlinkshare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `path` longtext NOT NULL,
  `token` varchar(100) NOT NULL,
  `ctime` datetime NOT NULL,
  `view_cnt` int(11) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `share_uploadlinkshare_14c4b06b` (`username`),
  KEY `share_uploadlinkshare_9a8c79bf` (`repo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sysadmin_extra_userloginlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `login_date` datetime NOT NULL,
  `login_ip` varchar(128) NOT NULL,
  `login_success` boolean NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sysadmin_extra_userloginlog_14c4b06b` (`username`),
  KEY `sysadmin_extra_userloginlog_28ed1ef0` (`login_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tags_filetag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid_id` char(32) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_filetag_uuid_id_5e2dc8ebbab85301_fk_tags_fileuuidmap_uuid` (`uuid_id`),
  KEY `tags_filetag_tag_id_39c4746ee9d70b71_fk_tags_tags_id` (`tag_id`),
  CONSTRAINT `tags_filetag_tag_id_39c4746ee9d70b71_fk_tags_tags_id` FOREIGN KEY (`tag_id`) REFERENCES `tags_tags` (`id`),
  CONSTRAINT `tags_filetag_uuid_id_5e2dc8ebbab85301_fk_tags_fileuuidmap_uuid` FOREIGN KEY (`uuid_id`) REFERENCES `tags_fileuuidmap` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tags_fileuuidmap` (
  `uuid` char(32) NOT NULL,
  `repo_id` varchar(36) NOT NULL,
  `repo_id_parent_path_md5` varchar(100) NOT NULL,
  `parent_path` longtext NOT NULL,
  `filename` varchar(1024) NOT NULL,
  `is_dir` boolean NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `tags_fileuuidmap_9a8c79bf` (`repo_id`),
  KEY `tags_fileuuidmap_c5bf47d4` (`repo_id_parent_path_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tags_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `termsandconditions_termsandconditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `name` longtext NOT NULL,
  `version_number` decimal(6,2) NOT NULL,
  `text` longtext,
  `info` longtext,
  `date_active` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `termsandconditions_termsandconditions_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `termsandconditions_usertermsandconditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `date_accepted` datetime NOT NULL,
  `terms_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `termsandconditions_usertermsandcon_username_f4ab54cafa29322_uniq` (`username`,`terms_id`),
  KEY `e4da106203f3f13ff96409b55de6f515` (`terms_id`),
  CONSTRAINT `e4da106203f3f13ff96409b55de6f515` FOREIGN KEY (`terms_id`) REFERENCES `termsandconditions_termsandconditions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `trusted_ip_trustedip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trusted_ip_trustedip_957b527b` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `two_factor_phonedevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `confirmed` boolean NOT NULL,
  `number` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `method` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `two_factor_staticdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `confirmed` boolean NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `two_factor_statictoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `token` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `two_fac_device_id_55a7b345293a7c6c_fk_two_factor_staticdevice_id` (`device_id`),
  KEY `two_factor_statictoken_94a08da1` (`token`),
  CONSTRAINT `two_fac_device_id_55a7b345293a7c6c_fk_two_factor_staticdevice_id` FOREIGN KEY (`device_id`) REFERENCES `two_factor_staticdevice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `two_factor_totpdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `confirmed` boolean NOT NULL,
  `key` varchar(80) NOT NULL,
  `step` int unsigned NOT NULL,
  `t0` bigint NOT NULL,
  `digits` int unsigned NOT NULL,
  `tolerance` int unsigned NOT NULL,
  `drift` int NOT NULL,
  `last_t` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
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