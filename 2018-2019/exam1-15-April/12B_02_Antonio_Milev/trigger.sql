delimiter //
CREATE TRIGGER video_ai AFTER INSERT ON Video
   FOR EACH ROW
   BEGIN
		DECLARE uid INTEGER;
        SET uid = (SELECT u.id FROM User u
					LEFT JOIN Channel c ON c.user_id = u.id
                    WHERE c.id = NEW.channel_id);
		UPDATE User u SET u.number_of_total_views = u.number_of_total_views + NEW.views
		WHERE  u.id = uid;
   END;//
delimiter ;

delimiter //
CREATE TRIGGER video_ad AFTER DELETE ON Video
   FOR EACH ROW
   BEGIN
		DECLARE uid INTEGER;
        SET uid = (SELECT u.id FROM User u
					LEFT JOIN Channel c ON c.user_id = u.id
                    WHERE c.id = OLD.channel_id);
		UPDATE User u SET u.number_of_total_views = u.number_of_total_views - OLD.views
		WHERE  u.id = uid;
   END;//
delimiter ;

delimiter //
CREATE TRIGGER video_au AFTER UPDATE ON Video
   FOR EACH ROW
   BEGIN
		DECLARE old_uid INTEGER;
		DECLARE new_uid INTEGER;
                
        SET old_uid = (SELECT u.id FROM User u
					LEFT JOIN Channel c ON c.user_id = u.id
                    WHERE c.id = OLD.channel_id);
                    
        SET new_uid = (SELECT u.id FROM User u
					LEFT JOIN Channel c ON c.user_id = u.id
                    WHERE c.id = NEW.channel_id);		
                    
		UPDATE User u SET u.number_of_total_views = u.number_of_total_views - OLD.views
		WHERE  u.id = old_uid;
        
        UPDATE User u SET u.number_of_total_views = u.number_of_total_views + NEW.views
		WHERE  u.id = new_uid;
   END;//
delimiter ;
