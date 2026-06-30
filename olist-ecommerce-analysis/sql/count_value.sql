select DATE_TRUNC('month', purchase_timestamp) as month, count(*) as count_value
from payments p
join orders o on p.order_id = o.order_id
group by DATE_TRUNC('month', purchase_timestamp)
order by month;