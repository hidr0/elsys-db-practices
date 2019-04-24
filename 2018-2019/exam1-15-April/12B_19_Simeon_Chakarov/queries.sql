
SELECT Person_Name AS 'Name of winner'
FROM Person p
RIGHT JOIN Battle b
ON b.Battle_Winner_Id = p.Person_Id;

SELECT House_Name AS 'Name of House'
FROM Person p
RIGHT JOIN Battle b
ON b.Battle_Loser_Id = p.Person_Id
LEFT JOIN House h
ON h.House_Id = p.Person_HouseId
GROUP BY House_Name;
