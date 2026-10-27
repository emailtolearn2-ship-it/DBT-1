{% macro getseasion(x) %}

 CASE
    WHEN month(to_timestamp({{x}})) in (12,1,2)
    THEN 'WINTER'
    WHEN month(to_timestamp({{x}})) in (3,4,5)
    THEN 'SPRING'
    WHEN month(to_timestamp({{x}})) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTOM'
    END

{% endmacro  %}

{% macro day_typ(x) %}
CASE 
    WHEN dayname(to_timestamp({{x}})) in ('Sat','Sun')
    THEN
    'WEEKEND'
    ELSE
    'BUSSINESSDAY'
    END

{% endmacro %}