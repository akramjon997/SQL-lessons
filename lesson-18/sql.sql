1.With cte as (
Select ProductId, 
       Year (Saledate) as [Year],
	   Month(SaleDate) as [Month], 
	   sum(Quantity) as Total
from Sales as s
group by ProductID,  Year (Saledate), Month(SaleDate)
)
 
 Select s.ProductId,s.[Year],s.[Month], s.Total,
 s.Total* p.price as revenue 
 into #MonthlySales
 from cte as s
 join Products as p
 on p.ProductID=s.ProductID
 where s.[Year]=Year(Getdate()) 
 and s.[Month]=Month(Getdate())

2. Create view  vw_ProductSalesSummary as
Select p.ProductId, p.ProductName, p.Category,
Coalesce(Sum(s.Quantity), 0)  as TotalQuantitySold
From Products as p
left Join Sales as s
on p.ProductID=s.ProductID
group by p.ProductId, p.ProductName, p.Category
3.create function fn_GetTotalRevenueForProduct(@ProductID INT)
returns decimal(10,2)
as 
begin
    declare @TotalRevenue decimal(10,2)
	Select @TotalRevenue= coalesce(Sum(s.Quantity*p.Price),0) 
	from Sales as s
	join Products as p
	on s.ProductID=p.ProductID
	where p.ProductID=@ProductID
	return @TotalRevenue
end.
4.create function fn_GetSalesByCategory(@Category VARCHAR(50))
returns table 
as return (
Select p.ProductName,
       Sum(s.Quantity) as TotalQuantity,
	   Sum(s.Quantity*p.Price) as TotalRevenue
from products as p
left join Sales as s
on p.ProductId=s.ProductId
where p.Category=@Category
Group by p.ProductName).
5.Create function dbo.fn_IsPrime (@Number INT)
Returns varchar(3)
as 
begin
    Declare @i int=2;

	If @number>=1
	Return 'No';
	While (@i*@i)<=@Number
	Begin
	     If @Number % @i=0
		 return 'No';
		 Set @i=@i+1
	End
	Return 'Yes'
end.
6.create function fn_GetNumbersBetween (@Start int, @end int)
returns @result table (Number Int)
as 
begin
     declare @i int=@start;
	 while @i<=@end
	 begin
	 Insert into @result(Number)
	 values (@i)
	 Set @i=@i+1
	  end
	  return;
end.
7.CREATE FUNCTION dbo.getNthHighestSalary (@N INT)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT;

    SELECT @Result = salary
    FROM (
            SELECT DISTINCT salary,
                   ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
            FROM Employee
         ) AS t
    WHERE rn = @N;

    RETURN @Result;   -- returns NULL automatically if no such row
END;
8.
with cte as
(Select Accepter_Id As ID, Count(Requester_Id) as Total from RequestAccepted 
group by Accepter_Id
union all
Select Requester_Id as Id, Count(Accepter_id) as Total from RequestAccepted 
group by Requester_Id)

Select top 1 Id, Sum(Total) as num from cte
group by ID
order by Sum(Total) desc.
9.Create view vw_CustomerOrderSummary as
Select s.Customer_id, 
        s.[Name], 
       count(o.Order_id) as Total_Orders,
       coalesce(Sum(o.Amount),0) as total_amount,
	   max(o.order_date) as Last_order_date
from Customers as s
left join Orders as o
on s.customer_id=o.customer_id
group by s.Customer_id, 
        s.[Name].
10.Select RowNumber,
    Max(TestCase) over (Order by RowNumber) as WorkFlow
	from gaps.
  
  


