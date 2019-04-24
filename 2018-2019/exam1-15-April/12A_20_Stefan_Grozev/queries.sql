USE School;

SELECT name AS Name_of_Winner FROM Person p
RIGHT JOIN Battle b
ON b.winner_id = p.id;

SELECT h.name AS Name_of_House FROM House h
LEFT JOIN Person p
ON p.house_id = h.id
RIGHT JOIN Battle b
ON b.loser_id = p.id;