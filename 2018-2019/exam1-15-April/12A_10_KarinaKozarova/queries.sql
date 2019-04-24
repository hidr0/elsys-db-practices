select v.name as 'Video name', v.views  as 'Video views',u.username as 'User name',c.name  as 'Channel name' 
from video v
left join channel c on c.id=v.channel_id
left join user u on u.id = c.user_id ;

select v.channel_id,c.user_id from channel c
left join video v on c.id=v.channel_id
group by v.channel_id, c.user_id
having channel_id is not null;

select u.name, u.username, v.views from user u
left join video v on v.channel_id = u.id
left join channel c on u.id = c.user_id
group by u.name, u.username, v.views
having v.channel_id is not null;

-- getting the total number of views, needed for the trigger; not needed for task
select count(views) from user u
left join channel c on u.id = c.user_id
left join video v on v.channel_id = u.id
group by user_id;
