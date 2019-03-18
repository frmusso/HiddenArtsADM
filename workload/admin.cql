-- 1) Given all the admin’s information, create a unique account for an admin (or remove)

	INSERT INTO admin (id, password, name, date_of_birth)
	VALUES (201,'example_password', 'mrprop', 19901212) IF NOT EXISTS;
  	
  	
  	DELETE FROM admin WHERE id = 201;
  	
-- 2) Log in, given the admin ID and the current password

	-- The password validity is check at application level

	SELECT * FROM admin WHERE id = 23;
	
-- 3) Change the password, given the admin ID, the old password and the new one

	-- The old password validity is check at application level as query 2)
	-- new_password is meant to be hashed

	UPDATE admin SET password = 'new_password' WHERE id = 11;

-- 4) Given the admin ID, visualize the admin’s account information

	SELECT * FROM admin WHERE id = 11;

-- 5) Given the unpublished id, the admin checks if it is compliant 

	SELECT * FROM unpublished WHERE id = 1;

	-- If compliant, at application level the data are copied for the insert

	INSERT INTO published (id, title, description, lat, lng, send_date, confirmation_date) VALUES (25001, 'Ginger barriers', 'Description example', 53.0067, 67.378, 1551456481000, 1551456596000);

	--	INSERT INTO authorsPublished (author_id, author_name, author_age int, author_gender, author_status, published_id, published_title, published_description, published_lat, published_lng, published_send_date, published_confirmation_date)
	--	VALUES (7, 'Pejac', 16, 'F', 'RETIRED', 25001, 'Ginger barriers', 'Description example', 53.0067, 67.378, 1551456481000, 1551456596000);

	--	INSERT INTO usersPublished (user_id, ban_expiry, banned, user_fb_token, user_gp_token, register_date, published_id, published_title, published_description, published_lat, published_lng, published_send_date, published_confirmation_date)
	--	VALUES (25, '10289656733128031', '49123721886759640', 0, '0', '1551597653000', 25001, 'Ginger barriers', 'Description example', 53.0067, 67.378, 1551456481000, 1551456596000);

	-- si deve cancellare da unpublished?? preferibilmente no (?)

-- 6) Given the reports status we search for the awaiting ones

	SELECT * FROM reports WHERE status = 'AWAITING';

	-- we chose one of the awaiting ones and we analyze it

	SELECT * FROM reportsPublished WHERE report_id = 4;

	-- If the report is correct we do the update

	UPDATE published SET description = 'new description' WHERE id = 8251;

	--	UPDATE authorsPublished SET published_description = 'new description' WHERE published_id = 8251;

	--	UPDATE usersPublished SET published_description = 'new description' WHERE published_id = 8251; --where on the secondary idx??

	-- now we close the report

	--	UPDATE reportsPublished SET report_status = 'CLOSED' WHERE report_id = 4;

	UPDATE reports SET status = 'CLOSED' WHERE report_id = 4;

-- 7) User ban

	UPDATE users SET banned = 1 , ban_expiry = '' WHERE id = 45;

-- 8) search for banned user that still have at least one more week of ban?

