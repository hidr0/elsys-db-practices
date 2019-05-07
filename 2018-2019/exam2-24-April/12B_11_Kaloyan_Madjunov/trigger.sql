DROP TRIGGER IF EXISTS update_number_of_likes_after_insert;
DROP TRIGGER IF EXISTS update_number_of_likes_after_update;
DROP TRIGGER IF EXISTS update_number_of_likes_after_delete;

DELIMITER $$
CREATE TRIGGER update_number_of_likes_after_insert AFTER INSERT ON Likes
FOR EACH ROW
BEGIN
    UPDATE Blog AS b
    LEFT JOIN BlogPost AS bp
    ON b.id = bp.blog_id
    SET b.number_of_likes = b.number_of_likes + 1
    WHERE NEW.blog_post = bp.id;
END$$

CREATE TRIGGER update_number_of_likes_after_update AFTER UPDATE ON Likes
FOR EACH ROW
BEGIN
	UPDATE Blog AS b
    LEFT JOIN BlogPost AS bp
    ON b.id = bp.blog_id
    SET b.number_of_likes = b.number_of_likes - 1
    WHERE OLD.blog_post = bp.id;

    UPDATE Blog AS b
    LEFT JOIN BlogPost AS bp
    ON b.id = bp.blog_id
    SET b.number_of_likes = b.number_of_likes + 1
    WHERE NEW.blog_post = bp.id;
END$$

CREATE TRIGGER update_number_of_likes_after_delete AFTER DELETE ON Likes
FOR EACH ROW
BEGIN
    UPDATE Blog AS b
    LEFT JOIN BlogPost AS bp
    ON b.id = bp.blog_id
    SET b.number_of_likes = b.number_of_likes - 1
    WHERE OLD.blog_post = bp.id;
END$$
DELIMITER ;