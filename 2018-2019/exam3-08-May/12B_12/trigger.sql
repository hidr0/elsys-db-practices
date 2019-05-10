DROP TRIGGER IF EXISTS insertLike;
DROP TRIGGER IF EXISTS updateLike;
DROP TRIGGER IF EXISTS deleteLike;

DELIMITER $

CREATE TRIGGER insertLike
AFTER INSERT
ON Likes
FOR EACH ROW
BEGIN
	UPDATE User as u 
    left join Post p on new.post_id = p.id
    SET u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts + 1
where user_id = u.id;
END$


CREATE TRIGGER deleteLike
AFTER DELETE
ON Likes
FOR EACH ROW
BEGIN
	UPDATE User as u 
    left join Post p on old.post_id = p.id
    SET u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts - 1
where user_id = u.id;
END$

CREATE TRIGGER insertLike
AFTER UPDATE
ON Likes
FOR EACH ROW
BEGIN
	UPDATE User as u 
    left join Post p on new.post_id = p.id
    SET u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts + 1
where user_id = u.id;

UPDATE User as u 
    left join Post p on old.post_id = p.id
    SET u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts - 1
where user_id = u.id;

END$

DELIMITER ;