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
3.
