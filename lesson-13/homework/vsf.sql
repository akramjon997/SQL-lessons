1. Select top 1 concat(Employee_id,'-', First_name,' ', Last_name) from Employees.
2.Update Employees
SET Phone_Number=Replace(Phone_Number, '124', '999').
3.Select First_Name, len(First_Name)  as lengthn from Employees
where First_name like '[ajm]%'
order by First_Name.
4.Select Manager_id, sum(Salary) as Total_Salary from Employees
group by Manager_id.
5.Select Year1, greatest(max1, max2, max3) as Highest_values 
from TestMax.
6.Select * from cinema
where id %2=1 and description='boring'.
7.Select *
 from SingleOrder
 order by case 
when id=0 then 1 
else 0 
end.
8.Select * from Person
Select coalesce(ssn,passportid,itin) as [identity] from Person.
  Medium
1. Select *,
 Left(FullName,Charindex(' ', FullName)-1) as FirstName,
 Substring(FullName,charindex(' ',FullName)+1, len(FullName)- charindex(' ', fullname)-charindex(' ', reverse(FullName))) as MiddleName,
 Right(FullName,Charindex(' ', reverse(FullName))-1) as LastName 
 from students.
2.SELECT *
FROM Orders
WHERE DeliveryState = 'TX'
  AND CustomerID IN (
        SELECT DISTINCT CustomerID
        FROM Orders
        WHERE DeliveryState = 'CA').
3.SELECT 
    STRING_AGG(String, ' ') 
        WITHIN GROUP (ORDER BY SequenceNumber) AS ReconstructedSQL
FROM DMLTable;
4.with cte as
(
Select concat(First_Name, ' ', Last_Name) as Full_Name from Employees)
Select Full_Name from cte where len(Full_Name)-len(replace(Lower(Full_Name),'a', ''))>=3.
5.Select Department_Id,
	count(*) as Total_Number,
	sum(case 
	   when datediff(Year,Hire_date,Getdate())> 3 then 1
	   else 0
	   end) as EmployeesOver3Years, 
	cast(100.0 * sum(case 
	    when datediff(Year,Hire_date,Getdate())> 3 then 1
	    else 0
	    end)/count(*) as Decimal(5,2)) PercentOver3Years
from Employees
group by DEPARTMENT_ID.

  1.SELECT
    StudentID,
    FullName,
    Grade,
    SUM(Grade) OVER (ORDER BY StudentID ROWS UNBOUNDED PRECEDING) AS CumulativeGrade
FROM Students
ORDER BY StudentID;
2.SELECT s.StudentName, s.Birthday
FROM Student s
JOIN (
    SELECT Birthday
    FROM Student
    GROUP BY Birthday
    HAVING COUNT(*) > 1
) t
ON s.Birthday = t.Birthday
ORDER BY s.Birthday, s.StudentName;
3.Select * from PlayerScores

SELECT
    LEAST(PlayerA, PlayerB) AS Player1,
    GREATEST(PlayerA, PlayerB) AS Player2,
    SUM(Score) AS TotalScore
FROM PlayerScores
GROUP BY
    LEAST(PlayerA, PlayerB),
    GREATEST(PlayerA, PlayerB)
ORDER BY Player1, Player2;
4.DECLARE @str VARCHAR(100) = 'tf56sd#%OqH';

WITH CharCTE AS (
    SELECT SUBSTRING(@str, number, 1) AS ch
    FROM master..spt_values
    WHERE type = 'P' AND number BETWEEN 1 AND LEN(@str)
)
SELECT
    STRING_AGG(CASE WHEN ch LIKE '[A-Z]' THEN ch END, '') AS UppercaseLetters,
    STRING_AGG(CASE WHEN ch LIKE '[a-z]' THEN ch END, '') AS LowercaseLetters,
    STRING_AGG(CASE WHEN ch LIKE '[0-9]' THEN ch END, '') AS Numbers,
    STRING_AGG(CASE WHEN ch NOT LIKE '[A-Za-z0-9]' THEN ch END, '') AS OtherCharacters
FROM CharCTE.
