alter table repogroup add column id bigserial primary key;
alter table repogroup alter column repo_id type char(37);
alter table repogroup alter column permission type char(15);
alter index repogroup_repoid_idx rename to idx_repogroup_repo_id;
alter index repogroup_username_idx rename to idx_repogroup_user_name;
