WITH CTE as (
    select 
    to_timestamp(STARTED_AT) as STARTED_AT,
    date(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
    hour(to_timestamp(STARTED_AT)) as HOUR_STARTED_AT,
    CASE 
    WHEN dayname(to_timestamp(STARTED_AT)) in ('Sat','Sun')
    THEN
    'WEEKEND'
    ELSE
    'BUSSINESSDAY'
    END as  DAY_TYP,

    CASE
    WHEN month(to_timestamp(STARTED_AT)) in (12,1,2)
    THEN 'WINTER'
    WHEN month(to_timestamp(STARTED_AT)) in (3,4,5)
    THEN 'SPRING'
    WHEN month(to_timestamp(STARTED_AT)) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTOM'
    END as STATION_OF_YEAR

    from {{ source('demo', 'BIKE') }}
    where STARTED_AT not in ('stoptime','STARTED_AT')

)

select * from CTE
