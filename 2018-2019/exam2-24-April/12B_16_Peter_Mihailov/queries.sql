
Select bl.name, bp.name from BlogPost bp
Left join Blog bl on bl.id = bp.blog_id
group by bl.name;

Select u.name, b.number_of_likes  from User u
Left join Likes l on l.user_id = u.id
Left join BlogPost bp on l.blog_post_id = bp.id
Left join Blog b on bp.blog_id = b.id
group by u.name;

Select b.name, bp.name, u.name  from User u
Left join Likes l on l.user_id = u.id
Left join BlogPost bp on l.blog_post_id = bp.id
Left join Blog b on bp.blog_id = b.id
group by l.id;

Select b.name, count(u.id) from User u
Left join Likes l on l.user_id = u.id
Left join BlogPost bp on l.blog_post_id = bp.id
Left join Blog b on bp.blog_id = b.id
group by b.name; 