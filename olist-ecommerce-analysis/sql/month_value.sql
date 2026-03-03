select DATE_TRUNC('month', purchase_timestamp) as month, round(sum(p.payment_value)::NUMERIC, 2) as month_value
from payments p
join orders o on p.order_id = o.order_id
group by DATE_TRUNC('month', purchase_timestamp)
order by month;