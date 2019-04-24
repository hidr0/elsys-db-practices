DELIMITER $

CREATE TRIGGER add_views AFTER INSERT ON Video
FOR EACH ROW
BEGIN
	UPDATE User u 
    INNER JOIN Channel c
    ON c.user_id = u.id
    INNER JOIN Video v
    ON v.channel_id = c.id
    SET u.number_of_total_views = u.number_of_total_views + NEW.views
    WHERE v.id = NEW.id;
END$

CREATE TRIGGER rm_views AFTER DELETE ON Video
FOR EACH ROW
BEGIN
	UPDATE User u 
    INNER JOIN Channel c
    ON c.user_id = u.id
    INNER JOIN Video v
    ON v.channel_id = c.id
    SET u.number_of_total_views = u.number_of_total_views - OLD.views
    WHERE v.id = OLD.id;
END$

CREATE TRIGGER mod_views AFTER UPDATE ON Video
FOR EACH ROW
BEGIN
	UPDATE User u 
    INNER JOIN Channel c
    ON c.user_id = u.id
    INNER JOIN Video v
    ON v.channel_id = c.id
    SET u.number_of_total_views = u.number_of_total_views + NEW.views - OLD.views
    WHERE v.id = NEW.id;
END$

DELIMITER ;
