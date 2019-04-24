use a;

delimiter //
create trigger CUpdateWins after insert on Battle for each row
begin
	update House h set h.number_of_wins = h.number_of_win = 1 where h.id = new.winner_id;
end//

create trigger UUpdateWins after update on Battle for each row
begin
	update House h set h.number_of_wins = h.number_of_win + 1 where h.id = new.winner_id;
    update House h set h.number_of_wins = h.number_of_wins - 1 where h.id = old.winner_id;
end//

create trigger DUpdateWins after delete on Battle for each row
begin
    update House h set h.number_of_wins = h.number_of_wins - 1 where h.id = old.winner_id;
end//
delimiter ;
