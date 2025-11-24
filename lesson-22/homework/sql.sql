
--1
Select Customer_Id, Customer_Name, total_amount, order_date,
sum(total_amount) over (partition by Customer_id order by order_date rows between unbounded preceding and current row) as Running_Total_Sales
from Sales_Data

---2
Select  product_Category, count(Sale_Id) over (partition by product_Category)  as Number_of_Sales from Sales_Data 
---3

Select product_Category, max(Total_amount) over (Partition By product_Category) as max_Total_amount from Sales_Data.

----4
Select product_Category, Min(unit_Price) over (Partition By product_Category) as max_Total_amount from Sales_Data

----5

Select order_date, avg(total_amount) over (order by order_date rows between 1 preceding and 1 following) as moving_average from Sales_data

---6

Select region, sum(total_amount) over (partition by region) as Sales_by_region from Sales_data

---7

Select customer_Id, Customer_name, Sum(total_amount) as TotalPurchase, rank() over (order by Sum(total_amount) desc) as rnk 
from Sales_Data
group by customer_Id, Customer_name

---8

Select Customer_Id, Customer_Name, order_date , total_amount, total_amount-lag(total_amount)  over (partition by customer_Id order by order_date) as diff
from Sales_Data

----9
with cte as 
(Select product_category, product_name, unit_price, rank() over (partition by product_category order by unit_price) as rnk from Sales_data)
Select * from cte where rnk<=3

--10

Select  region, order_date, sum(total_amount) over (partition by region order by order_date rows between unbounded preceding and current row) as cummulative_sum from sales_data

---11

Select product_category, product_name, order_date,total_amount,
Sum(total_amount) over (partition by product_category order by order_date rows between unbounded preceding and current row) as cummulative_sum
from sales_data

---12
create table Sum_previous_values (id int)
insert into Sum_previous_values (id ) values (1),(2),(3),(4),(5)

Select id, sum(id) over (order by id rows between unbounded preceding and current row) as SumPreValues from Sum_previous_values

--13

CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);

Select [Value], sum([Value]) over (order by [Value] rows between 1 preceding and current row) as SumPreValues from OneColumn


--14
with cte as
(Select Customer_id, Customer_name, product_category, count( product_category) over (partition by Customer_id) as Num_ctg
from (Select distinct  Customer_id, Customer_name, product_category from Sales_Data) as t)
Select * from cte where Num_ctg>1

--15
with cte as(
select Customer_id, Customer_name, region, total,avg(total) over (partition by region) as average from
( SELECT 
        Customer_id,
        Customer_name,
        region,
        SUM(Total_amount) AS Total
    FROM Sales_Data
    GROUP BY Customer_id, Customer_name, region) as t)
 
 Select Customer_id, Customer_name, region, total, average from cte where total>average

 --16

 Select Customer_id, Customer_name, region, sum(total_amount) as Total_spent, rank() over (partition by region order by sum(total_amount) desc ) as rnk
from Sales_Data 
group by Customer_id, Customer_name, region

--17
Select Customer_id, Customer_name, order_date, sum(total_amount) over (partition by Customer_id order by order_date rows between unbounded preceding and current row ) as cummulative_Total
from Sales_data

--18
With MonthlySales as
(Select Year(order_date) SalesYear, month(order_date) as SalesMonth, Sum(Total_amount) as TotalSales
from Sales_Data
group by Year(order_date), month(order_date))
Select SalesYear,SalesMonth, TotalSales, lag(TotalSales) over (order by SalesYear,SalesMonth) as PrevMonth,
case 
    when lag(TotalSales) over (order by SalesYear,SalesMonth)is null then Null
	else (TotalSales-lag(TotalSales) over (order by SalesYear,SalesMonth))*100/
	lag(TotalSales) over (order by SalesYear,SalesMonth)
	end as GrowthRate
from MonthlySales

---19
with cte as
(Select Customer_id, Customer_name, order_date, total_amount, 
lag(total_amount) over ( partition by Customer_id order by order_date) as prevOrder
from Sales_Data)

Select *  from cte 
where prevOrder is not null
and total_amount>prevOrder

--20
with cte as 
(Select Product_Name, Product_Category, Unit_Price, avg(Unit_Price) over () as Average_Price from Sales_Data)
Select * from cte where Unit_Price>Average_Price

----21

Select * from Mydata

Select Id,Grp, Val1, Val2, case
when Row_Number() over (partition by grp order by id)=1 then Sum(val1+val2) over (partition by grp) 
else Null
end as Tot 
from Mydata

---22

Select id, Sum(Cost) as Cost, 
			case 
				when count(distinct quantity)=1 then min(Quantity)
				else Sum(Quantity) 
				end as Quantity		 
from TheSumPuzzle
group by id

--23

With cte as 
( Select SeatNumber,
		lag(SeatNumber) over (order by SeatNumber) as PrevSeat
from Seats),
gaps as
(Select PrevSeat+1 as GapStart,
				SeatNumber-1 as GapEnd from cte
				where SeatNumber-PrevSeat>1),
FirstGap as
(Select 1 as GapStart, 
		min(SeatNumber)-1 as GapEnd 
from Seats
)
Select * from FirstGap
union all
Select * from gaps




















