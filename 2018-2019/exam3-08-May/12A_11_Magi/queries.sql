SELECT u.u_name AS 'User name', p.p_name AS 'Post name' FROM Post p
INNER JOIN Users u ON u.id = p.user_id;

SELECT u.u_name AS 'User name', u.number_of_likes_on_own_posts AS 'number of likes' FROM Users u;

SELECT u.u_name AS 'User name', u.u_name AS 'User name' FROM Likes l
LEFT JOIN Users u ON u.id = l.user_id
Left JOIN Post p ON p.user_id = u.id AND p.id = l.post_id;

SELECT p.p_name AS 'Post name', COUNT(l.post_id) AS 'number of likes' FROM Post p
INNER JOIN Likes l ON l.post_id = p.id
GROUP BY p.p_name;
