use database sql

delimiter &

create trigger ILikes after insert on Likes for each row
begin
	update Users u
    set u.number_of_likes = u.number_of_likes + 1
    where u.id = new.user_id;
end&

create trigger ULikes after update on Likes for each row
begin
	update Users u
    set u.number_of_likes = u.number_of_likes + 1
    where u.id = new.user_id;
    
    update Users u
    set u.number_of_likes = u.number_of_likes - 1
    where u.id = old.user_id;
end&

create trigger DLikes after update on Likes for each row
begin
	update Users u
    set u.number_of_likes = u.number_of_likes -1
    where u.id = new.user_id;
end&

delimiter ;
