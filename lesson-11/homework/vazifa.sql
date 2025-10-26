1.Select o.OrderID,
    concat (c.FirstName, '  ', c.LastName) as CustomerName,
    o.OrderDate
from Orders as o
join Customers as c
on o.CustomerId=c.CustomerID
where  Year(o.OrderDate)>2022
2.Select e.Name as EmployeeName, d.DepartmentName
from Employees as e
inner join Departments as d
on e.departmentID=d.DepartmentID
where d.DepartmentName in ('Sales','Marketing')
3.Select d.DepartmentName, max(e.Salary) as MaxSalary
from Employees as e
inner join Departments as d
on e.departmentID=d.DepartmentID
group by d.DepartmentName.
4.Select     concat (c.FirstName, '  ', c.LastName) as CustomerName,
     o.OrderID,
    o.OrderDate
from Orders as o
join Customers as c
on o.CustomerId=c.CustomerID
where  Year(o.OrderDate)=2023.
5.Select     concat (c.FirstName, '  ', c.LastName) as CustomerName,
     count(o.OrderID) as TotalOrders
from Orders as o
join Customers as c
on o.CustomerId=c.CustomerID
group by concat (c.FirstName, '  ', c.LastName)
6.
Select p.ProductName, s.SupplierName
from Suppliers as s
join Products as p
on s.SupplierID=p.SupplierID
where s.SupplierName in ('Gadget Supplies', 'Clothing Mart')
7.Select concat (c.FirstName, '  ', c.LastName) as CustomerName,
     max(o.OrderDate) as MostRecentOrderDate
from Orders as o
right join Customers as c
on o.CustomerId=c.CustomerID
group by  concat (c.FirstName, '  ', c.LastName)
8.Select concat (c.FirstName, '  ', c.LastName) as CustomerName,
     o.TotalAmount as OrderTotal
from Orders as o
join Customers as c
on o.CustomerId=c.CustomerID
where  o.TotalAmount >500.
9.
Select p.ProductName, s.SaleDate, s.SaleAmount
from Products as p
join Sales as s
on p.ProductID=s.ProductID
where Year(s.SaleDate)=2022 and s.SaleAmount>400
10.Select p.ProductName, Sum(s.SaleAmount) as TotalSalesAmount
from Products as p
join Sales as s
on p.ProductID=s.ProductID
group by p.ProductName.
11.Select e.Name as EmployeeName, d.DepartmentName, e.Salary
from Employees as e
join Departments as d
on e.DepartmentId=d.DepartmentId
where d.DepartmentName='Human Resources' and e.Salary>60000.
12.Select p.ProductName, s.SaleDate, p.StockQuantity
from Products as p
join Sales as s
on p.ProductID=s.ProductID
where Year(s.SaleDate)=2023 and p.StockQuantity>100.
13.Select e.Name as EmployeeName, d.DepartmentName, e.HireDate
from Employees as e
join Departments as d
on e.DepartmentId=d.DepartmentId
where d.DepartmentName='Sales' and Year(e.HireDate)>2020.
14.
Select concat(c.FirstName,' ', c.LastName) as CustomerName, o.OrderID, c.Address, o.OrderDate
from Customers as c
join Orders as o
on c.CustomerId=o.CustomerId
where c.Country='USA' and c.Address like '[0-9][0-9][0-9][0-9]%'
15.Select p.ProductName, c.CategoryName, s.SaleAmount
from Products as p
join Sales as s
on p.ProductID=s.ProductID
join Categories as c
on p.Category=c.CategoryID
where c.CategoryName='Electronics' or s.SaleAmount>350.
16.Select c.CategoryName, count(p.ProductId) as ProductCount
from Products as p
right Join Categories as c
on p.Category=c.CategoryIdSelect concat(c.FirstName,' ', c.LastName) as CustomerName, c.City, o.OrderID, o.TotalAmount as Amount
from Customers as c
join Orders as o
on c.CustomerId=o.CustomerId
where c.City='Los Angeles' and o.TotalAmount>300.
18.Select e.Name as EmployeeName, d.DepartmentName
from Employees as e
join Departments as d
on e.DepartmentId=d.DepartmentId
where d.DepartmentName in ('Human Resources', 'Finance') or
(        LEN(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(E.Name), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', '')) 
        <= LEN(E.Name) - 4
    )
19.Select e.Name as EmployeeName, d.DepartmentName, e.Salary
from Employees as e
join Departments as d
on e.DepartmentId=d.DepartmentId
where d.DepartmentName in ('Sales', 'Marketing') and e.Salary>60000.

group by c.CategoryName.
17.



