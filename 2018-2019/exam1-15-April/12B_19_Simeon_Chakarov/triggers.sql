DELIMITER $
CREATE TRIGGER battle_insert AFTER INSERT ON Battle 
FOR EACH ROW
BEGIN
	UPDATE House
	SET House_Number_Of_Wins = House_Number_Of_Wins +1
    WHERE House_Id = NEW.Battle_Winner_Id;
END;$

CREATE TRIGGER battle_delete AFTER DELETE ON Battle
FOR EACH ROW
BEGIN
	UPDATE House
    SET House_Number_Of_Wins = House_Number_Of_Wins -1
    WHERE House_Id = OLD.Battle_Winner_Id;
END;$

CREATE TRIGGER battle_update AFTER UPDATE ON Battle
FOR EACH ROW
BEGIN
	UPDATE House
	SET House_Number_Of_Wins = House_Number_Of_Wins -1
    WHERE House_Id = OLD.Battle_Winner_Id;
    
    UPDATE House
    SET House_Number_Of_Wins = House_Number_Of_Wins +1
    WHERE House_Id = NEW.Battle_Winner_Id;
    
END;$
DELIMITER ;


