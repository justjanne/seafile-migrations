alter table repotrash drop constraint repotrash_pkey;
alter table repotrash add column id bigserial primary key;
alter table repotrash add unique (repo_id);
alter index repotrash_owner_id rename to idx_repotrash_owner_id;
alter index repotrash_org_id rename to idx_repotrash_org_id;
