SELECT b.name as 'Blog name', bp.name as 'BlogPost name' 
FROM Blog as b
LEFT JOIN BlogPost as bp ON bp.blog_id = b.id;

SELECT u.name as 'User name', b.number_of_likes
FROM User as u
LEFT JOIN Likes as likes ON likes.user_id = u.id
LEFT JOIN BlogPost as bp ON bp.id = likes.blog_post_id
LEFT JOIN Blog as b ON b.id = bp.blog_id;

SELECT b.name as 'Blog name', bp.name as 'BlogPost name', u.name as 'User name' 
FROM Blog as b
LEFT JOIN BlogPost as bp ON bp.blog_id = b.id
LEFT JOIN Likes as likes ON likes.user_id = bp.id
LEFT JOIN User as u ON likes.user_id = u.id;

SELECT u.name as 'User name', b.name as 'Blog name'
FROM User as u
LEFT JOIN Likes as likes ON likes.user_id = u.id
LEFT JOIN BlogPost as bp ON bp.id = likes.blog_post_id
LEFT JOIN Blog as b ON bp.blog_id = b.id
GROUP BY u.name, u.id, b.name;
