1. If we are going to find unique values removing duplicates there are two common ways to do that:Fist way, using Select Distinct query, which removes duplicates and brings only distinct values as its name.
  Select Distinct col1,col2 from InputTB1.
  Second way grouping alike queries by using group by. Select col1,col2 from InputTB1 group by col1,col2. In this case if Order does not matter , so a,b treated the same as b, a we can use multiple functions.
  1st using Select Distinct case:
  Select distinct 
case 
when col1>col2 then col1 else col2 end as FirstValue,
case 
when col1<col2 then col1 else col2 end as SecondValue from InputTb1.
  2nd. Using least and Greatest:
  Select distinct least(col1,col2) as FirstValue,
greatest(col1,col2) as SecondValue from InputTb1.
  3rd. By self joining with union:
Select t1.col1,t1.col2 from InputTb1 as t1 
where t1.col1<=t1.col2 
Union 
Select t2.col1, t2.col2 from InputTB1 as t2 where t2.col1<t2.col2
2.Select * from TestMultipleZero where A+B+C+D>0
3.Select * from section1 where id % 2=1
4.   Select top 1 *  from section1 order by Id asc
	   Select min(Id) from section1 
5.Select top 1 * from section1 order by id desc
Select max Id from section1
6.   Select * from section1 where [name] like 'B%'
7.Select * from ProductCodes where Code like '%[_]%'
