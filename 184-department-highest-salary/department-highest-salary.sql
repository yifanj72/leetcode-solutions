with cte as (
select b.name as Department, a.name as Employee, a.salary,
DENSE_RANK() over (partition by departmentid order by salary desc) as rnk
from Employee a
join Department b
on a.departmentId = b.id
)
select distinct Department, Employee, Salary from cte
where rnk = 1