select b.name, bp.name from blogpost as bp
join blog as b on bp.blog_id = b.id;

select u.name, count(u.name) from user as u
join likes as l on l.user_id = u.id
group by u.name;

select b.name, bp.name, u.name from likes as l
join user as u on l.user_id = u.id
join blogpost as bp on l.blog_post_id = bp.id
join blog as b on bp.blog_id = b.id;

select u.name, b.name from user as u
join likes as l on l.user_id = u.id
join blogpost as bp on l.blog_post_id = bp.id
join blog as b on bp.blog_id = b.id;