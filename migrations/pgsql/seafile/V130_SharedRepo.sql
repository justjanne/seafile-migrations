alter table sharedrepo add column id bigserial primary key;
alter table sharedrepo alter column repo_id type char(37);
alter table sharedrepo alter column permission type char(15);
alter index sharedrepo_repoid_idx rename to idx_sharedrepo_repo_id;
alter index sharedrepo_from_email_idx rename to idx_sharedrepo_from_email;
alter index sharedrepo_to_email_idx rename to idx_sharedrepo_to_email;
