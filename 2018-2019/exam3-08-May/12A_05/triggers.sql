USE  Instagram;

DELIMITER $

CREATE TRIGGER increment_likes AFTER INSERT ON iLikes
FOR EACH ROW
BEGIN
	UPDATE iUser u 
		JOIN iPost p ON p.user_id = u.id
    SET u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts + 1
    WHERE NEW.post_id = p.id;
END$


CREATE TRIGGER update_likes AFTER UPDATE ON iLikes
FOR EACH ROW
BEGIN
	UPDATE iUser u 
		JOIN iPost p ON p.user_id = u.id
    SET u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts + 1
    WHERE NEW.post_id = p.id;
	
	UPDATE iUser u 
		JOIN iPost p ON p.user_id = u.id
    SET u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts - 1
    WHERE OLD.post_id = p.id;
END$


CREATE TRIGGER decrement_likes AFTER DELETE ON iLikes
FOR EACH ROW
BEGIN
	UPDATE iUser u 
		JOIN iPost p ON p.user_id = u.id
    SET u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts - 1
    WHERE OLD.post_id = p.id;
END$

DELIMITER ;