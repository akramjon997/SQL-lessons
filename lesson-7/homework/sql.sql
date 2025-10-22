1. Select Min(Price) as MinPrice from Products.
2. Select Max(Salary) as MaxPrice from Employees.
3. Select count(*) as Total_Number from Customers.
4. Select count(Distinct Category) from Products.
5. Select  sum(SaleAmount) as TotalSales from Sales where ProductId=7
6. Select avg(age) as Average_Age from Employees.
7. Select DepartmentName, Count(EmployeeID) as Number_of_Employees from Employees group by DepartmentName.
8. Select Min(Price) As MinPrice, Max(Price) as MaxPrice, Category from Products group by Category.
9. Select CustomerID, sum(SaleAmount) as Total_sales from Sales group by CustomerID.
10.
 Select DepartmentName, count(EmployeeID) as Num_Emp from Employees 
 group by DepartmentName 
 having count(EmployeeID)>5
11. Select p.Category,  sum(s.SaleAmount) as TotalSales, avg(s.SaleAmount) as AverageSales 
 from Sales as s 
 left join Products as p on s.ProductID=p.ProductID 
 group by p.Category.
12.Select DepartmentName, count(EmployeeID) as Num_Emp from Employees group by DepartmentName 
 having DepartmentName ='HR'.
13.Select DepartmentName, min(Salary) as Lowest_Salary, max(Salary) as Highest_Salary from Employees
 group by DepartmentName.
14. Select DepartmentName, avg(Salary) as Average_Salary from Employees
 group by DepartmentName.
15. Select DepartmentName, Count(*) as Num_Emp, avg(Salary) as Average_Salary from Employees
 group by DepartmentName.
16. Select Category, avg(Price) as average_price  from Products 
 group by Category
 having avg(Price)>400
17. Select Year(SaleDate) as Year, Sum(SaleAmount) as Total_sales from Sales 
 group by Year(SaleDate).
18. Select o.CustomerId, CONCAT(c.FirstName,' ',c.LastName) as FullName, sum(o.Quantity) as Total_quantity
 from orders as o
 left join Customers as c 
 on o.CustomerID=c.CustomerID
 group by o.CustomerID,  CONCAT(c.FirstName,' ',c.LastName)
 having sum(o.Quantity)>3
 order by o.CustomerID.
19.
 Select DepartmentName, avg(Salary) as Average_Salary from Employees 
 group by DepartmentName
 having avg(Salary)>60000.
20. Select Category, avg(Price) as Average_Price from Products
 group by Category
 having avg(Price)>150.
21. Select CustomerId, sum(SaleAmount) as Total_sales from Sales
 group by CustomerID
 having  sum(SaleAmount)>1500
22.Select DepartmentName, sum(Salary) as Total_Salary, avg(Salary) as Average_salary
 from Employees 
 group by DepartmentName
 having  avg(Salary) >65000.
23.Select CustomerID, Sum(TotalAmount) as TotalAmount, Min(TotalAmount) as LeastPurchase from Orders
 group by CustomerID 
 having Sum(TotalAmount)>50
24.Select  Year(OrderDate) as OrderYear, Month(OrderDate) as OrderMonth, Sum(TotalAmount) as total_Sales, count(Distinct ProductID) as UniqueProductsSold
 from Orders 
 group by Year(OrderDate), Month(OrderDate)
 having count(distinct ProductID) >=2
 order by OrderYear, OrderMonth.
25.
 Select Year(OrderDate) as Orderyear, min(quantity) MinQuantity, max(quantity) MaxQuantity from orders
 group by Year(OrderDate). 
