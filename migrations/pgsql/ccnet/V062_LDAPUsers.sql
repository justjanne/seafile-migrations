alter table ldapusers add column reference_id varchar(255);

alter index if exists LDAPUsers_reference_id rename to ldapusers_reference_id_idx;
create unique index if not exists ldapusers_reference_id_idx on ldapusers (reference_id);
