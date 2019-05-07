DROP TRIGGER IF EXISTS on_insert;
DROP TRIGGER IF EXISTS on_delete;
DROP TRIGGER IF EXISTS on_update;

DELIMITER $$
CREATE TRIGGER on_insert AFTER INSERT
ON Likes
FOR EACH ROW
BEGIN
    UPDATE Blog b
    INNER JOIN BlogPost bp ON b.id = bp.blog_id AND bp.id = NEW.blog_post_id
    SET b.number_of_likes = b.number_of_likes + 1;
END$$

CREATE TRIGGER on_delete AFTER DELETE
ON Likes
FOR EACH ROW
BEGIN
    UPDATE Blog b
    INNER JOIN BlogPost bp ON b.id = bp.blog_id AND bp.id = OLD.blog_post_id
    SET b.number_of_likes = b.number_of_likes - 1;
END$$

CREATE TRIGGER on_update AFTER UPDATE
ON Likes
FOR EACH ROW
BEGIN
	UPDATE Blog b
    INNER JOIN BlogPost bp ON b.id = bp.blog_id AND bp.id = OLD.blog_post_id
    SET b.number_of_likes = b.number_of_likes - 1;

    UPDATE Blog b
    INNER JOIN BlogPost bp ON b.id = bp.blog_id AND bp.id = NEW.blog_post_id
    SET b.number_of_likes = b.number_of_likes + 1;
END$$
DELIMITER ;