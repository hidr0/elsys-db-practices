   
SELECT p_name FROM Person p
INNER JOIN Battle b ON  b.winner_id = p.id;

SELECT h.h_name FROM House h
LEFT JOIN Person p ON h.id = p.house_id
INNER JOIN Battle b ON  b.loser_id = p.id;

SELECT p_name FROM Person p
LEFT JOIN Battle b ON  b.winner_id = p.id OR b.loser_id = p.id
GROUP BY b.winner_id;