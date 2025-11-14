# Write your MySQL query statement below
with first_logins as (
    select 
        player_id,
        min(event_date) as first_login
    from
        activity
    group by
        player_id
),
consec_logins as (
    select 
        count(a.player_id) as num_logins
    from
        first_logins a
    join
        activity b
    on
        a.player_id = b.player_id 
    and
        date_sub(event_date, interval 1 day) = first_login
) 
select 
    round(
        (select num_logins from consec_logins)
        / (select count(player_id) from first_logins)
    , 2) as fraction
;
