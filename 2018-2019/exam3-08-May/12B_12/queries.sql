Select u.username, p.name from Post as p
Left join User as u on u.id = p.user_id;

Select u.username, count(l.id) from User u
Left join Likes as l ON l.user_id = u.id
group by u.username;

Select u.username, p.name, ua.username from User as u
Left join Likes as l on u.id = l.user_id
Left join User as ua on ua.id = l.post_id
Left join Post as p on p.id = l.post_id
group by u.username, p.name, ua.username;

Select p.name, count(l.id) from Post as p
Left join User as u on u.id = p.id
Left join Likes l on l.post_id = p.id
Left join User as ua on ua.id = l.user_id
group by p.name;