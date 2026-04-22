CREATE TABLE `OrgSharedRepo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int,
  `repo_id` char(37) ,
  `from_email` varchar(255),
  `to_email` varchar(255),
  `permission` char(15),
  PRIMARY KEY (`id`),
  KEY (`org_id`, `repo_id`),
  KEY (`from_email`),
  KEY (`to_email`)
) ENGINE=InnoDB;

ALTER TABLE `OrgSharedRepo` MODIFY `from_email` varchar(255);
ALTER TABLE `OrgSharedRepo` MODIFY `to_email` varchar(255);
