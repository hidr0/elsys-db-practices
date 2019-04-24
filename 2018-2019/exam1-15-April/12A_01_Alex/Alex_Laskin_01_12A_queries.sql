USE school;

SELECT v.name AS 'Video Name', v.views AS 'Video views', u.name AS 'User name', c.name AS 'Channel name'
FROM video v 
LEFT JOIN channel c ON c.id = v.channel_id
LEFT JOIN user u ON u.id = c.user_id;

SELECT c.name AS 'Name of channel' FROM channel c
INNER JOIN video v ON v.channel_id = c.id
GROUP BY c.id;

SELECT u.name AS 'Name of user', u.username AS 'Username' , number_of_total_views AS 'number of views'
FROM user u INNER JOIN channel c ON c.user_id = u.id
INNER JOIN video v ON v.channel_id = c.id
GROUP BY u.id;
