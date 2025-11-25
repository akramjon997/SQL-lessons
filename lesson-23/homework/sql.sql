1.
Select Id, Dt, 
		Right('00'+Cast(Month(DT) as Varchar (2)),2) as MonthPrefixedWithZero  
from Dates
2.
with cte as
(Select Id, 
		rID,
		max(Vals) as MAxVals 
from MyTabel
group by Id, Rid)

Select count(Id) as Distinct_Ids,
		rId,
		Sum(MAxVals) as TotalofMAxVals
from cte
group by rId
3.Select * from TestFixLengths
where len(Vals) between 6 and 10.
4.Select Id,Item,Vals from
(Select *, Row_Number() over (partition by Id order by vals desc) as rn from TestMaximum)
as t
where rn=1
order by id.
5.
Select Id,Sum(MaxValue) as SumofMax from
(Select Id,DetailedNumber,  max(Vals) as MaxValue from SumOfMax
group by Id,DetailedNumber) as t
group by Id
6.Select Id,a,b, case 
			when a-b=0 then ''
			else cast(a-b as varchar(20))
			end as output 
from TheZeroPuzzle.
7.Select Sum(QuantitySold*UnitPrice) as TotalRevenue from Sales
8.Select avg(unitPrice) AverageUnitPrice
	from Sales
9.Select count(SaleId) as Num_Transactions 
	from Sales
10.Select max(QuantitySold) as MaxQuantitySold
from Sales
11.Select Category, 
		Sum(QuantitySold) as TotalUnitsSold 
from Sales
group by Category
12.Select region, 
			Sum(QuantitySold*UnitPrice) as TotalRevenue
from Sales
group by region
13.Select top 1 Product,
			Sum(QuantitySold*UnitPrice) as Revenue
from Sales 
group by Product
order by Revenue desc
14.Select SaleID,SaleDate,
		QuantitySold*UnitPrice as Total,
		Sum(QuantitySold*UnitPrice) over (order by SaleDate rows between unbounded preceding and current row) as RunningTotal
from Sales
15.Select Category,
       Sum(QuantitySold*UnitPrice) as Total,
	   Round(100* Sum(QuantitySold*UnitPrice)/(Select Sum(QuantitySold*UnitPrice) from Sales),2)
	   as Percentage
from Sales
group by Category.
17.Select s.*,c.CustomerName
from Sales as s
join Customers as c
on s.CustomerID=c.CustomerID
18.
Select c.CustomerID,
		c.CustomerName
from Sales as s
right join Customers as c
on s.CustomerID=c.CustomerID
where s.CustomerID is Null
19.
Select c.CustomerID,
		c.CustomerName,
		Sum(QuantitySold*UnitPrice) as Revenue
from Sales as s
right join Customers as c
  on s.CustomerID=c.CustomerID
group by c.CustomerID,
		c.CustomerName
20.
Select top 1 c.CustomerID,
		c.CustomerName,
		Sum(QuantitySold*UnitPrice) as Revenue
from Sales as s
right join Customers as c
  on s.CustomerID=c.CustomerID
group by c.CustomerID,
		c.CustomerName
order by Revenue desc

--21
Select c.CustomerID,
		c.CustomerName,
		Sum(QuantitySold) as TotalSales
from Sales as s
right join Customers as c
  on s.CustomerID=c.CustomerID
group by c.CustomerID,
		c.CustomerName
--22
	Select * from Products as p
left join Sales as s
on s.Product=p.ProductName
where s.QuantitySold>0

--23 
Select  top 1 ProductID, ProductName, Category,SellingPrice from Products
order by SellingPrice desc
--24
with cte as 
(Select ProductID, ProductName, Category,SellingPrice, avg(sellingPrice) over (partition by Category) as Average_price
from Products)
Select ProductID, ProductName
from cte
where SellingPrice>Average_price

