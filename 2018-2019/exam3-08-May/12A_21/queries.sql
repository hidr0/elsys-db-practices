USE instagram;

SELECT users.username, posts.name  
FROM posts
INNER JOIN users ON posts.user_id = users.id;

SELECT users.username, COUNT(likes.user_id) 
FROM users
INNER JOIN likes ON users.id = likes.user_id;
