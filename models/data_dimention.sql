WITH CTE as (
    select 
    to_timestamp(STARTED_AT) as STARTED_AT,
    date(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
    hour(to_timestamp(STARTED_AT)) as HOUR_STARTED_AT,
    {{day_typ('STARTED_AT')}} as  DAY_TYP,

    {{getseasion('STARTED_AT')}} STATION_OF_YEAR

    from {{ source('demo', 'BIKE') }}
    where STARTED_AT not in ('stoptime','STARTED_AT')

)

select * from CTE
