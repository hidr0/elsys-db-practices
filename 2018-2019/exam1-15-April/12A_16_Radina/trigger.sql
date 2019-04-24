CREATE TRIGGER update_INSERT_number_of_views
AFTER INSERT ON video
FOR EACH ROW
	UPDATE user AS u
    SET u.number_of_total_views = 
    (SELECT views FROM video v 
    LEFT JOIN channel c 
    on v.channel_id = c.id
    LEFT JOIN user us 
    on c.user_id = us.id
    )  WHERE NEW.Id = u.id;
    
CREATE TRIGGER update_number_of_views
AFTER UPDATE ON video
FOR EACH ROW
	UPDATE user AS u
    SET u.number_of_total_views = 
    (SELECT views FROM video v 
    LEFT JOIN channel c 
    on v.channel_id = c.id
    LEFT JOIN user us 
    on c.user_id = us.id
    )  WHERE NEW.Id = u.id;


CREATE TRIGGER update_DELETE_number_of_views
AFTER DELETE ON video
FOR EACH ROW
	UPDATE user AS u
    SET u.number_of_total_views = 
    (SELECT views FROM video v 
    LEFT JOIN channel c 
    on v.channel_id = c.id
    LEFT JOIN user us 
    on c.user_id = us.id
    )  WHERE OLD.Id = u.id;
   
