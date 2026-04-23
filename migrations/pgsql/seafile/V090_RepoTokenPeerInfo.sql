alter table repotokenpeerinfo alter column peer_id type char(41);
create index if not exists idx_repotokenpeerinfo_peer_id on repotokenpeerinfo (peer_id);
