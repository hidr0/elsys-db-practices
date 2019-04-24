USE Youtube;

DELIMITER $

CREATE TRIGGER update_views AFTER INSERT ON YUser
FOR EACH ROW
BEGIN
	UPDATE YUser u SET u.number_of_total_views = u_v.views
    FROM (
		SELECT u.id AS id, SUM(v.views) AS views 
		FROM YVideo v
		LEFT JOIN YChannel c ON v.id = c.id 
		LEFT JOIN YUser u ON c.user_id = u.id
		GROUP BY u.id) AS u_v
	WHERE NEW.id = u_v.id
END$

CREATE TRIGGER update_views AFTER DELETE ON YUser
FOR EACH ROW
BEGIN
	UPDATE YUser u 
    SET u.number_of_total_views = u_v.views
    FROM (
		SELECT u.id AS id, SUM(v.views) AS views 
		FROM YVideo v
		LEFT JOIN YChannel c ON v.id = c.id 
		LEFT JOIN YUser u ON c.user_id = u.id
		GROUP BY u.id) AS u_v
	WHERE NEW.id = u_v.id
END$

CREATE TRIGGER update_views AFTER UPDATE ON YUser
FOR EACH ROW
BEGIN
	UPDATE YUser u 
    SET u.number_of_total_views = u_v.views
    FROM (
		SELECT u.id AS id, SUM(v.views) AS views 
		FROM YVideo v
		LEFT JOIN YChannel c ON v.id = c.id 
		LEFT JOIN YUser u ON c.user_id = u.id
		GROUP BY u.id) AS u_v
	WHERE NEW.id = u_v.id
END$

DELIMITER ;
    