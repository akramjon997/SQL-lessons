
1. Select  p.ProductName, s.SupplierName  from Suppliers as s
cross join Products as p.
2.Select e.Name as EmployeeName, d.DepartmentName from Employees as e
cross join Departments as d.
3.Select ProductName, SupplierName from Products as p
join Suppliers as s
on s.SupplierID=p.SupplierID.
4.Select concat(c.FirstName, ' ', c.LastName) as Fullname, o.OrderID from Customers as c
join Orders as o
on c.CustomerID=o.CustomerID.
5.Select s.Name as StudentName, c.CourseName  from courses as c
cross join Students as s.
6.
Select p.ProductName, o.* from Products as p
inner join Orders as o
on p.ProductID=o.ProductID.
7.Select e.Name as EmployeeName, d.DepartmentName from Employees as e
join Departments as d 
on e.DepartmentID=d.DepartmentID
8.  Select s.Name as StudentName, e.CourseID from Students as s
join Enrollments as e
on s.StudentID=e.StudentID.
9. Select o.OrderID, p.PaymentID, p.Amount, p.PaymentDate from Orders as o
 inner join Payments as p
 on o.OrderId=p.OrderId.
10.Select o.OrderID, p.ProductName, p.Price, o.Quantity,o.TotalAmount from Orders as o
 join Products as p
 on o.ProductID=p.ProductID
 where p.Price>100.
11.Select e.name as EmployeeName, d.DepartmentName from Employees as e
  cross join Departments as d 
  where e.DepartmentId<>d.DepartmentID.
12.  Select o.OrderId, p.ProductName, p.Price, o.TotalAmount from Orders as o
  inner join Products as p 
  on o.ProductID=p.ProductID
  where o.Quantity>p.StockQuantity.
13.  Select CONCAT(c.FirstName, ' ', c.Lastname) as FullName, s.ProductId 
   from Customers as c
   join Sales as s
   on  c.CustomerID=s.CustomerID
   where SaleAmount>=500
14.   Select s.Name as StudentName, c.CourseName from Courses as c
   join Enrollments as e
   on c.CourseID=e.CourseID
   join Students as s
   on e.StudentID=s.StudentID.
15.Select p.ProductName, s.SupplierName 
from Products as p
join Suppliers as s
on p.SupplierID=s.SupplierID
where s.SupplierName like '%Tech%'.
16.Select o.OrderID, o.Quantity, p. Amount from Orders as o
join Payments as p
on o.OrderID=p.OrderID
where p.Amount<o.TotalAmount.
17.Select e.Name as EmployeeName, d.DepartmentName 
from Employees as e
join Departments as d
on e.DepartmentID=d.DepartmentID.
18.Select p.ProductName, c.CategoryName
from Products as p
join Categories as c
on p.Category=c.CategoryID
where CategoryName in ('Electronics', 'Furniture').
19.
Select s.SaleID, s.SaleAmount, CONCAT(FirstName,' ', LastName) as Customer
from Sales as s
join Customers as c
on s.CustomerID=c.CustomerID
where c.Country='USA'.
20.Select o.OrderID, CONCAT(c.FirstName,' ', LastName) as CustomerName, o.Quantity,o.TotalAmount
from Orders as o
join Customers as c
on o.CustomerID=c.CustomerID
where c.Country='Germany' and o.TotalAmount>100.
21.SELECT 
    E1.Name AS Employee1,
    E2.Name AS Employee2,
    E1.DepartmentID AS Dept1,
    E2.DepartmentID AS Dept2
FROM Employees E1
JOIN Employees E2
    ON E1.EmployeeID <E2.EmployeeID   -- avoid duplicate and self-pairs
   AND E1.DepartmentID <> E2.DepartmentID;
22.Select p.* 
from Payments as p
join Orders as o
on p.OrderID=o.OrderID
join Products  as r
on o.ProductID=r.ProductID
where p.Amount<>o.Quantity * r.Price.
23.
 Select s.Name as StudentName,c.CourseID, c.CourseName 
 from Courses as c
 join Enrollments as e
 on c.CourseID= e.CourseID
 right join Students as s
 on e.StudentID=s.StudentID
 where c.CourseID is NUll.
24. Select  m.EmployeeID as ManagerID,
 m.Name as ManagerName,
 m.Salary as ManagerSalary,
 e.EmployeeId as  EmployeeId,
 e.Name as EmployeeName, 
 e.Salary as EmployeeSalary
 from Employees as e
 join Employees  as m
 on e.EmployeeID=m.ManagerID
 where e.Salary>=m.Salary.
25. Select CONCAT(c.FirstName,' ',c.LastName) as CustomerName, o.OrderID, P.PaymentID
 from Orders as o
 left join Payments as p
 on o.OrderID=p.OrderID
 join Customers as c
 on o.CustomerID=c.CustomerID
 where p.PaymentID is Null.

