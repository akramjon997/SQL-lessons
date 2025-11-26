
--1
Select Distinct CustomerName 
from #Sales
where exists (Select CustomerName from #Sales where Year(SaleDate)=2024 and Month(Saledate)=3 and Quantity>=1)

--2
Select top 1 Product, TotalRevenue as MaxRevenue from
(Select Product, 
		Sum(Quantity*Price) as TotalRevenue 
from #Sales
Group by Product) as t
order by TotalRevenue desc

--3

Select s.SaleID,
	   s.CustomerName,
	   s.Product, 
	   s.SaleDate, 
	   s.Quantity, 
	   s.Price, 
	   t.TotalRevenue from
 (Select SaleID, 
        Sum(Quantity*Price) as TotalRevenue, 
		rank() over (Order By Sum(Quantity*Price) desc) as Rnk
from #Sales
group by SaleID) as t
join #Sales as s 
	on s.SaleID=t.SaleId
where rnk=2	

--4

Select  Year(SaleDate) as [Year],
        Month(SaleDate) as [Month],
		(Select Sum(Quantity)from #Sales as S2
		where Year(s1.SaleDate)=Year(s2.SaleDate)
		and Month(s1.SaleDate)=Month(S2.SaleDate)) As TotalQUantity
from #sales as s1
group by Year(SaleDate),
		Month(SaleDate)
----5

Select distinct CustomerName
from #Sales as a
where exists( Select distinct CustomerName 
			  from #Sales as B
			  where a.Product=b.Product
			  and a.CustomerName<>B.CustomerName)

---6
with cte as
(Select Name, Fruit, count(*) as Num
from Fruits
group by Name, Fruit)
Select Name,[Apple], [Banana], [Orange]
from cte
pivot  
(sum(num) for Fruit in([Apple], [Banana], [Orange])) as pivoted

--7
Select distinct F.ParentID,  L.ChildId from Family as F
cross join Family as L
where F.ParentID<l.ChildID

--8

Select * from #orders as O
join #orders as  r
	on o.CustomerID=r.CustomerID
	and o.DeliveryState='CA'
where r.DeliveryState='Tx'



--9
with cte as(Select Resid, Fullname, 
     Substring([address],charindex('city=',[address])+5,
	 charindex('Country=',[address])-(charindex('city=',[address])+5)
	 ) as city,
	 Substring([address],charindex('Country=',[address])+8, 
case
	 when charindex('name=',[address])>0 then charindex('name=',[address])-(charindex('Country=',[address])+8)
	 else  charindex('age=',[address])-(charindex('Country=',[address])+8)
	 end) as Country,
	 Substring([address], 
case
	 when charindex('name=',[address])>0 then charindex('name=',[address])+5
	 else Null
	 end,
case
	 when charindex('name=',[address])>0 then charindex('age=',[address])-(charindex('Name=',[address])+5)
	 else  Null
	 end)
	 as Name,
	 Substring([address],charindex('age=',[address])+4, len(charindex('age=',[address])+4)) as age
from #residents)
select * from cte where name is Null

--9
Update #residents
set address= address+'name='+fullname
where address not like '%Name=%'




--10




WITH RouteCTE AS
(
    -- Anchor: start from Tashkent
    SELECT 
        DepartureCity,
        ArrivalCity,
        CAST(DepartureCity + '->' + ArrivalCity AS VARCHAR(MAX)) AS RoutePath,
        Cost AS TotalCost
    FROM #Routes
    WHERE DepartureCity = 'Tashkent'
    
    UNION ALL
    
    -- Recursive part: continue chaining routes
    SELECT 
        r.DepartureCity,
        r.ArrivalCity,
        CAST(c.RoutePath + '->' + r.ArrivalCity AS VARCHAR(MAX)) AS RoutePath,
        c.TotalCost + r.Cost AS TotalCost
    FROM #Routes r
    INNER JOIN RouteCTE c
        ON r.DepartureCity = c.ArrivalCity
        -- prevent cycles
      AND CHARINDEX(r.ArrivalCity, c.RoutePath) = 0
)
Select * from
(SELECT top 1 * 
FROM RouteCTE
WHERE ArrivalCity = 'Khorezm'
ORDER BY TotalCost ASC) as Cheap
Union all
Select * from 
(SELECT top 1 * 
FROM RouteCTE
WHERE ArrivalCity = 'Khorezm'
ORDER BY TotalCost desc) as Expensive





--11

With cte as 
(Select *, Sum(case when Vals='Product' Then 1 else 0 end) 
			over (order by Id rows unbounded preceding) as ProductRank
from #RankingPuzzle)
Select * from cte
order by id

--12
with cte as
(Select *, avg(SalesAmount) over (partition by Department) as averageSale
from #EmployeeSales)
Select * from cte 
where SalesAmount>averageSale

--13
Select e.* from #EmployeeSales as e
where not exists (Select 1 from #EmployeeSales as X
where X.SalesMonth = E.SalesMonth
      AND X.SalesYear  = E.SalesYear
      AND X.SalesAmount = E.SalesAmount)


--14
-- Get all distinct months that exist in the table
WITH AllMonths AS (
    SELECT DISTINCT SalesMonth
    FROM #EmployeeSales
)

SELECT e.EmployeeID, e.EmployeeName
FROM #EmployeeSales e
GROUP BY e.EmployeeID, e.EmployeeName
HAVING NOT EXISTS (
    SELECT 1
    FROM AllMonths m
    WHERE NOT EXISTS (
        SELECT 1
        FROM #EmployeeSales es
        WHERE es.EmployeeID = e.EmployeeID
          AND es.SalesMonth = m.SalesMonth
    )
);



---15

Select Name from Products
where Price>(Select avg(Price) from Products)

--16
with cte as 
(Select *, Rank() over (order by Stock desc) as Rnk
from Products)
Select * from cte where Rnk>1

--17
with cte as
 (Select Category from Products 
 where Name='Laptop')
 Select * from Products as p
 join cte on p.Category=cte.Category

 --18
 Select * from Products
 where price>(
Select  min(Price) as LowPrice from Products
group by Category
having Category='Electronics')

--19 
with cte as
(Select *, avg(Price) over (partition by category) as Average_Price
from Products)
Select * from cte 
where Price> Average_Price

--20

Select o.OrderId,p.ProductID,p.Name,p.Category from Orders o
join Products as p
on p.ProductId=o.ProductId

--21
with cte as
(Select p.Name, o.Quantity,avg(o.Quantity) Over () as Average
from Orders o
full join Products as p
on p.ProductId=o.ProductId)
Select * from cte
where Quantity>Average

--22

Select o.OrderId,p.ProductID,p.Name,p.Category from Orders o
Right join Products as p
on p.ProductId=o.ProductId
where o.ProductId is Null

--23
Select top 1 *,Sum(o.Quantity) over (Partition by p.Name) as TotalQuantity from Orders o
join Products as p
on p.ProductId=o.ProductId
order by TotalQuantity desc





