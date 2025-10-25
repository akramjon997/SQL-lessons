1.Select e.Name as EmployeeName, e.Salary, d.DepartmentName
from Employees as e
join Departments as d
on e.DepartmentId=d.DepartmentId
where e.Salary>50000.
2.Select c.FirstName, c.LastName, o.OrderDate
from Customers as c
join Orders as o
on c.CustomerId=o.CustomerId
where Year(OrderDate)=2023.
3.Select e.Name as EmployeeName, d.DepartmentName 
from Employees as e
Left Join Departments as d
on e.DepartmentId=d.DepartmentID.
4.Select s.SupplierName, p.ProductName
from Suppliers as s
left join Products as p
on s.SupplierID=p.SupplierID
5.Select o.OrderId, o.OrderDate, p.PaymentDate, p.Amount
from Orders as O
full join Payments as P
on o.OrderId=p.OrderId
6.Select e.Name as EmployeeName, m.Name as ManagerName
from Employees as e
left join Employees as m
on e.EmployeeID=m.ManagerID
7.
Select s.Name as StudentName, CourseName
from Students as s
join Enrollments as e
on s.StudentId=e.StudentId
join Courses as c
on e.CourseID=c.CourseID
where c.CourseName= 'Math 101'.
8.Select c.FirstName,c.LastName, o.Quantity
from Customers as c
inner join Orders as o
on c.CustomerId=o.CustomerId
where o.Quantity>3.
9.Select e.Name as EmployeeName, d.DepartmentName
from Employees as e
join Departments as d
on e.departmentID=d.DepartmentID
where DepartmentName='Human Resources'
10.Select d.DepartmentName, count(e.EmployeeId) as EmployeeCount
from Departments as d
join Employees as e
on d. DepartmentID=e.DepartmentID
group by d.DepartmentName
having count(e.EmployeeId)>5
11.
Select p.ProductID, p.ProductName, s.SaleID
from Products as p
left join Sales as s
on p.ProductID=s.ProductID
where s.SaleID is Null.
12.Select c.FirstName,c.LastName, sum(o.Quantity) as TotalOrders
from Customers as c
inner join Orders as o
on c.CustomerID=o.CustomerID
group by c.FirstName,c.LastName
13.Select e.Name as EmployeeName, d.DepartmentName
from Employees as e
inner join Departments as d
on e.departmentID=d.DepartmentID.
14.Select e1.Name as Employee1, e2.Name as Employee2, E1.ManagerId
from Employees as E1
Join Employees as E2
on e1.ManagerId=E2.ManagerId
and E1.Name<>e2.Name
where e1.ManagerID is not Null.
15.Select o.OrderID, o.OrderDate, C.FirstName,c.LastName
from Customers as c
right join Orders as o
on c.CustomerID=o.CustomerID
where Year(o.OrderDate)=2022
16.Select e.Name as EmployeeName, e.Salary, d.DepartmentName
from Employees as e
inner join Departments as d
on e.departmentID=d.DepartmentID
where d.DepartmentName='Sales' and  e.Salary>60000 
17.Select o.OrderId, o.OrderDate, p.PaymentDate, p.Amount
from Orders as O
inner join Payments as P
on o.OrderId=p.OrderId.
18.Select p.ProductId, P.ProductName
from Products as p
left join Orders as o
on  p.ProductId=o.ProductId
where o.OrderId is Null.
19.Select e.Name as EmployeeName, e.Salary
from Employees as e
where e.Salary>
(Select avg(e2.Salary) from Employees as E2
where e.DepartmentId=E2.DepartmentId).
20.Select o.OrderId, o.OrderDate
from Orders as O
left join Payments as P
on o.OrderId=p.OrderId
where Year(o.OrderDate)<2020 and p.PaymentId is Null
21.Select p.ProductId, p.ProductName
from Products as p
left Join Categories as c
on p.Category=c.CategoryId
where c.CategoryID is Null.
22.Select e1.Name as Employee1, e2.Name as Employee2, E1.ManagerId, e1.Salary
from Employees as E1
Join Employees as E2
on e1.ManagerId=E2.ManagerId
and E1.Name<>e2.Name
where e1.ManagerID is not Null and e1.Salary>60000 and E2.Salary>60000.
23.Select e.Name as EmployeeName, d.DepartmentName
from Employees as e
inner join Departments as d
on e.departmentID=d.DepartmentID
where d.DepartmentName like 'M%'.
24.Select s.SaleID, p.ProductName, s.SaleAmount
from Products as p
join Sales as s
on p.ProductID=s.ProductID
where s.SaleAmount>500.
25.Select s.StudentID, s.Name as StudentName
from Students as s
join Enrollments as e
on s.StudentId=e.StudentId
join Courses as c
on e.CourseID=c.CourseID
where c.CourseName <> 'Math 101'.
26.Select o.OrderId, o.OrderDate, p.PaymentID
from Orders as O
left join Payments as P
on o.OrderId=p.OrderId
where p.PaymentId is Null.  
27.Select p.ProductId, p.ProductName, c.CategoryName
from Products as p
left Join Categories as c
on p.Category=c.CategoryId
where c.CategoryName in ('Electronics', 'Furniture').
  


