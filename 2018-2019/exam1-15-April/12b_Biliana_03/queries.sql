SELECT v.v_name AS 'Video Name', v.views AS 'Video Views', u.name as 'User name', c.c_name AS 'Channel name' 
FROM Video v
LEFT JOIN Channel c ON c.id = v.channel_id
INNER JOIN User u ON u.id = c.user_id;

SELECT c.c_name AS 'Name of channel' 
FROM Channel c
INNER JOIN Video v ON v.channel_id = c.id
GROUP BY c.c_name;

SELECT u.name AS 'Name of user', u.username AS 'Username', u.number_of_total_views AS 'numbre of views'
FROM User u
INNER JOIN Channel c ON c.user_id = u.id
INNER JOIN Video v ON v.channel_id = c.id
GROUP BY u.name, u.username, u.number_of_total_views;