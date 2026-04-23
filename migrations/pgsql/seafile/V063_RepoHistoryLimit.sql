alter table repohistorylimit drop constraint repohistorylimit_pkey;
alter table repohistorylimit add column id bigserial primary key;
alter table repohistorylimit add unique (repo_id);
alter table repohistorylimit alter column repo_id type char(37);
