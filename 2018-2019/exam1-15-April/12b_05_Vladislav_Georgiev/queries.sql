SELECT p.name as 'Name of winner' FROM person as p
INNER JOIN battle as b ON p.id = b.winner_id;

SELECT h.name as 'Name of House' FROM house as h
INNER JOIN person as p ON h.id = p.house_id
INNER JOIN battle as b ON b.loser_id = p.id;

SELECT p.name as 'Name of winner', p2.name 'Name of loser' FROM battle as b
INNER JOIN person as p ON p.id = b.winner_id
INNER JOIN person as p2 ON p2.id = b.loser_id