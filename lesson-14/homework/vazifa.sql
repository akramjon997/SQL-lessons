1.Select id, left(Name,charindex(',', name)-1) as Name,
right(Name,len(name)-(charindex(',', name))) as Surname
from TestMultipleColumns.
2.Select * from TestPercent
where Strs like '%[%]%'.
3.
Select id, value as Part
from Splitter
cross apply string_split(Vals,'.')
order by id.
4.Select * from testDots
where (len(Vals)-len(replace(Vals,'.','')))>2.
5.Select texts,
len(texts)-len(replace(texts,' ', '')) as Num_Spaces
from CountSpaces.
6.Select * from Employee as e
join employee as m
on e.ManagerId=m.Id
where e.Salary>m.Salary.
7.Select EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
	   HIRE_DATE,
	   Datediff(Year, HIRE_DATE, Getdate()) as Served_Years
from Employees
where Datediff(Year, HIRE_DATE, Getdate())>10 and 
 Datediff(Year, HIRE_DATE, Getdate())<15.
  Medium
1. Select w1.ID from weather as w1
 join weather as w2
 on w1.RecordDate=Dateadd(day,1,w2.RecordDate)
 where w1.Temperature>w2.Temperature.
2.
 Select player_id, min(event_date) as First_login 
 from Activity
 group by player_id.
3. Select substring(fruit_list,Charindex(',',fruit_list, Charindex(',',fruit_list)+1)+1,
  charindex(',',fruit_list,charindex(',', fruit_list, charindex(',',fruit_list)))) as third_fruit from fruits.
4.with cte as 
(
Select *, datediff(year,HIRE_DATE,getdate()) as years_service
from Employees)

Select *, case 
when years_service <1 then 'New Hire'
when years_service Between 1 and 5 then 'Junior'
when years_service Between 5 and 10 then 'Mid-level'
when years_service Between 10 and 20 then 'Senior'
else 'Veteran'
end as Employment_stage
from cte.
5.Select cast(left(Vals,patindex('%[^0-9]%', VALS+'x')-1) as int) from GetIntegers.

1.
Select ID,concat(reverse(left(Vals,charindex(',', Vals, Charindex(',', Vals)+1)-1)),
right(vals, charindex(',', Vals))) as Reversed
from MultipleVals.
2.with  abc as (
Select 1 as n
union all
Select n+1
from abc
where n<Len('sdgfhsdgfhs@121313131'))
Select n as Position, Substring('sdgfhsdgfhs@121313131',n,1) as charachter 
from abc.
3.Select Player_id, Device_Id , min(event_date) as Event_date from Activity 
group by Player_id, Device_Id.
5.DECLARE @str VARCHAR(100) = 'rtcfvty34redt';

WITH N AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM N
    WHERE n < LEN(@str)
),
Split AS (
    SELECT 
        SUBSTRING(@str, n, 1) AS ch
    FROM N
)
SELECT
    STRING_AGG(CASE WHEN ch LIKE '[0-9]' THEN ch END, '') AS NumbersOnly,
    STRING_AGG(CASE WHEN ch LIKE '[A-Za-z]' THEN ch END, '') AS LettersOnly
FROM Split
OPTION (MAXRECURSION 0)
