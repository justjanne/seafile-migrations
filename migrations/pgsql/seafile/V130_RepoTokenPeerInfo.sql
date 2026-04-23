alter table repotokenpeerinfo drop constraint repotokenpeerinfo_pkey;
alter table repotokenpeerinfo add column id bigserial primary key;
alter table repotokenpeerinfo add unique (token);
alter table repotokenpeerinfo alter column token type char(41);
alter table repotokenpeerinfo alter column peer_id type char(41);
alter table repotokenpeerinfo alter column peer_ip type varchar(50);
create index if not exists idx_repotokenpeerinfo_peer_id on repotokenpeerinfo (peer_id);
