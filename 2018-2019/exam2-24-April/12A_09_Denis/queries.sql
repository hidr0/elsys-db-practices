use a;

select b.name as 'Blog name', bp.name as 'BlogPost name' from BlogPost bp 
left join Blog b on b.id = bp.blog_id;

select u.name as 'User name', count(*) as 'number of likes'
from User u right join Likes l on u.id = l.user_id
group by u.id;

select b.name as 'Blog name', bp.name as 'BlogPost name', u.name 'User name'
from Likes l left join User u on u.id = l.user_id
left join BlogPost bp on bp.id = l.blog_post_id
left join Blog b on b.id = bp.blog_id;

select distinct u.name as 'User name', b.name as 'Blog name'
from Likes l left join User u on u.id = l.user_id
left join BlogPost bp on bp.id = l.blog_post_id
left join Blog b on b.id = bp.blog_id;

