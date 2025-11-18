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
5.
