use database instagram

select u.name, p.name from Posts p 
left join Users u on p.user_id = u.id;

select u.name, u.number_of_likes from Users u;
