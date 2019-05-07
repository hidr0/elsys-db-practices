SELECT b.name AS 'Blog Name', bp.name AS 'BlogPost name' FROM Blog AS b 
LEFT JOIN BlogPost AS bp ON b.id = bp.blog_id;

SELECT u.name AS 'User name', COUNT(b.number_of_likes) AS 'number of likes' FROM User AS u 
LEFT JOIN Likes AS l ON l.user_id = u.id
LEFT JOIN BlogPost AS bp ON bp.id = l.blog_post_id
LEFT JOIN Blog AS b ON b.id = bp.blog_id
GROUP BY u.name;

SELECT b.name AS 'Blog name',bp.name  AS 'BlogPost name',u.name AS 'User name' FROM User AS u 
LEFT JOIN Likes AS l ON l.user_id = u.id
LEFT JOIN BlogPost AS bp ON bp.id = l.blog_post_id
LEFT JOIN Blog AS b ON b.id = bp.blog_id;
