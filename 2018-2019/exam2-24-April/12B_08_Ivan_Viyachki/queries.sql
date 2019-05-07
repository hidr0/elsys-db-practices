SELECT bp.name , b.name
FROM BlogPost bp
RIGHT JOIN Blog b
ON b.id = bp.blog_id
GROUP BY bp.name, b.name;

SELECT u.name , COUNT(*)
FROM User u
RIGHT JOIN Likes l
ON u.id = l.user_id
GROUP BY u.name;

SELECT b.name ,bp.name,u.name
FROM Likes l
INNER JOIN BlogPost bp
ON l.blog_id = bp.id
INNER JOIN User u
ON u.id = l.user_id
INNER JOIN Blog b
ON bp.blog_id = b.id
GROUP BY b.name, bp.name, u.name;

SELECT u.name, b.name
FROM User u 
INNER JOIN Likes l
ON l.user_id = u.id
INNER JOIN BlogPost bp
ON l.blog_id = bp.id
INNER JOIN Blog b
ON bp.blog_id = b.id

GROUP BY u.name, b.name;


