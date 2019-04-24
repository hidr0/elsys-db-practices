
SELECT videos.name, videos.views, channels.name as channel_name FROM videos
LEFT JOIN channels ON channel_id = channels.id;


SELECT channels.name, users.name FROM channels
LEFT JOIN users ON user_id = users.id;

SELECT users.name, users.user_name, users.numer_of_total_views FROM users;
WHERE users.numer_of_total_views > 1;

