select b.name, bp.name from blog as b
inner join blogpost as bp on bp.blog_id = b.id;

select u.name, count(user_id) from user as u
inner join likes as l on l.user_id = u.id
group by u.name;

select b.name, bp.name, u.name from blog as b
inner join blogpost as bp on bp.blog_id = b.id
inner join likes as l on l.blog_post_id = bp.id
inner join user as u on u.id = l.user_id;

select u.name, b.name from user as u
inner join likes as l on l.user_id = u.id
inner join blogpost as bp on bp.id = l.blog_post_id
inner join blog as b on b.id = bp.blog_id
group by u.name, b.name;