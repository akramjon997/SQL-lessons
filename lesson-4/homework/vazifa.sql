1. Select top 5 * from Employees.
2. Select distinct category from Products.
3. Select * from Products where Price>100
4. Select * from Customers where Firtname is like 'A%'.
5. Select * from Products order by Price asc.
6. Select * from Employees where Salary>=60000 and De[partment name = 'HR'
7. Select EmpID, FirstName, LastName, ISNULL (Email. 'noemail@example.com') as Email from Employees.
8. Select * from Products where Price Between 50 and 100.
9. Select distinct Category, ProductName from Products
10.Select distinct Category, ProductName from Products order by ProductName
11.Select top 10 * from products order by Price
12.Select EmpID, coalesce(FirstName,Lastname) as EmpName from Employees.
13.Select distinct Category ad Price from Products table.
14.Select * from Employees where Age Betweeen 30 and 40 or DepartmentName='Marketing'.
15.Select * from Employees order by Salary desc offset 10 rows fetch next 10 rows only.
16.Select * from Products where Price>=1000 and StockQuantity>50 order by StockQuantity asc.
17.Select * from Products where ProductName like '%e%'
18.Select * from Employees where DepartmentName in ('HR', 'IT', 'Finance')
19.Select * from Customers order by City asc, PostalCode desc.
20.Select top 5 * from Products order by SaleAmount desc.
21.Select FullName+''+LastName as FullName from Employees
22.Select distinct Category, ProductName, Price from Products where Price >$50
23.Select * from Products where Price<0.1 * (Select avg(price) from Products).
24.Select * from Employees where Age<30 and Department='HR' or 'IT'.
25.Select * from Customers where Email like '%@gmail.com'.
26.Select * from Employees where  Salary > all (Select Salary from Employees where department='Sales')
27.Select * from Orders where OrderDate Between  Dateadd(Day,-180,(Select max(OrderDate) from Orders)) and (Select max(OrderDate) from Orders)
