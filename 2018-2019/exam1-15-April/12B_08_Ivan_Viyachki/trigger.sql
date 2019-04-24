CREATE TRIGGER insertVideo
AFTER INSERT ON videos
FOR EACH ROW
	UPDATE users SET numer_of_total_views = numer_of_total_views + videos.views
    WHERE users.id = (SELECT user_id FROM videos WHERE NEW.user_id = id);
    
CREATE TRIGGER deleteVdeo
AFTER DELETE ON videos
FOR EACH ROW
	UPDATE users SET numer_of_total_views = numer_of_total_views - videos.views
    WHERE users.id = (SELECT user_id FROM videos WHERE OLD.user_id = id);
