select
	o.id order_id,
	o.order_date,
	o.shipped_date,
	o.shipping_fee,
	o.payment_type,
	o.paid_date,
	o.order_status, 
	o.customer_id,
	c.company_name,
	o.employee_id,
	e.email, 
	e.title_of_courtesy,
	e.first_name,
	e.last_name,
	o.address_id,
	a.name,
	a.address_line_1,
	a.address_line_2,
	a.postal_town,
	a.post_code
from
  orders o
join
  customers c on o.customer_id = c.id
join
  employees e on o.employee_id = e.id
join
  addresses a on o.address_id = a.id
  limit 20;
