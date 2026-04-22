ALTER TABLE UserActivity DROP FOREIGN KEY `UserActivity_ibfk_1`;
ALTER TABLE Activity CHANGE id id bigint AUTO_INCREMENT;
ALTER TABLE UserActivity CHANGE id id bigint AUTO_INCREMENT;
ALTER TABLE UserActivity CHANGE activity_id activity_id bigint;

ALTER TABLE FileHistory CHANGE id id bigint AUTO_INCREMENT;
ALTER TABLE FileAudit CHANGE eid eid bigint AUTO_INCREMENT;
ALTER TABLE FileUpdate CHANGE eid eid bigint AUTO_INCREMENT;
ALTER TABLE PermAudit CHANGE eid eid bigint AUTO_INCREMENT;
