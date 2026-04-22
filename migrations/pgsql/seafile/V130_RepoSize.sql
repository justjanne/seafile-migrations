alter table reposize drop constraint reposize_pkey;
alter table reposize add column id bigserial primary key;
alter table reposize add unique (repo_id);
alter table reposize alter column repo_id type char(37);
alter table reposize alter column head_id type char(41);
