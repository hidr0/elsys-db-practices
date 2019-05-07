CREATE TRIGGER insert_trigger AFTER INSERT ON likes
FOR EACH ROW
	UPDATE blog AS b
    INNER JOIN blog_post AS bp ON NEW.blog_post_id = bp.id
    SET b.number_of_likes = b.number_of_likes + 1
    WHERE NEW.blog_post_id = bp.blog_id AND bp.blog_id = b.id;

CREATE TRIGGER delete_trigger AFTER DELETE ON likes
FOR EACH ROW
	UPDATE blog AS b
    INNER JOIN blog_post AS bp ON OLD.blog_post_id = bp.id
    SET b.number_of_likes = b.number_of_likes - 1
    WHERE OLD.blog_post_id = bp.blog_id AND bp.blog_id = b.id;

DELIMITER $    
CREATE TRIGGER update_trigger AFTER UPDATE ON likes
FOR EACH ROW
BEGIN
	UPDATE blog AS b
    INNER JOIN blog_post AS bp ON NEW.blog_post_id = bp.id
    SET b.number_of_likes = b.number_of_likes + 1
    WHERE NEW.blog_post_id = bp.blog_id AND bp.blog_id = b.id;
    
    UPDATE blog AS b
    INNER JOIN blog_post AS bp ON OLD.blog_post_id = bp.id
    SET b.number_of_likes = b.number_of_likes - 1
    WHERE OLD.blog_post_id = bp.blog_id AND bp.blog_id = b.id;
END$

DELIMITER ;