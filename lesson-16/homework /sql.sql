1.WITH numbers(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 1000
)
SELECT n
FROM numbers
ORDER BY n
OPTION (MAXRECURSION 0).
2.
Select dt.employeeId, e.FirstName, e.Lastname, 
sum(dt.SalesAmount) as TotalSales 
from
(Select employeeId,SalesAmount from Sales) as dt
join employees as e
on dt.employeeID=e.employeeId
group by dt.employeeId,e.FirstName,E.Lastname.
3.with cte as 
(Select avg(Salary) as Average_Salary from Employees)
Select Average_Salary from cte.
4.
Select p.productid, p.ProductName, dt.MaxSales
from Products as p
join ( Select ProductId, 
       Max(SalesAmount) as MaxSales 
	   from Sales
	   group by ProductID) as dt
on p.productId=dt.productId.
5.With Rec (N) as
(Select 1
union all
Select n*2
from rec
where n<1000000/2)
Select n from rec
order by n.
6.
with cte as
(Select employeeId, Count(SalesAmount) as Per_Employee
from Sales
group by EmployeeID)
Select e.EmployeeID,e.FirstName,e.LastName, cte.Per_Employee from cte 
join Employees as e
on cte.EmployeeId=e.EmployeeId.
7.
With cte as 
(Select ProductId, Sum(SalesAmount) as Total_sales
from Sales 
group by productID)

Select cte.ProductId, p.ProductName, cte.Total_sales from cte
join Products as p
on cte.ProductId=p.ProductID
where cte.Total_Sales>500.
8.With cte as(
Select avg(Salary) as average_Salary from Employees)

Select e.EmployeeID, e.FirstName,e.LastName
from Employees as e
cross join cte
where e.Salary> cte.average_Salary.
medium

1.Select top 5 e.EmployeeID, e.FirstName, e.LastName, dt.per_e from employees as e
join (Select EmployeeId, count(SalesID) as per_e
       from Sales group by EmployeeID) as dt
on e.EmployeeId=dt.EmployeeId
order by dt.per_e.
2.Select p.CategoryID, Sum(dt.Total_Sales) as CategorySales
from 
(Select ProductId, Sum(SalesAmount) as Total_Sales
from Sales
group by ProductID) as dt
join Products as p 
on p.ProductID=dt.ProductID
group by p.CategoryID.
3.WITH FactorialCTE AS (
    -- Anchor: start recursion for each number
    SELECT 
        Number,
        1 AS Step,
        1 AS FactValue
    FROM Numbers1

    UNION ALL

    -- Recursive part: multiply step-by-step
    SELECT
        Number,
        Step + 1,
        FactValue * (Step + 1)
    FROM FactorialCTE
    WHERE Step < Number
)
SELECT Number, MAX(FactValue) AS Factorial
FROM FactorialCTE
GROUP BY Number
ORDER BY Number.
4.with RecCte as (
Select Id, 
       String,
	   1 as Position,
	   Substring(string,1,1) as [Character]
	   from Example
Union All
   Select 
   Id,
   String,
   Position+1,
   SUBSTRING(string,position+1,1)
   from RecCte
   where Position<len(string))
   Select Id, [Character]
   from RecCte
   Order by Id, [Character].
5.   SELECT
        DATEPART(YEAR, SaleDate) AS SaleYear,
        DATEPART(MONTH, SaleDate) AS SaleMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY DATEPART(YEAR, SaleDate), DATEPART(MONTH, SaleDate)
),
SalesWithPrev AS (
    SELECT
        m.SaleYear,
        m.SaleMonth,
        m.TotalSales,
        LAG(m.TotalSales) OVER (ORDER BY m.SaleYear, m.SaleMonth) AS PrevMonthSales
    FROM MonthlySales m
)
SELECT
    SaleYear,
    SaleMonth,
    TotalSales,
    PrevMonthSales,
    TotalSales - PrevMonthSales AS SalesDifference
FROM SSELECT dt.EmployeeID,
       e.FirstName,
       e.LastName,
       dt.SaleYear,
       dt.Quarter,
       dt.TotalSales
FROM (
    -- Derived table: total sales per employee per quarter
    SELECT 
        EmployeeID,
        DATEPART(YEAR, SaleDate) AS SaleYear,
        DATEPART(QUARTER, SaleDate) AS Quarter,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(YEAR, SaleDate), DATEPART(QUARTER, SaleDate)
    HAVING SUM(SalesAmount) > 45000
) AS dt
JOIN Employees e
    ON dt.EmployeeID = e.EmployeeID
ORDER BY dt.SaleYear, dt.Quarter, dt.TotalSales DESC;
Difficult
1.DECLARE @n INT = 15;

WITH FibonacciCTE AS (
    -- Anchor: first two numbers
    SELECT 1 AS Position, 0 AS FibonacciNumber
    UNION ALL
    SELECT 2, 1
    UNION ALL
    -- Recursive: next number = sum of previous two
    SELECT Position + 1,
           (SELECT FibonacciNumber FROM FibonacciCTE WHERE Position = f.Position) +
           (SELECT FibonacciNumber FROM FibonacciCTE WHERE Position = f.Position - 1)
    FROM FibonacciCTE f
    WHERE Position < @n
)
SELECT Position, FibonacciNumber
FROM FibonacciCTE
ORDER BY Position;
2.
Select * from FindSameCharacters
where len(Vals)>1
and Vals = REPLICATE(LEFT(Vals, 1), LEN(Vals))
