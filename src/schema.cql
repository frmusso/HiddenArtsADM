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

CREATE TABLE ks_user4.authors (
    id int PRIMARY KEY,
    name text,
    age int,
    gender text,
    status text
);

CREATE INDEX status_idx ON ks_user4.authors (status);

CREATE TABLE ks_user4.devices (
    dtoken text PRIMARY KEY,
    user_id int
);

CREATE TABLE ks_user4.published (
    id int PRIMARY KEY,
    title text,
    description text,
    lat float,
    lng float,
    send_date timestamp,
    confirmation_date timestamp 
);

CREATE TABLE ks_user4.unpublished (
    id int PRIMARY KEY,
    title text,
    description text,
    lat float,
    lng float,
    send_date timestamp,
    confirmation_date timestamp 
);

CREATE TABLE ks_user4.reports (
    id int PRIMARY KEY,
    description text,
    status text
);

CREATE INDEX reports_status_idx ON ks_user4.reports (status);

CREATE TABLE ks_user4.authorsPublished (
    author_id int,
    author_name text,
    author_age int,
    author_gender text,
    author_status text,
    published_id int,
    published_title text,	
    published_description text,	
    published_lat float,	
    published_lng float,	
    published_send_date timestamp,	
    published_confirmation_date timestamp,
    PRIMARY KEY((published_id), published_send_date))
    WITH CLUSTERING ORDER BY (published_send_date DESC);

CREATE INDEX author_id_idx ON ks_user4.authorsPublished (author_id);

CREATE TABLE ks_user4.usersPublished ( -- da cambiare in published_id, published_send_date e cambiare index in user_id
    user_id int,
    ban_expiry timestamp,
    banned tinyint,
    user_fb_token text,
    user_gp_token text,
    register_date timestamp,
    published_id int,	
    published_title text,	
    published_description text,	
    published_lat float,	
    published_lng float,	
    published_send_date timestamp,	
    published_confirmation_date timestamp,
    PRIMARY KEY((user_id), published_send_date, published_id)
);

CREATE INDEX published_id_idx ON ks_user4.usersPublished (published_id);

CREATE TABLE ks_user4.authorsUnpublished ( 
    author_id int,
    author_name text,
    author_age int,
    author_gender text,
    author_status text,
    unpublished_id int PRIMARY KEY,	
    unpublished_title text,	
    unpublished_description text,	
    unpublished_lat float,	
    unpublished_lng float,	
    unpublished_send_date timestamp,	
    unpublished_confirmation_date timestamp 
);

CREATE TABLE ks_user4.usersUnpublished (
    user_id int,
    ban_expiry timestamp,   
    banned tinyint,         
    user_fb_token text,     
    user_gp_token text,     
    register_date timestamp,
    unpublished_id int PRIMARY KEY,	
    unpublished_title text,	
    unpublished_description text,	
    unpublished_lat float,	
    unpublished_lng float,	
    unpublished_send_date timestamp,
    unpublished_confirmation_date timestamp 	
);

CREATE TABLE ks_user4.reportsPublished (
    report_id int PRIMARY KEY,
    report_description text,
    report_status text,
    published_id int,	
    published_title text,	
    published_description text,	
    published_lat float,	
    published_lng float,	
    published_send_date timestamp,	
    published_confirmation_date timestamp,
);

CREATE TABLE ks_user4.festival ( -- i dati sono queli della tabella authorsPublished semplicemente riorganizzati
    author_id int,
    author_name text,
    author_age int,
    author_gender text,
    author_status text,
    published_id int, 	
    published_title text,	
    published_description text,	
    published_lat float,	
    published_lng float,	
    published_send_date timestamp,	
    published_confirmation_date timestamp,
    PRIMARY KEY((published_lat, published_lng), published_send_date, published_id))
    WITH CLUSTERING ORDER BY (published_send_date DESC);

    CREATE INDEX festival_author_id_idx ON ks_user4.festival (author_id);


