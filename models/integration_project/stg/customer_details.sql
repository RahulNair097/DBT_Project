{{
    config(
        materialized="view",
        alias="customer_details",
        schema="STG"
    )
}}

with cust_cte as 
(
select c.c_custkey, c.c_name, c.c_address, c.c_phone, n.n_name, r.r_name
from {{ source('my_project','customer')}} c 
inner join {{ source('my_project','nation')}} n on c.c_nationkey = n.n_nationkey
inner join {{ source('my_project', 'region')}} r on n_regionkey = r.r_regionkey
)                
select * from cust_cte