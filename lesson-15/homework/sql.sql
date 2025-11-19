1.Select top 1 * from employees
order by salary.
2.Select * from Products
where price>(Select avg(price) as avg_price from products).
3.Select * from employees as e
join departments as d
on e. department_id=d.id
where d.department_name='Sales'.
4.Select c.customer_id, c.name from customers as c
left join orders as o
on o.customer_id=c.customer_id
where o.order_id is null.
5.SELECT  
  product_name,
  category_id,
  price
FROM
  (
    SELECT
      *,
      MAX(price) OVER (PARTITION BY category_id) AS Max_Category_Price
    FROM
      Products
  ) AS T
WHERE
  T.price = T.Max_Category_Price.
6.  SELECT e.*, d.department_name
FROM employees e
join departments as d
on e.department_id=d.id
WHERE e.department_id = (
    SELECT TOP 1 department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);
7.Select e.* 
from employees as e
where e.salary>(Select avg(e2.salary) 
                from employees as e2
				where e.department_id=e2.department_id).
8.with cte as
(Select max(grade) as max_grade from grades
group by course_id)

Select s.student_id, s.name, g.course_id, g.grade
from students as s
join grades as  g 
on s.student_id=g.student_id
join cte on g.grade=cte.max_grade.
9.With cte as 
(Select *, rank() over (partition by category_id order by Price) as rnk
from products)
Select * from cte where rnk=3.
10.Select e.* from employees  as e
where e.salary>(Select avg(salary) as comp_avg from employees )
and e.salary<(Select max(e2.salary) from employees as e2
               where e2.department_id=e.department_id).

