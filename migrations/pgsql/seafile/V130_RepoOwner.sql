alter table repoowner drop constraint repoowner_pkey;
alter table repoowner add column id bigserial primary key;
alter table repoowner add unique (repo_id);
alter table repoowner alter column repo_id type char(37);
alter index repoowner_owner_idx rename to idx_repoowner_owner_id;
