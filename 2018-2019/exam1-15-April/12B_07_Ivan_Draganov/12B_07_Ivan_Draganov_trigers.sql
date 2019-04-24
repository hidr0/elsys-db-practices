DELIMITER $
CREATE TRIGGER wins_insert AFTER INSERT ON Battle 
FOR EACH ROW
BEGIN
	UPDATE House
	SET house_number_of_wins = house_number_of_wins +1
    WHERE houseid = (SELECT personHouseId FROM Person WHERE personid = NEW.battleWinnerid);
END;$

CREATE TRIGGER wins_delete AFTER DELETE ON Battle
FOR EACH ROW
BEGIN
	UPDATE House
    SET house_number_of_wins = house_number_of_wins -1
    WHERE houseid = (SELECT personHouseId FROM Person WHERE personid = OLD.battleWinnerid);
END;$

CREATE TRIGGER wins_update AFTER UPDATE ON Battle
FOR EACH ROW
BEGIN
	UPDATE House
	SET house_number_of_wins = house_number_of_wins -1
	WHERE houseid = (SELECT personHouseId FROM Person WHERE personid = OLD.battleWinnerid);
    UPDATE House
    SET house_number_of_wins = house_number_of_wins +1
	WHERE houseid = (SELECT personHouseId FROM Person WHERE personid = NEW.battleWinnerid);
END;$
DELIMITER ;
