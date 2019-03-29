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

	INSERT INTO published (id, title, description, lat, lng, send_date, confirmation_date) VALUES (25005, 'Lost Fog', 'Description example', 34.7073,-6.1634, 1553356215000, 1553356225000);

	INSERT INTO authorsPublished (author_id, author_name, author_age int, author_gender, author_status, published_id, published_title, published_description, published_lat, published_lng, published_send_date, published_confirmation_date) VALUES (29, 'Jeroo', 47, 'M', 'RETIRED', 25005, 'Lost Fog', 'Description example', 34.7073,-6.1634, 1553356215000, 1553356225000);

	INSERT INTO festival (author_id, author_name, author_age int, author_gender, author_status, published_id, published_title, published_description, published_lat, published_lng, published_send_date, published_confirmation_date) VALUES (29, 'Jeroo', 47, 'M', 'RETIRED', 25005, 'Lost Fog', 'Description example', 34.7073,-6.1634, 1553356215000, 1553356225000);

	INSERT INTO usersPublished (user_id, ban_expiry, banned, user_fb_token, user_gp_token, register_date, published_id, published_title, published_description, published_lat, published_lng, published_send_date, published_confirmation_date) VALUES (355, '76254565417212669', '63747950862390305', 0, '0', '1551597653000', 25005, 'Lost Fog', 'Description example', 34.7073,-6.1634, 1553356215000, 1553356225000);
	-- si deve cancellare da unpublished?? preferibilmente no (?)

-- 6) Given the reports status we search for the awaiting ones -

	SELECT * FROM reports WHERE status = 'AWAITING';

	-- we chose one of the awaiting ones and we analyze it

	SELECT * FROM reportsPublished WHERE report_id = 4;

	-- If the report is correct we do the update

	UPDATE published SET description = 'new description' WHERE id = 8251;

	UPDATE authorsPublished SET published_description = 'new description' WHERE published_id = 8251 AND published_send_date = '1551456467000'; 

	UPDATE festival SET published_description = 'new description' WHERE published_lat = 39.0813 AND published_lng = 68.5362 AND published_send_date = '1551456467000' AND published_id = 8251;

	UPDATE usersPublished SET published_description = 'new description' WHERE published_id = 8251  AND published_send_date = '1551456467000' AND user_id = 30;

		-- UPDATE published SET description = 'Description example' WHERE id = 8251;

		-- UPDATE authorsPublished SET published_description = 'Description example' WHERE published_id = 8251 AND published_send_date = '1551456467000'; 

		-- UPDATE festival SET published_description = 'Description example' WHERE published_lat = 39.0813 AND published_lng = 68.5362 AND published_send_date = '1551456467000' AND published_id = 8251;

		-- UPDATE usersPublished SET published_description = 'Description example' WHERE published_id = 8251  AND published_send_date = '1551456467000' AND user_id = 30;

	-- now we close the report

	UPDATE reportsPublished SET report_status = 'CLOSED' WHERE report_id = 4;

	UPDATE reports SET status = 'CLOSED' WHERE report_id = 4;

-- 7) User ban -

	UPDATE users SET banned = 1 , ban_expiry = '1551456596000' WHERE id = 45;


