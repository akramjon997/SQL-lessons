1. Select ProductName as Name from Products.
2. Select * from Customers as Client.
3. Select * from Products Union Select * from Products_Discounted.
4. Select * from Products Intersect Select * from Products_Discounted.
5. Select Distinct FirstName+' '+LastName as Name, Country from Customers
6.Select * ,
case
when Price>1000 then 'High'
else 'Low'
end as PriceCategory 
from Products.
7.Select StockQuantity, IIf(StockQuantity >100, 'Yes', 'NO') as InStock from Products_Discounted
8. Select * from Products Union Select * from Products_Discounted.
9. Select * from Products Except Select * from Products_Discounted.
10.Select *, IIF(Price>1000, 'Expensive', 'Affordable') as PriceCategory from Products.
11.Select * from Employees where age<25 or Salary>60000
12.Update Employees
Set Salary=Salary*1.1 where DepartmentName='HR' or EmployeeID=5
13.Select *, case 
when SaleAmount>500 then 'Top Tier'
when SaleAmount between 200 and 500 then 'Mid Tier'
else 'Low Tier'
end as SaleCategory
from Sales .
14.Select CustomerID from Customers
 except
 Select CustomerID from Sales.
15. Select CustomerID, Quantity, case
 when Quantity=1 then '3%'
 when Quantity between 1 and 3 then '5%'
 else '7%'
 end as DiscountPercentage from Orders.
