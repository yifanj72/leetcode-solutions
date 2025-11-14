# Write your MySQL query statement below
-- display the records with three or more rows with consecutive id's 
-- the number of people is greater then or equal to 100 for each
with cte as (
    select id,
    visit_date,
    people,
    id - row_number() over(order by id) as consec
    from stadium
    where people >= 100
)

select id, visit_date, people
from cte
where consec in (
    select consec
    from cte
    group by consec
    having count(id) >= 3
)