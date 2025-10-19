# Write your MySQL query statement below
-- with cte as (
--     select count(distinct id) as report_count, managerId
--     from employee
--     group by managerid
-- )
-- select name
-- from employee
-- where id in (select distinct managerid from cte where report_count >= 5);

-- 2) HAVING
select name from
employee
where id in (
select managerId
from employee
group by managerid
having count(distinct id) >= 5
);