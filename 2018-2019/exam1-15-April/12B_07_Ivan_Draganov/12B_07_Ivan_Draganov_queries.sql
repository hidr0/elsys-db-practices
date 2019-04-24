
SELECT personname AS 'Name of winner'
FROM Person p
RIGHT JOIN Battle b
ON b.battleWinnerid = p.personid;

SELECT House_Name AS 'Name of House'
FROM Person p
RIGHT JOIN Battle b
ON b.battleLoserid = p.personid
LEFT JOIN House h
ON h.houseid = p.personHouseId
GROUP BY housename;

SELECT personname AS 'Name of winner',personname AS 'Name of loser'
FROM Person p
RIGHT JOIN Battle b
ON b.battleWinnerid = p.personid AND b.battleLoserid = p.personid;

