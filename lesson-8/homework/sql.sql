1.Select Category, sum(StockQuantity) as Total_Avl
from Products
group by Category
2.Select Category, avg(Price) as Avg_Price
from Products 
where Category= 'Electronics'
group by Category.
3.Select * from Customers
where city like 'L%'.
4.Select * from Products 
where ProductName like '%er'.
5.Select * from Customers
where city like '%A'.
6.Select top 1 * from Products
order by Price desc.
  Select top 1 *, GREATEST(Price) as Max_Price from Products.
  Select top 1 ProductID, ProductName,  max(Price) as max_Price from Products
group by ProductID, ProductName 
order by Max(price) desc.
7.Select *, 
case
when StockQuantity <30 then 'Low Stock'
else 'Sufficient'
end as Instock
from Products.
  Select *, iif(StockQuantity<30, 'Low Stock', 'Sufficient') as Instock from Products.
8.Select Country, count(*) as TotalNumberCustomers from Customers
group by country.
9.Select max(Quantity) as MaxQuantity, min(Quantity) as MinQuantity 
from Orders.
  
10.Select * from Orders as o
left join Invoices as i
on o.CustomerID=i.CustomerID
Where Year(OrderDate)=2023 and Month(OrderDate)=1.
11.Select * from Products
union all
Select * from Products_Discounted
12.Select * from Products
union
Select  * from Products_Discounted
Group by ProductName, ProductID.
13.Select Year(OrderDate) as OrderYear, avg(Quantity) as AvgQuantity from Orders
group by  Year(OrderDate).
14.Select ProductName, 
case 
when Price<100 then 'Low'
when Price between 100 and 500 then 'Mid'
else 'High'
end as PriceGroup
from Products.
15.Select district_name [2012], [2013] from city_population
 pivot
 (sum(population)
 for [year] in ([2012], [2013])
 )
 As Population_each_Year
16. Select ProductId, sum(SaleAmount) as Total_Sales from Sales
 group by ProductID.
17. Select ProductName from Products
 where ProductName like '%oo%'
18.
 Select Year,
 [Chilonzor],
 [Yakkasaroy],
 [Mirobod], 
 [Yashnobod],
 [Bektemir] 
 from 
 (Select year, district_name, sum(population) as population from city_population
 group by year, district_name) as src
 pivot
 (sum(population) 
 for district_name  in ([Chilonzor], [Yakkasaroy], [Mirobod], [Yashnobod], [Bektemir])
 )as Population_each_city
 order by year.
19.Select top 3 CustomerID, Sum(TotalAmount) as Total_Spent from Invoices
group by CustomerID
order by Sum(TotalAmount) desc.
20.
21.Select ProductName, count(SaleID) as Number_sold from Products as p
join Sales as s 
on p.ProductID=s.ProductID
group by ProductName.

  
