alter table sharedrepo alter column from_email type varchar(255);
alter table sharedrepo alter column to_email type varchar(255);
create index if not exists sharedrepo_from_email_idx on sharedrepo (from_email);
create index if not exists sharedrepo_to_email_idx on sharedrepo (to_email);
