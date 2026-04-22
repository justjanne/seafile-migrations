create table if not exists binding
(
    email varchar(255),
    peer_id char(41),
    unique (peer_id)
);
