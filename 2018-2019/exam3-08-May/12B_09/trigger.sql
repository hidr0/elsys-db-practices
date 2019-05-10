delimiter !
create trigger AftCreate after insert 
on Likes
for each row begin
	update User as u join Post as p
    on p.user_id = u.id and new.user_id = u.id and new.post_id = p.id
    set u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts + count(new.id);
end
!
delimiter ;

-- delimiter !
-- create trigger AftDel after insert 
-- on Likes
-- for each row begin
-- 	update User as u join Post as p
--     on p.user_id = u.id and new.user_id = u.id and new.post_id = p.id
--     set u.number_of_likes_on_own_posts = u.number_of_likes_on_own_posts + count(new.id);
-- end
-- !
-- delimiter ;