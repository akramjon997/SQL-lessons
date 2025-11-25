1.
Select Id, Dt, 
		Right('00'+Cast(Month(DT) as Varchar (2)),2) as MonthPrefixedWithZero  
from Dates
2.
with cte as
(Select Id, 
		rID,
		max(Vals) as MAxVals 
from MyTabel
group by Id, Rid)

Select count(Id) as Distinct_Ids,
		rId,
		Sum(MAxVals) as TotalofMAxVals
from cte
group by rId
3.Select * from TestFixLengths
where len(Vals) between 6 and 10.
4.Select Id,Item,Vals from
(Select *, Row_Number() over (partition by Id order by vals desc) as rn from TestMaximum)
as t
where rn=1
order by id.
5.
Select Id,Sum(MaxValue) as SumofMax from
(Select Id,DetailedNumber,  max(Vals) as MaxValue from SumOfMax
group by Id,DetailedNumber) as t
group by Id
6.Select Id,a,b, case 
			when a-b=0 then ''
			else cast(a-b as varchar(20))
			end as output 
from TheZeroPuzzle.
7.Select Sum(QuantitySold*UnitPrice) as TotalRevenue from Sales
