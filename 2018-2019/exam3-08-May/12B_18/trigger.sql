delimiter ..
create trigger on_insert after insert on Likes for each row
	begin
		update User u
        left join Post p
        on p.Id = new.post_id
        set u. number_of_likes_on_own_posts = u. number_of_likes_on_own_posts + 1
        where u.Id = p.user_id;
	end ..
    
create trigger on_delete after delete on Likes for each row
	begin
		update User u
        left join Post p
        on p.Id = old.post_id
        set u. number_of_likes_on_own_posts = u. number_of_likes_on_own_posts - 1
        where u.Id = p.user_id;
	end ..


create trigger on_update after update on Likes for each row

	begin
    
		update User u
        left join Post p
        on p.Id = new.post_id
        set u. number_of_likes_on_own_posts = u. number_of_likes_on_own_posts + 1
        where u.Id = p.user_id;
	
		update User u
        left join Post p
        on p.Id = old.post_id
        set u. number_of_likes_on_own_posts = u. number_of_likes_on_own_posts - 1
        where u.Id = p.user_id;
    end ..
delimiter ;