CREATE KEYSPACE ks_user4 WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '3'} AND durable_writes = true;

CREATE TABLE ks_user4.users (
    id int PRIMARY KEY,
    ban_expiry timestamp,
    banned tinyint,
    fb_token text,
    gp_token text,
    register_date timestamp
);

CREATE INDEX users_gp_token_idx ON ks_user4.users (gp_token);
CREATE INDEX users_fb_token_idx ON ks_user4.users (fb_token);

CREATE TABLE ks_user4.devices (
    dtoken text PRIMARY KEY,
    user_id int
);

CREATE TABLE ks_user4.published (
    id int PRIMARY KEY,
    author text,
    confirmation_date timestamp,
    date timestamp,
    description text,
    lat float,
    lng float,
    still_there tinyint,
    title text,
    user_id int
);

CREATE INDEX published_author_idx ON ks_user4.published (author);
CREATE INDEX published_title_idx ON ks_user4.published (title);

CREATE TABLE ks_user4.unpublished (
    id int PRIMARY KEY,
    author text,
    confirmation_date timestamp,
    date timestamp,
    description text,
    lat float,
    lng float,
    still_there tinyint,
    title text,
    user_id int
);