#1
SELECT b.name AS 'Blog', bp.name AS 'Post'
FROM BlogPost AS bp
LEFT JOIN Blog AS b
ON bp.blog_id = b.id;

#2
SELECT u.name AS 'User', COUNT(l.user_id)
FROM User AS u
LEFT JOIN Likes AS l
ON l.user_id = u.id
GROUP BY u.name;

#3
SELECT b.name AS 'Blog', bp.name AS 'Post', u.name AS 'User'
FROM BlogPost AS bp
LEFT JOIN Likes AS l
ON l.blog_post = bp.id
LEFT JOIN User AS u
ON l.user_id = u.id
LEFT JOIN Blog AS b
ON bp.blog_id = b.id;

#4
SELECT u.name AS 'User', b.name AS 'Blog'
FROM BlogPost AS bp
LEFT JOIN Likes AS l
ON l.blog_post = bp.id
LEFT JOIN User AS u
ON l.user_id = u.id
LEFT JOIN Blog AS b
ON bp.blog_id = b.id
GROUP BY u.name, b.name;
