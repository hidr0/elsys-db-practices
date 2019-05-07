SELECT b.name, bp.name
FROM Blog AS b
LEFT JOIN BlogPost AS bp ON b.id = bp.blog_id;

SELECT u.user, Sum(l.user_id)
FROM Likes AS l
LEFT JOIN User AS u ON l.user_id = u.id
GROUP BY(u.id);

SELECT l.id, b.name, u.user
FROM Likes AS l
LEFT JOIN BlogPost AS b ON b.id = l.blog_post
LEFT JOIN User AS u ON l.user_id = u.id;


SELECT u.user, l.user_id
FROM Likes AS l
LEFT JOIN User AS u ON l.user_id = u.id;