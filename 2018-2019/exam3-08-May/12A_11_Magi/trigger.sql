delimiter //
CREATE TRIGGER Like_counter AFTER INSERT ON Likes
	FOR EACH ROW 
	Begin
		UPDATE Users SET number_of_likes_on_own_posts = (SELECT COUNT(l.post_id) AS 'number of likes' FROM Post p
													INNER JOIN Likes l ON l.post_id = p.id
                                                    INNER JOIN Users u ON u.id = p.user_id
													GROUP BY p.p_name);
	end ; // 
delimiter ;

delimiter //
CREATE TRIGGER Like_counter AFTER UPDATE ON Likes
	FOR EACH ROW 
	Begin
		UPDATE Users SET number_of_likes_on_own_posts = (SELECT COUNT(l.post_id) AS 'number of likes' FROM Post p
													INNER JOIN Likes l ON l.post_id = p.id
                                                    INNER JOIN Users u ON u.id = p.user_id
													GROUP BY p.p_name);
	end ; // 
delimiter ;

delimiter //
CREATE TRIGGER Like_counter AFTER DELETE ON Likes
	FOR EACH ROW 
	Begin
		UPDATE Users SET number_of_likes_on_own_posts = (SELECT COUNT(l.post_id) AS 'number of likes' FROM Post p
													INNER JOIN Likes l ON l.post_id = p.id
                                                    INNER JOIN Users u ON u.id = p.user_id
													GROUP BY p.p_name);
	end ; // 
delimiter ;