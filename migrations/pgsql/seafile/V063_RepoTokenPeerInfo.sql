alter table repotokenpeerinfo drop constraint repotokenpeerinfo_pkey;
alter table repotokenpeerinfo add column id bigserial primary key;
alter table repotokenpeerinfo add unique (token);
alter table repotokenpeerinfo alter column token type char(41);
