-- 1) Given all the user’s information, create a unique account for an user (or remove)

	INSERT INTO users (id, ban_expiry, banned, fb_token, gp_token, register_date) 
	VALUES (501, 0, 0, '71678885163916348', '0', 1551597653000) IF NOT EXISTS;
  	
  	DELETE FROM users WHERE id = 501;
  	
-- 2) Log in, given the fb_token (or gp_token)

	SELECT * FROM users WHERE fb_token = '71678885163916348';

-- 3) Given the user ID, visualize the user’s account information

	SELECT * FROM users WHERE id = 11;

-- 4) Given the id retrive the published info

	SELECT * FROM published WHERE id = 411;

	-- retrive the info of the author related to the street art 

	SELECT * FROM authorsPublished WHERE published_id = 411;

-- 5) Given the id retrive the author info

	SELECT * FROM authors WHERE id = 26;

	-- retrive all the authors' arts

	SELECT * FROM authorsPublished WHERE author_id = 26;

-- 6) retrive the latest art of an author (possible using the secidx and order_by?? altrimenti potrebbe venire utile fare un'altra tabella per questo tipo di operazioni)

	SELECT * FROM authorsPublished WHERE author_id = 28 LIMIT 1;

-- 7) retrive the authors who are still active

	SELECT * FROM authors WHERE status = 'ACTIVE';

-- 8) insert a new art  -- si deve aggiungere unpublishedAuthor e userUnpublished??  -- da sistemare i dati dell'insert

	INSERT INTO unpublished (id, title, description, lat, lng, send_date)
	VALUES (25001, 'Ginger barriers', 'Description example', 53.0067, 67.378, 1551456481000);

	--	INSERT INTO authorsUnpublished (author_id, author_name, author_age int, author_gender, author_status, unpublished_id, unpublished_title, unpublished_description, unpublished_lat, unpublished_lng, unpublished_send_date)
	--	VALUES (7, 'Pejac', 16, 'F', 'RETIRED', 25001, 'Ginger barriers', 'Description example', 53.0067, 67.378, 1551456481000);

	--	INSERT INTO usersUnpublished (user_id, ban_expiry, banned, user_fb_token, user_gp_token, register_date, unpublished_id, unpublished_title, unpublished_description, unpublished_lat, unpublished_lng, unpublished_send_date)
	--	VALUES (25, '10289656733128031', '49123721886759640', 0, '0', '1551597653000', 25001, 'Ginger barriers', 'Description example', 53.0067, 67.378, 1551456481000);

-- 9) Compile a report

	INSERT INTO reports (id, description, status)
	VALUES (101, 'INCORRECT_NAME', 'AWAITING');

	--	INSERT INTO reportsPublished (id, description, status, published_id, published_title, published_description, published_lat, published_lng, published_send_date, published_confirmation_date)
	--	VALUES (101, 'INCORRECT_NAME', 'AWAITING', datiiiii);

-- 10) opere published da user dopo una certa data o in una certa data --da aggiungere dati

	SELECT * FROM usersPublished WHERE user_id = [] AND published_send_date = [];

	SELECT * FROM usersPublished WHERE user_id = [] AND published_send_date >= [];

-- 11) selezionare tutte le opere nello stesso luogo es festival --da aggiungere dati

	SELECT * FROM festival WHERE published_lat = [] AND published_lng = [];

	SELECT * FROM festival WHERE published_lat = [] AND published_lng = [] AND author_id = [];
