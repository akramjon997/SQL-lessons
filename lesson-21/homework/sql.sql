1.Select *,
		Row_Number() over (order by SaleDate) as Rwn
from ProductSales.
2. Select ProductName,
		Sum(Quantity) as TotalQuantitySold,
		Dense_rank() over (order by Sum(Quantity)desc) as Rnk
from ProductSales
group by ProductName
order by Rnk.

3. 
With cte as
(Select CustomerID, ProductName, SaleDate, SaleAmount, Quantity,
		Row_Number() over (Partition by CustomerID order by SaleAmount desc) as Rnk
from ProductSales)
Select CustomerID, ProductName, SaleDate, SaleAmount, Quantity from cte where Rnk=1.

4.
Select SaleID,ProductName,SaleDate,SaleAmount, lead(SaleAmount) over (order by Saledate) as NextSale from ProductSales.
5.
Select SaleID,ProductName,SaleDate,SaleAmount, lag(SaleAmount) over (order by Saledate) as PreviousSale from ProductSales
6.
With cte as
(Select SaleID,ProductName,SaleDate,SaleAmount, lag(SaleAmount) over (order by Saledate) as PreviousSale 
 from ProductSales)
 Select SaleID,ProductName,SaleDate,SaleAmount from cte where  SaleAmount>PreviousSale


With cte as
(Select SaleID,ProductName,SaleDate,SaleAmount, lag(SaleAmount) over (order by Saledate) as PreviousSale, 
SaleAmount-lag(SaleAmount) over (order by Saledate) as diff from ProductSales)
Select  SaleID,ProductName,SaleDate,SaleAmount from cte where diff>0
7.
Select SaleID,ProductName,SaleDate,SaleAmount, lag(SaleAmount) over (order by Saledate) as PreviousSale, 
SaleAmount-lag(SaleAmount) over (order by Saledate) as diff from ProductSales.

8.with cte as (Select SaleID,ProductName,SaleDate,SaleAmount, lead(SaleAmount) over (order by Saledate) as NextSale, 
lead(SaleAmount) over (order by Saledate)-SaleAmount as diff
from ProductSales)
Select SaleID,ProductName,SaleDate,SaleAmount, cast(diff/SaleAmount*100 as Decimal(10,2)) as PercentageChange from cte
9.
Select SaleID,ProductName,SaleDate,SaleAmount, lag(SaleAmount) over (order by Saledate) as PreviousSale,
        case when lag(SaleAmount) over (order by Saledate) is Null then Null else SaleAmount/lag(SaleAmount) over (order by Saledate) end as Ratio
from ProductSales.
10.
 Select * from ProductSales
 Select ProductName,SaleAmount, FIRST_VALUE(SaleAmount) over (Partition by ProductName order By SaleDate) as FirstValue,
 SaleAmount- FIRST_VALUE(SaleAmount) over (Partition by ProductName order By SaleDate) as Diff
 from ProductSales.

 11.With cte as (Select SaleID,ProductName,SaleDate,SaleAmount, lag(SaleAmount) over (partition by ProductName order by Saledate) as PreviousSale, 
SaleAmount-lag(SaleAmount) over (Partition by ProductName order by Saledate) as diff from ProductSales)
Select SaleID,ProductName,SaleDate,SaleAmount from cte where diff is not Null and diff>0.

12. Select SaleID,ProductName,SaleDate,SaleAmount,Quantity, 
Sum(SaleAmount) over (order by SaleDate rows between unbounded Preceding and Current Row) as Closing_Balance
from ProductSales order by SaleDate.
13. Select SaleID,ProductName,SaleDate,SaleAmount,Quantity, 
Avg(SaleAmount) over (order by SaleDate rows between 2 Preceding and Current Row)as Closing_Balance
from ProductSales order by SaleDate.
14. Select SaleID,ProductName,SaleDate,SaleAmount,Quantity, Avg(SaleAmount) over () as average,
cast(SaleAmount-Avg(SaleAmount) over () as decimal(10,2)) as Difference_avg  from ProductSales order by SaleDate.
15.
With cte as
(Select EmployeeID, Name, Department, Salary, HireDate, rank() over (Order By Salary desc) as rnk
from Employees1) 
Select EmployeeID,Name, Salary from cte where rnk in (Select rnk as num from cte group by rnk having count(rnk)>1)
16.
with cte as
(Select EmployeeID, Name, Department, Salary, HireDate, rank() over (Partition by Department Order By Salary desc) as rnk from Employees1)
Select * from cte where rnk<=2.

17.with cte as
(Select EmployeeID, Name, Department, Salary, HireDate, Row_Number() over (Partition by Department order by Salary asc) as rn from Employees1)
Select * from cte where rn=1
18.

Select EmployeeID, Name, Department, Salary, HireDate, 
Sum(Salary) over (Partition by Department order by HireDate rows between unbounded preceding and current row) as Running_total
from Employees1

19.
Select EmployeeID, Name, Department, Salary, HireDate, Sum(Salary) over (Partition by Department) as Total_Salary
from Employees1
20.
Select EmployeeID, Name, Department, Salary, HireDate, cast(Avg(Salary) over (Partition by Department) as decimal(10,2)) as Average_Salary
from Employees1

21.
with cte as (Select EmployeeID, Name, Department, Salary, HireDate, cast(Avg(Salary) over (Partition by Department) as decimal(10,2)) as Average_Salary
from Employees1)
 Select EmployeeID, Name, Department, Salary, HireDate,Average_Salary, Salary-Average_Salary as [Difference] from cte.

 22.
 Select EmployeeID, Name, Department, Salary, HireDate, 
 cast(Avg(Salary) over (Partition by Department order by HireDate rows between 1 preceding and 1 following)as decimal(10,2)) as Moving_Average
 from Employees1.

 23. Select EmployeeID, Name, Department, Salary, HireDate, 
 Sum(Salary) over (Partition by Department order by HireDate desc rows between 2 preceding and current row) as last3
 from Employees1.

