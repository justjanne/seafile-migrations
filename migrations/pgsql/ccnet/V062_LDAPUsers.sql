alter table ldapusers add column reference_id varchar(255);
create unique index if not exists ldapusers_reference_id_idx on ldapusers (reference_id);
