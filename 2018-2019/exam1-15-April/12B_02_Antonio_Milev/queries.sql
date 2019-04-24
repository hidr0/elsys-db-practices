SELECT v.name AS 'Video Name', v.views AS 'Video Views', u.name AS 'User name', c.name AS 'Channel Name' FROM Video v
LEFT JOIN Channel c ON c.id = v.channel_id
LEFT JOIN User u ON u.id = c.user_id;

SELECT c.name AS 'Name of channel' FROM Channel c
INNER JOIN Video v ON v.channel_id = c.id
GROUP BY c.name;

SELECT u.name AS 'Name of user', u.username AS 'Username', u.number_of_total_views 'number of views' FROM User u
INNER JOIN Channel c ON c.user_id = u.id
INNER JOIN Video v ON v.channel_id = c.id
GROUP BY u.name, u.username, u.number_of_total_views;
