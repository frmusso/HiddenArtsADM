-- 1) Given all the user’s information, create a unique account for an user (or remove) -

	INSERT INTO users (id, banned, fb_token, register_date) VALUES (501, 0, '71678885163916348', 1551597653000) IF NOT EXISTS;
  	
  	DELETE FROM users WHERE id = 501;
  	
-- 2) Log in, given the fb_token (or gp_token) -

	SELECT * FROM users WHERE fb_token = '71678885163916348';

	-- autologin/keeping user's session active

	INSERT INTO devices (dtoken, user_id)  VALUES ('jUNweAKbsdfrcaUiKf0VkqRatGusYLi98c1zxSe7DFYso5TM5EBF78ztCcC8FRNIcgtAJUlsAsSe2YmYmiXTKcCAc7xUPG2lsPQHbTCKTJEePU1dqelWutxzesXbW0cu06mMIem3fMAB7XlSGU4bUFrz', 501);

	SELECT * FROM devices WHERE dtoken = 'jUNweAKbsdfrcaUiKf0VkqRatGusYLi98c1zxSe7DFYso5TM5EBF78ztCcC8FRNIcgtAJUlsAsSe2YmYmiXTKcCAc7xUPG2lsPQHbTCKTJEePU1dqelWutxzesXbW0cu06mMIem3fMAB7XlSGU4bUFrz';

-- 3) Given the user ID, visualize the user’s account information -

	SELECT * FROM users WHERE id = 11;

-- 4) Given the id retrive the published info -

	SELECT * FROM published WHERE id = 411;

	-- retrive the info of the author related to the street art -

	SELECT * FROM authorsPublished WHERE published_id = 411;

-- 5) Given the id retrive the author info -

	SELECT * FROM authors WHERE id = 26;

	-- retrive all the authors' arts -

	SELECT * FROM authorsPublished WHERE author_id = 26;

-- 6) retrive the latest art of an author -

	SELECT * FROM authorsPublished WHERE author_id = 28 LIMIT 1;

-- 7) retrive the authors who are still active -

	SELECT * FROM authors WHERE status = 'ACTIVE';

-- 8) insert a new art

	INSERT INTO unpublished (id, title, description, lat, lng, send_date, confirmation_date) VALUES (5001, 'Little Chef', 'Description example', 53.0067, 67.378, 1551466481000, 0);

	INSERT INTO authorsUnpublished (author_id, author_name, author_age int, author_gender, author_status, unpublished_id, unpublished_title, unpublished_description, unpublished_lat, unpublished_lng, unpublished_send_date, unpublished_confirmation_date) VALUES (1, 'Li-Hill', 29, 'F', 'RETIRED', 5001, 'Little Chef', 'Description example', 53.0067, 67.378, 1551466481000, 0);

	INSERT INTO usersUnpublished (user_id, ban_expiry, banned, user_fb_token, user_gp_token, register_date, unpublished_id, unpublished_title, unpublished_description, unpublished_lat, unpublished_lng, unpublished_send_date, unpublished_confirmation_date) VALUES (2, '52978759874549647', '31025093435374447', 0, '0', '1551462259000', 5001, 'Little Chef', 'Description example', 53.0067, 67.378, 1551466481000, 0);

-- 9) Compile a report --forse bisogna aggiungere user_id inn reportsPublished

	INSERT INTO reports (id, description, status) VALUES (101, 'INCORRECT_NAME', 'AWAITING');

	INSERT INTO reportsPublished (id, description, status, published_id, published_title, published_description, published_lat, published_lng, published_send_date, published_confirmation_date) VALUES (101, 'INCORRECT_NAME', 'AWAITING', 101, 'when Moving', 'Description example', 47.0765, 99.8497, 1551456416000, 1551456617000);

-- 10) opere published da user dopo una certa data o in un certo giorno -

	SELECT * FROM usersPublished WHERE user_id = 348 AND published_send_date >= 1551446416000 AND published_send_date <= 1551456416000;

	SELECT * FROM usersPublished WHERE user_id = 40 AND published_send_date >= 0 ORDER BY published_send_date DESC;

-- 11) selezionare tutte le opere nello stesso luogo es festival -

	SELECT * FROM festival WHERE published_lat = -2.6384 AND published_lng = 22.0455;

	SELECT * FROM festival WHERE published_lat = -2.6384 AND published_lng = 22.0455 AND author_id = 8;
