delimiter $
create trigger aftIns after insert on likes
for each row
	begin
		update user as u
        join post as p on p.user_id = u.id and p.id = new.post_id
        set u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts + 1;
    end$

create trigger aftUpd after update on likes
for each row
	begin
		if old.post_id != new.post_id
			then
				update user as u
				join post as p on p.user_id = u.id and p.id = old.post_id
				set u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts - 1;
                
                update user as u
				join post as p on p.user_id = u.id and p.id = new.post_id
				set u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts + 1;
		end if;
    end$

create trigger aftDel after delete on likes
for each row
	begin
		update user as u
        join post as p on p.user_id = u.id and p.id = old.post_id
        set u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts - 1;
    end$
delimiter ;