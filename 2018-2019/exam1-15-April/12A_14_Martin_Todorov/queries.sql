USE Youtube;

SELECT v.name AS 'Video Name', v.views AS 'Video Views', 
u.username AS 'User Name', c.name AS 'Channel Name'
FROM Video v
LEFT JOIN Channel c ON c.id = v.channel_id
INNER JOIN User u ON u.id = c.user_id;

SELECT c.name AS 'Name of channel'
FROM Channel c
RIGHT JOIN Video v ON c.id = v.channel_id
GROUP BY c.id;

SELECT u.name AS 'Name of user', u.username AS 'Username', u.number_of_total_views AS 'number of views'
FROM User u
RIGHT JOIN Channel c ON u.id = c.user_id
GROUP BY u.id;