SELECT u.username AS 'User', p.post_name as 'Post'
FROM T_Post p
INNER JOIN T_User u
ON u.id = p.user_id;

SELECT username AS 'User', COUNT(l.user_id) AS 'Number of likes'
FROM T_User u
INNER JOIN Likes l
ON u.id = l.user_id
GROUP BY l.user_id;

SELECT u1.username AS 'User like', u2.username AS 'User liked'
FROM Likes l
INNER JOIN T_Post p
ON l.post_id = p.id
INNER JOIN T_User u1
ON u1.id = p.user_id
INNER JOIN T_User u2
ON u2.id = l.user_id;

SELECT post_name AS 'Post', COUNT(post_id) AS 'Likes'
FROM T_Post p
INNER JOIN Likes l
ON l.post_id = p.id
GROUP BY post_id;