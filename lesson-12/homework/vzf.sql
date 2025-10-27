1.Select p.FirstName, p.LastName, a.city, a.state
from Person as p
left join Address as a
on p.personId=a.personId
2.
Select e1.Name as Employee from Employee as e1
left join Employee as e2
on e1.managerId=e2.Id
where e1.Salary>e2.salary.
3.Select email from Person
group by email
having count(*)>1.
4.Delete from Person 
where Id not in
(Select min(Id) from Person group by email)
5.Select distinct g.ParentName
from girls as g
left join Boys as b
on g.ParentName=b.ParentName
where b.name is null.
6.Select o.custid, o.OrderId, sum((d.unitprice-d.discount)*d.qty) as Total , min(o.freight) as Leastweight 
from Sales.Orders as o
join Sales.OrderDetails as d
on d.orderid=o.orderid
where o.freight>50
group by o.custid, o.orderid
order by custid, orderid.
7.Select Isnull(C1.Item, ' ') as [Item Cart 1],
Isnull(C2.Item, ' ')  as [Item Cart2 ]
from Cart1 as C1
full join Cart2 as C2
on C1.Item=C2.Item
order by case
when c1.Item is not null and c2.Item is not null then 1---both carts
when c1.Item is not null then 2     ---only 1st cart
else 3   ---only 2nd cart
end,
case when c2.Item is not null then 
CHARINDEX(c1.Item,' Sugar,Bread, Juice, Soda, Flour') --will save Cart1
else 
Charindex (c2.item, 'Sugar,Bread,Butter,Cheese,Fruit')
end.
8.Select distinct c.name as CustomerName
from Customers as c
left join Orders as o
on c.id=o.customerId
where o.customerId is null.
9.Select s.student_id, s.student_name, j.subject_name, Count(e.subject_name) as attended_exams
from Students as s
cross join Subjects as j
left join Examinations as e
on s.student_id=e.student_id and
e.subject_name=j.subject_name
group by s.student_id, s.student_name, j.subject_name
