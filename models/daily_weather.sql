with daily_weather as
(
select 
CLOUDS,
HUMIDITY,
PRESSURE,
TEMP,
date (TIME) as daily_weather,
WEATHER
FROM {{ source('demo', 'WEATHER') }}


),
cte as(
    select daily_weather,
   weather,
   round( avg(TEMP),2) avg_temp,
    round( avg(PRESSURE),2) avg_presure,
 round( avg(HUMIDITY),2) avg_humidity,
round( avg(clouds),2)  avg_clouds
    from daily_weather
    group by daily_weather,weather

    qualify row_number() over (partition by daily_weather order by count(weather) desc )=1

)

select * from cte order by DAILY_WEATHER 