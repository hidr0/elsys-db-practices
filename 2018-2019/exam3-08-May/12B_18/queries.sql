
select u.username, p.name from Post p
inner join User u
on u.Id = p.user_id;

select u.username, COUNT(l.user_id) as number_of_likes from User u
inner join Likes l
on u.id = l.user_id
group by u.username;

select u.username, u1.username from Likes l
inner join User u
on u.Id = l.user_id
inner join Post p
on p.Id = l.post_id
inner join User u1
on u1.Id = p.user_id;


select p.name, COUNT(l.post_id) as number_of_likes_POST from Post p
inner join Likes l
on p.id = l.post_id
group by p.name;