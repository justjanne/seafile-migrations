alter table repousertoken add column id bigserial primary key;
alter table repousertoken alter column repo_id type char(37);
alter table repousertoken alter column token type char(41);
create index if not exists idx_repousertoken_token on repousertoken (token);
alter index repousertoken_email_idx rename to idx_repousertoken_email;
