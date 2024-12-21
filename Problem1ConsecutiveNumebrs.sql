# Write your MySQL query statement below
WITH CTE AS(SELECT e1.id as 'ID', e1.num as 'CurrentNum', e2.num as 'NextNum', e3.num as '2ndNextNum'
FROM Logs e1
LEFT JOIN Logs e2
ON e1.id = e2.id-1
LEFT JOIN Logs e3
ON e1.id = e3.id-2
)

SELECT DISTINCT CurrentNum AS 'ConsecutiveNums' FROM CTE
WHERE CTE.CurrentNum = CTE.NextNum AND CTE.NextNum = CTE.2ndNextNum 
