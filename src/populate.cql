USE ks_user4;

COPY users (id, fb_token, gp_token, banned, ban_expiry, register_date) FROM '/home/user4/adm_project/users.csv' WITH HEADER = true;
COPY published (id, title, description, lat, lng, send_date, confirmation_date) FROM '/home/user4/adm_project/published.csv' WITH HEADER = true;
COPY unpublished (id, user_id, title, author, description, still_there, lat, lng, date, confirmation_date) FROM '/home/user4/adm_project/unpublished.csv' WITH HEADER = true;
COPY devices (user_id, dtoken) FROM '/home/user4/adm_project/devices.csv' WITH HEADER = true;
COPY authors (id, name, age, gender, status) FROM '/home/user4/adm_project/authors.csv' WITH HEADER = true;
COPY authorsPublished (author_id, author_name, author_age, author_gender, author_status, published_id, published_title, published_description, published_lat, published_lng, published_send_date, published_confirmation_date) FROM '/home/user4/adm_project/authorsPublished.csv' WITH HEADER = true;
COPY usersPublished (user_id, user_fb_token, user_gp_token, banned, ban_expiry, register_date, published_id, published_title, published_description, published_lat, published_lng, published_send_date, published_confirmation_date) FROM '/home/user4/adm_project/usersPublished.csv' WITH HEADER = true;