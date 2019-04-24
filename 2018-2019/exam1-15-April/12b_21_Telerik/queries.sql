SELECT p.name
FROM battle b
LEFT JOIN person p ON p.id = b.winner_id;

SELECT h.name
FROM battle b
LEFT JOIN person p ON p.id = b.loser_id
LEFT JOIN house h ON h.id = p.house_id;

SELECT p.name, p1.name
FROM battle b
LEFT JOIN person p ON p.id = b.winner_id
LEFT JOIN person p1 ON p1.id = b.loser_id;
