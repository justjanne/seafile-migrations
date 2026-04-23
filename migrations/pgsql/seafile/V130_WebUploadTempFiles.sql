alter table webuploadtempfiles add column id bigserial primary key;
create index if not exists idx_webuploadtempfiles_repo_id on webuploadtempfiles (repo_id);
