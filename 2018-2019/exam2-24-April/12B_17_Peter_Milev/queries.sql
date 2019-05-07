SELECT b.name AS 'Blog name', bp.name AS 'BlogPost name' FROM BlogPost bp
INNER JOIN Blog b ON b.id = bp.blog_id
GROUP BY b.name, bp.name;

SELECT u.name AS 'User name', COUNT(*) AS 'number of likes' FROM User u
INNER JOIN Likes l ON l.user_id = u.id
GROUP BY u.name;

SELECT b.name AS 'Blog name', bp.name AS 'BlogPost name', u.name 'User name' FROM Likes l
INNER JOIN BlogPost bp ON bp.id = l.blog_post_id
INNER JOIN User u ON u.id = l.user_id
INNER JOIN Blog b ON b.id = bp.blog_id
GROUP BY b.name, bp.name, u.name;

SELECT u.name AS 'User name', b.name AS 'Blog name' FROM User u
INNER JOIN Likes l ON l.user_id = u.id
INNER JOIN BlogPost bp ON l.blog_post_id = bp.id
INNER JOIN Blog b ON bp.blog_id = b.id
GROUP BY u.name, b.name;