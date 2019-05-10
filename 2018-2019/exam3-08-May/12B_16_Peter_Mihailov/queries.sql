Select u.name, p.name from User as u
LEFT JOIN Post p on p.user_id = u.id
group by u.name;

Select u.username, u.number_of_likes_on_own_posts from User u
group by u.username;

Select us.username, u.username from User u
Left Join Likes l on l.user_id = u.id
Left join Post p on p.id = l.post_id
Left join User us on us.id = p.user_id
group by us.username; 

Select p.name, count(l.id) from Post as p
LEFT JOIN Likes l on l.post_id = p.id
group by p.name;
