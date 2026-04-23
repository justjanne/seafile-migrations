alter table repousertoken alter column repo_id type char(37);
alter table repousertoken alter column token type char(41);

alter index repousertoken_email_idx rename to idx_repousertoken_email;
