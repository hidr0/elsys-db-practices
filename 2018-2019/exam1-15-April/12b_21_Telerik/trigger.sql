DROP TRIGGER IF EXISTS insert_battle;
DROP TRIGGER IF EXISTS update_battle;
DROP TRIGGER IF EXISTS delete_battle;

DELIMITER $$

CREATE TRIGGER insert_battle AFTER INSERT ON battle FOR EACH ROW
BEGIN
	UPDATE house h
    LEFT JOIN person p ON p.id = NEW.winner_id
    SET h.number_of_wins = h.number_of_wins + 1
    WHERE h.id = p.house_id;
END$$

CREATE TRIGGER update_battle AFTER UPDATE ON battle FOR EACH ROW
BEGIN
UPDATE house h
    LEFT JOIN person p ON p.id = OLD.winner_id
    SET h.number_of_wins = h.number_of_wins - 1
    WHERE h.id = p.house_id;

	UPDATE house h
    LEFT JOIN person p ON p.id = NEW.winner_id
    SET h.number_of_wins = h.number_of_wins + 1
    WHERE h.id = p.house_id;
END$$

CREATE TRIGGER delete_battle AFTER DELETE ON battle FOR EACH ROW
BEGIN
	UPDATE house h
    LEFT JOIN person p ON p.id = OLD.winner_id
    SET h.number_of_wins = h.number_of_wins - 1
    WHERE h.id = p.house_id;
END$$

DELIMITER ;
