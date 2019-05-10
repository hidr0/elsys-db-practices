DELIMITER $

CREATE TRIGGER insert_likes
AFTER INSERT ON Likes FOR EACH ROW
BEGIN
    UPDATE T_User u
	SET number_of_likes_on_own_posts = number_of_likes_on_own_posts + 1 
	WHERE NEW.user_id = u.id;
END$

CREATE TRIGGER delete_likes
AFTER DELETE ON Likes FOR EACH ROW
BEGIN
	UPDATE T_User u
	SET number_of_likes_on_own_posts = number_of_likes_on_own_posts - 1
    WHERE OLD.user_id = u.id;
END$

CREATE TRIGGER update_likes
AFTER UPDATE ON Likes FOR EACH ROW
BEGIN
	UPDATE T_User u
	SET number_of_likes_on_own_posts = number_of_likes_on_own_posts - 1
    WHERE OLD.user_id = u.id;
    
	UPDATE T_User u
	SET number_of_likes_on_own_posts = number_of_likes_on_own_posts + 1
    WHERE NEW.user_id = u.id;

DELIMITER ;