USE ks_user4;

COPY users (id, fb_token, gp_token, banned, ban_expiry, register_date) FROM '/home/user4/adm_project/users.csv' WITH DELIMITER = ';' AND HEADER = true;
COPY published (id, user_id, title, author, description, still_there, lat, lng, date, confirmation_date) FROM '/home/user4/adm_project/published.csv' WITH DELIMITER = ';' AND HEADER = true;
COPY unpublished (id, user_id, title, author, description, still_there, lat, lng, date, confirmation_date) FROM '/home/user4/adm_project/unpublished.csv' WITH DELIMITER = ';' AND HEADER = true;
COPY devices (user_id, dtoken) FROM '/home/user4/adm_project/devices.csv' WITH DELIMITER = ';' AND HEADER = true;