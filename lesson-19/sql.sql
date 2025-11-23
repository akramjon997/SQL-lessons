1.
Create procedure dbo.usp_CalcEmployeeBonus
as 
Begin
Create Table #EmployeeBonus 
(EmployeeId int, FullName varchar(50), Department varchar(10), 
Salary decimal(10,2), BonusAmount decimal(10,2))
Insert into #EmployeeBonus (EmployeeId, FullName, Department, Salary, BonusAmount)

Select e.EmployeeId,
       concat_ws(' ',e.FirstName,e.LastName) as FullName, 
	   e.Department, 
	   e.Salary,
	   cast(e.Salary*d.BonusPercentage/100 as decimal(10,2)) as BonusAmount
from Employees as e
join DepartmentBonus as d
on e.Department=d.Department

Select * from #EmployeeBonus

end
2.Create procedure dbo.udp_Parameters
@department varchar(50), @BonusPercentage decimal(10,2)
as 
begin 
 
 Update employees
 Set Salary=Salary+(Salary* @BonusPercentage/100 )
 where Department=@department 

 Select EmployeeId, FirstName,LastName,Department, Salary
 from Employees 
 where Department=@department
 end.
3.Merge Products_Current as C
Using Products_New as N
on c.ProductId=n.ProductId
when matched then
     Update Set c.ProductName=n.ProductName, c.Price=n.Price
when not matched by Target then
        insert (ProductId,ProductName, Price)
		values (n.ProductId,n.ProductName, n.Price)
when not matched by Source then Delete;
Select * from Products_Current.
4.Select id, 
       case
	   when p_id is Null then 'Root'
	   when Id not in (Select p_id from tree where p_id is not null) then 'Leaf'
	   else 'Inner'
	  End as NodeType
from tree order by id.
5. Select s.[user_id],
        case 
		     when Count(c.action)=0 then 0.00
			 else cast(Sum(case when c.[action]='confirmed' then 1 else 0 end ) as decimal(10,2))/count(c.action)
		end as Confirmation_rate
from Signups as s
left join Confirmations as c
on s.[user_id]=c.[user_id]
group by s.[user_id]
order by [user_id] desc.
6.Select * from employees
where salary in( Select min(Salary) from employees).
7.Create Proc dbo.usp_GetProductSalesSummary 
@ProductId int
as begin 
Select p.ProductName, 
       Sum(s.Quantity) as TotalQuantity, 
	   Sum(s.Quantity*p.Price) as Total_Sales_Amount,
	   min(s.SaleDate) as First_Sale_Date,
	   max(s.SaleDate) as Last_Sale_Date
from Products as p
left join Sales as s 
on p.ProductId=s.ProductId
where p.ProductID=@ProductId
group by  p.ProductName
end.
