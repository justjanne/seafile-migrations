alter table repotrash drop constraint repotrash_pkey;
alter table repotrash add column id bigserial primary key;
alter table repotrash add unique (repo_id);
