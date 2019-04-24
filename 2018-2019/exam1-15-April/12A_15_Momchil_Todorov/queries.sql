SELECT Persons.name AS 'Name of winner' FROM Persons
INNER JOIN Battles ON winner_id = Persons.id;

SELECT Houses.name AS 'Name of House' FROM Houses
LEFT JOIN Persons ON house_id = Houses.id
INNER JOIN Battles ON loser_id = Persons.id;

SELECT Persons.name AS 'Name of winner', 
(SELECT Persons.name FROM Persons
LEFT JOIN Battles ON loser_id = Persons.id) AS 'Name of loser' FROM Persons
LEFT JOIN Battles ON winner_id = Persons.id;