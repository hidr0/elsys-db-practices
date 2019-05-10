USE Instagram;

SELECT u.username, p.name FROM iPost p
INNER JOIN iUser u ON p.user_id = u.id;

SELECT username, number_of_likes_on_own_posts FROM iUser;

SELECT u.username, p.name FROM iLikes l
INNER JOIN iUser u ON u.id =  l.user_id
INNER JOIN iPost p ON u.id =  l.post_id;

SELECT p.name, COUNT(l.user_id) FROM iPost p
INNER JOIN iLikes l ON l.post_id = p.id
GROUP BY l.post_id;