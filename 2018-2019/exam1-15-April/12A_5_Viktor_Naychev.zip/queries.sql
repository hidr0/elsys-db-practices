USE Youtube;

SELECT v.yname AS 'Video Name', v.views AS 'Video Views', u.yname as 'User name', c.yname AS 'Channel name' 
FROM YVideo v
LEFT JOIN YChannel c ON c.id = v.channel_id
INNER JOIN YUser u ON u.id = c.user_id;

SELECT c.yname AS 'Name of channel' 
FROM YChannel c
INNER JOIN YVideo v ON v.channel_id = c.id
GROUP BY c.yname;

SELECT u.yname AS 'Name of user', u.username AS 'Username', v.number_of_total_views AS 'numbre of views'
FROM YUser u
INNER JOIN YChannel c ON c.user_id = u.id
INNER JOIN YVideo v ON v.channel_id = c.id
GROUP BY u.name;