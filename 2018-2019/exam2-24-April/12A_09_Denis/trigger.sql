use a;

delimiter //

create trigger ILikes after insert on Likes for each row
begin
	update Blog b 
    left join BlogPost bp on bp.blog_id = b.id
    set b.number_of_likes = b.number_of_likes + 1
    where bp.id = new.blog_post_id;
end//

create trigger ULikes after update on Likes for each row
begin
	update Blog b 
    left join BlogPost bp on bp.blog_id = b.id
    set b.number_of_likes = b.number_of_likes + 1
    where bp.id = new.blog_post_id;
	
    update Blog b 
    left join BlogPost bp on bp.blog_id = b.id
    set b.number_of_likes = b.number_of_likes - 1
    where bp.id = old.blog_post_id;
end//

create trigger DLikes after delete on Likes for each row
begin
	update Blog b 
    left join BlogPost bp on bp.blog_id = b.id
    set b.number_of_likes = b.number_of_likes - 1
    where bp.id = old.blog_post_id;
end//

delimiter ;
