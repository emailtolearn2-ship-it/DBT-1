with CTE as (
select t.*,
w.*
from {{ ref('Trip_dimention') }} t
left outer join {{ ref('daily_weather') }} w
on t.TRIP_DATE = w.daily_weather

)

select * from CTE