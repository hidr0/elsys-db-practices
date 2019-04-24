SELECT v.name AS 'Video Name', v.views AS 'Video Views',
u.name AS 'User name', c.name AS 'Channel Name'
FROM Video v
INNER JOIN Channel c
ON v.channel_id = c.id
INNER JOIN User u
ON c.user_id = u.id;


SELECT c.name AS 'Name of channel' FROM Channel c
INNER JOIN Video v
ON v.channel_id = c.id
GROUP BY c.name;

SELECT u.name AS 'Name of user', u.username AS 'Username',
u.number_of_total_views AS 'number of views'
FROM Video v
INNER JOIN Channel c
ON v.channel_id = c.id
INNER JOIN User u
ON c.user_id = u.id
GROUP BY u.id;
