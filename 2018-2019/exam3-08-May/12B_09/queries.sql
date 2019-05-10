select u.username, p.name from Post as p
join User as u
on u.id = p.user_id
group by u.username, p.name;

select u.username, u.number_of_likes_on_own_posts from User as u
group by u.username, u.number_of_likes_on_own_posts;

select u.username, u1.username from Likes as l
join User as u
on u.id = l.user_id
join Post as p
on p.id = l.post_id
join User as u1
on p.user_id = u1.id;

select p.name, count(l.id) from Post as p
join Likes as l
on p.id = l.post_id
group by p.name;