
DELIMITER $
CREATE TRIGGER InsertLike
AFTER INSERT
ON Likes
FOR EACH ROW
BEGIN
	UPDATE User as u
    left join Post p on NEW.post_id = p.id
    set number_of_likes_on_own_posts = number_of_likes_on_own_posts  + 1
where user_id = u.id; 
END$


CREATE TRIGGER DeleteLike
AFTER Delete
ON Likes
FOR EACH ROW
BEGIN
	UPDATE User as u
    left join Post p on OLD.post_id = p.id
    set number_of_likes_on_own_posts = number_of_likes_on_own_posts  - 1
where user_id = u.id; 
END$

CREATE TRIGGER UpdateLikes 
AFTER UPDATE 
ON Likes
FOR EACH ROW
BEGIN

	UPDATE User as u
    left join Post p on OLD.post_id = p.id
    set number_of_likes_on_own_posts = number_of_likes_on_own_posts  - 1
	where OLD.user_id = u.id; 
    
    UPDATE User as u
    left join Post p on OLD.post_id = p.id
    set number_of_likes_on_own_posts = number_of_likes_on_own_posts  + 1
	where NEW.user_id = u.id; 
DELIMITER ;
