-- Q1
-- Show all product names along with their brand name. Sort by brand name, then by product name alphabetically.

select 
p. product_name,
b. brand_name
from [production].[products] p
Join [production].[brands] b
ON p. [product_id] = b.[brand_id]
 Order By 
 p. [product_name] ,
b. [brand_name];


-- Q2
-- List all products with their category name and list price. Sort by category name, then by price from cheapest to most expensive.

select p.[product_name], 
	c. [category_name],[list_price]
from [production].[products] p
Join [production].[categories] c
On p. category_id = c.category_id
Order by [list_price] ASC;


-- Q3
-- Show all orders with the customer's full name and order date. Sort by order date from newest to oldest.
select 
c. [first_name] +''+ [last_name] as "Full Name",
o.[order_date]
       
from [sales].[orders] o

Join [sales].[customers] c
On o.[customer_id] = c. [customer_id]
Order By [order_date] DESC;


-- Q4
-- Display each order item with the product name, quantity, unit price, 
--and a computed column called "Line Total" (quantity × list_price). Sort by order ID.
select 
oi.[order_id],p.[product_name],oi.[quantity],
oi.[list_price] AS "Unit Price",
oi.[quantity] * oi.[list_price] AS " Line Total"

from [sales].[order_items] oi
Join [production].[products] p
on 
oi.[product_id] = p.[product_id]
Order by [order_id];

		

-- Q5
-- Show each order along with the store name where it was placed and the order date. Sort by store name.
Select oi.[order_id], s.[store_name], s.[city], oi.[order_date]
from [sales].[orders] oi
Join [sales].[stores] s
on oi.[store_id] = s.[store_id]
Order by s.[store_name] Asc; 


-- Q6
-- Show each order with: order ID, customer full name, store name, and the staff member's full name who handled it.


select oi.[order_id], 
c.[first_name] +' '+ c.[last_name] AS "customer_name",
s.[store_name], 
st.[first_name] +' '+ st.[last_name] AS "Staff_Name"
from [sales].[orders] oi
join [sales].[customers] c
 on oi.[customer_id] = c.[customer_id]
 join [sales].[stores] s
 on oi.[store_id] = s.[store_id]
 join [sales].[staffs] st
 on oi.[staff_id] = st.[staff_id];




-- Q7
-- List all products from the brand "Trek" along with their category name and price. Sort by price descending. (Use JOIN — do NOT filter by brand_id directly.)

-- Q8
-- Find all customers from the state of "NY" who have placed at least one order. Show customer full name, city, and order date. (Use JOIN — do not use a subquery.)


-- Q9
-- Show all completed orders (order_status = 4) from the store "Rowlett Bikes". Display order ID, customer full name, and order date.


-- Q10
-- List ALL customers and any orders they have placed. Include customers who have never placed an order (show NULL for order columns). Sort by customer ID.


-- Q11
-- Find all customers who have NEVER placed an order. Show their full name and email.

-- Q12
-- List all products and their stock quantity at every store. Include products that have NO stock record at all. Show product name, store ID, and quantity.


-- Q13
-- Find all products that have NEVER been ordered (no record in order_items). Show product name and list price.


-- Q14
-- List each staff member along with the full name of their manager. Staff with no manager (top-level) should still appear — show NULL for manager name.


-- Q15
-- Create a view called vw_bike_catalog that shows product_name, brand_name, category_name, model_year, and list_price. Then query it to show only products priced over $2,000, sorted by price descending.


-- Q16
-- BONUS: Create a view called vw_customer_orders showing: customer full name, order_id, order_date, store_name, and order_status. Then query it to show only orders where the customer city is "New York", sorted by order_date.