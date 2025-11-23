1.with regions as ( Select distinct region from #RegionSales),
Distributor as (Select distinct Distributor from #RegionSales)

Select r.region,
       d.distributor,
	   coalesce(s.Sales,0) as Sales
from regions as r
cross join distributor as d
left join #RegionSales as s
on s.Region=r.region
and s.Distributor=d.Distributor
order by d.distributor, r.region.
2.Select p.id,p.name as m_name, count(p.name) as DirectReports
from Employee as e
left join employee as p
on e.managerId=p.id
group by p.id,p.name
having count(p.name)>=5.
3with cte as
(Select product_id, datepart(month,order_date) as [Month], sum(unit) as total
from orders 
group by product_id,  datepart(month,order_date)
having sum(unit)>=100)
Select c.product_id,p.product_name,c.Total
from cte as c
join products as p
on c.product_id=p.product_id
where [Month] =2.
4.With cte as
(Select Vendor, CustomerId,count(CustomerId) as Total
from orders 
group by vendor,CustomerId),
Ranked as (Select Vendor, CustomerId, Total,
row_number() over (Partition by CustomerId order by total desc) as rn
from cte)
Select CustomerId, Vendor, Total
from ranked 
where rn=1.
5.DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2;
DECLARE @IsPrime BIT = 1;

IF @Check_Prime <= 1
    SET @IsPrime = 0;
ELSE
BEGIN
    WHILE @i <= SQRT(@Check_Prime)
    BEGIN
        IF (@Check_Prime % @i = 0)
        BEGIN
            SET @IsPrime = 0;
            BREAK;
        END
        SET @i = @i + 1;
    END
END

IF @IsPrime = 1
    PRINT 'This number is prime';
ELSE
    PRINT 'This number is not prime'.
6.
With locCount as 
(
Select Device_Id, locations,count(locations) as total from device
group by Device_id, locations),

 Distinct_locations as
 (Select Device_Id, count(locations) as No_loc from locCount
 group by Device_id),

 Pop_loc as (Select Device_id, Locations,rank() over (partition by device_id order by total desc) as rnk
from locCount),
 Number_of_signals as (Select device_id, count(locations) as Total_l
 from device group by Device_id)
 Select d.Device_Id, d.No_loc, p.locations,n.total_l
 from distinct_locations as d
 join Pop_loc as p
 on d.Device_id=p.Device_id
 join Number_of_signals as n
 on n.Device_id=p.Device_id
 where p.rnk=1.
7.with cte as (
 Select EmpID,EmpName,Salary, 
 avg(Salary) over (partition by deptId) as Avg_salary from Employee)

 Select EmpID,EmpName,Salary from cte 
 where Salary>=Avg_salary
 order by EmpID. 
8.with cte as
(Select TicketId, Count(t.Number) as matching from Numbers as n 
inner join Tickets as t
on n.Number=t.Number
group by TicketID),
 Prize as (Select TicketId, case 
 when matching=3 then $100
 when matching>0 then $10
 else $0 
 end as prize from cte)
 Select Sum(Prize) as Total_Prize from Prize.
9.Select Spend_date, [Platform], 
       Sum(Amount) as Total, 
       count(distinct [User_id]) as Total_Users 
from Spending
group by Spend_date, [Platform]
union all
Select Spend_date, 'Both' as [Platform], 
       Sum(Amount) as Total,
       count(distinct [User_id]) as Total_Users 
from Spending 
group by Spend_date
order by Spend_date, [Platform] desc.
10.WITH cte AS (
    SELECT Product, 1 AS Quantity, Quantity AS MaxQty
    FROM Grouped

    UNION ALL

    SELECT Product, 1 AS Quantity, MaxQty - 1
    FROM cte
    WHERE MaxQty > 1
)
SELECT Product, Quantity
FROM cte
ORDER BY Product.
