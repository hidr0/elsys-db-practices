select u.username, p.name from post as p
join user as u on u.id = p.user_id;

select u.username, count(u.id) from user as u
join likes as l on u.id = l.user_id
group by u.username;

select u.username, su.username from user as u
join likes as l on u.id = l.user_id
join post as p on l.post_id = p.id
join user as su on p.user_id = su.id;

select p.name, count(p.id) from post as p
join likes as l on l.post_id = p.id
group by p.name;