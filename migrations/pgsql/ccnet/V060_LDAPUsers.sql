drop index if exists ldapusers_email_idx;
create unique index if not exists ldapusers_email_idx on ldapusers (email);
