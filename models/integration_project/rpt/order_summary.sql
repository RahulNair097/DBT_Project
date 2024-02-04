

with order_cte as (
    select c.R_NAME as Region_Name, count(*) as Order_counts, sum(o.o_totalprice) as Total_Price
    from {{ source('my_project','orders')}} o 
    inner join {{ ref('customer_details')}} c on o.o_custkey = c.c_custkey
    group by all
)
select * from order_cte