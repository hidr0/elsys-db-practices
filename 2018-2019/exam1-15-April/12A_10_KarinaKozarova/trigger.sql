CREATE TRIGGER VideosInsert
AFTER INSERT
ON video
FOR EACH ROW
	UPDATE user 
    SET number_of_total_views=(select count(views) from user u left join channel c on u.id = c.user_id left join video v on v.channel_id = u.id WHERE id=New.id) 
    WHERE New.id = User.id;

CREATE TRIGGER VideosUpdate
AFTER UPDATE
ON video
FOR EACH ROW
	UPDATE user 
    SET number_of_total_views=(select count(views) from user u left join channel c on u.id = c.user_id left join video v on v.channel_id = u.id WHERE id=New.id) 
    WHERE New.id = User.id;

CREATE TRIGGER VideosDelete
AFTER DELETE
ON video
FOR EACH ROW
	UPDATE user 
    SET number_of_total_views=(select count(views) from user u left join channel c on u.id = c.user_id left join video v on v.channel_id = u.id WHERE id=New.id) 
WHERE OLD.id = User.id;