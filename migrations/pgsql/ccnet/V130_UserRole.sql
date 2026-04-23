alter table userrole drop constraint userrole_email_role_key;
drop index if exists userrole_email_idx;
alter table userrole add column id bigserial primary key;
alter table userrole add unique (email);
alter table userrole add column is_manual_set integer default 0;
