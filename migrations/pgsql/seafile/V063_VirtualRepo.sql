alter table virtualrepo drop constraint virtualrepo_pkey;
alter table virtualrepo add column id bigserial primary key;
alter table virtualrepo add unique (repo_id);
