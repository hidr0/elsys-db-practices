SELECT b.name as 'Blog name', bp.name as 'BlogPost name' FROM blog_post as bp
INNER JOIN blog as b ON b.id = bp.blog_id;

SELECT u.name as 'User name', COUNT(l.id) as 'number of likes' FROM user as u
INNER JOIN likes as l ON l.user_id = u.id
GROUP BY u.id;

SELECT b.name as 'Blog name', bp.name as 'BlogPost name', u.name as 'User name' FROM likes as l
INNER JOIN blog_post as bp ON l.blog_post_id = bp.id
INNER JOIN blog as b ON b.id = bp.blog_id
INNER JOIN user as u ON l.user_id = u.id;

SELECT b.name as 'Blog name', u.name as 'User name' FROM likes as l
INNER JOIN blog_post as bp ON l.blog_post_id = bp.id
INNER JOIN blog as b ON b.id = bp.blog_id
INNER JOIN user as u ON l.user_id = u.id
GROUP BY u.name, b.name;
