USE Youtube;

DELIMITER $$
CREATE TRIGGER insert_video 
    AFTER INSERT ON Video
    FOR EACH ROW
BEGIN
    UPDATE User u
    INNER JOIN Channel c ON u.id = c.user_id
    INNER JOIN Video v ON c.id = v.channel_id
    SET number_of_total_views = number_of_total_views + NEW.views
    WHERE u.id = c.user_id AND c.id = v.channel_id;
END$$
DELIMITER ;