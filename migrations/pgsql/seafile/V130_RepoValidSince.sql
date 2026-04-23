alter table repovalidsince drop constraint repovalidsince_pkey;
alter table repovalidsince add column id bigserial primary key;
alter table repovalidsince add unique (repo_id);
alter table repovalidsince alter column repo_id type char(37);
