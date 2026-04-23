alter table userrole drop constraint userrole_email_role_key;
drop index if exists userrole_email_idx;
alter table userrole add unique (email);
