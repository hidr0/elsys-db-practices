select (b.name, bp.name) from Blog as b
join BlogPost as bp
on b.id = bp.blog_id;

select (u.name, count(l)) from User as u
join Likes as l 
on l.user_id = u.id
group by u.name;

select (bp.name, b.name, u.name) from Likes as l
join User as u
on l.user_id = u.id
join BlogPost as bp
on l.blog_post_id = bp.id
join Blog as b 
on bp.blog_id = b.id
group by (bp.name, b.name, u.name);

select (u.name, b.name) from Likes as l
join User as u
on l.user_id = u.id
join BlogPost as bp
on l.blog_post_id = bp.id
join Blog as b 
on bp.blog_id = b.id
group by (u.name, b.name);
