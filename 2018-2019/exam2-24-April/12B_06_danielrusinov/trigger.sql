delimiter $$
delete trigger if exists aft_ins;
create trigger aft_ins after insert on likes
for each row
	begin
		update blog as b
        join blogpost as bp on new.blog_post_id = bp.id
        set b.number_of_likes = b.number_of_likes + count(bp.name)
        where bp.blog_id = b.id
	end;
    
create trigger aft_upd after insert on likes
for each row
	begin
		if old.blog_post_id < new.blog_post_id
			then
				update blog as b
				join blogpost as bp on new.blog_post_id = bp.id
				set b.number_of_likes = b.number_of_likes + (count(new.blog_post_id) - count(old.blog_post_id)) 
				where bp.blog_id = b.id
		elseif old.blog_post_id > new.blog_post_id
			then
				update blog as b
				join blogpost as bp on new.blog_post_id = bp.id
				set b.number_of_likes = b.number_of_likes - (count(old.blog_post_id) - count(new.blog_post_id)) 
				where bp.blog_id = b.id
        end if
	end;
    
create trigger aft_del after insert on likes
for each row
	begin
		update blog as b
        join blogpost as bp on new.blog_post_id = bp.id
        set b.number_of_likes = b.number_of_likes - count(bp.name)
        where bp.blog_id = b.id
	end;
delimiter ;