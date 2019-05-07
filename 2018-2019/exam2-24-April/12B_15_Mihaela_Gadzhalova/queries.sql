#1
SELECT bl.Name as 'Blog name', bp.Name as 'BlogPost name'
FROM BlogPost as bp
LEFT JOIN Blog as bl
ON bl.Id = bp.Blog_id;

#2
SELECT u.Name as 'User name', COUNT(u.Name) as 'Number of like'
FROM User as u
LEFT JOIN Likes as l
ON l.User_id = u.Id
GROUP BY u.Name;

#3
SELECT bl.Name as 'Blog name', bp.Name as 'BlogPost name', u.Name as 'User name'
FROM Likes as l
LEFT JOIN User as u
ON u.Id = l.User_id
LEFT JOIN BlogPost as bp
ON bp.Id = l.Blog_post_id
LEFT JOIN Blog as bl
ON bl.Id = bp.Blog_id;

#4
SELECT u.Name as 'User name', bl.Name as 'Blog name'
FROM Likes as l
INNER JOIN User as u
ON u.Id = l.User_id
INNER JOIN BlogPost as bp
ON bp.Id = l.Blog_post_id
INNER JOIN Blog as bl
ON bl.Id = bp.Blog_id
GROUP BY u.Name, bl.Name;



