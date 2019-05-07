CREATE TRIGGER InsertLike
AFTER INSERT
ON Likes
FOR EACH ROW
	UPDATE Blog 
    SET number_of_like = (
    select * from Likes 
	left join BlogPost bp on Likes.blog_post_id = bp.id
	left join Blog b on bp.blog_id = b.id)
where id = New.id;


CREATE TRIGGER UpdateLike
AFTER Update
ON Likes
FOR EACH ROW
	UPDATE Blog 
    SET number_of_like = (
    select * from Likes 
	left join BlogPost bp on Likes.blog_post_id = bp.id
	left join Blog b on bp.blog_id = b.id)
where id = New.id;

CREATE TRIGGER DeleteLike
AFTER Delete 
ON Likes
FOR EACH ROW
	UPDATE Blog 
    SET number_of_like = 0
where id = Old.id;