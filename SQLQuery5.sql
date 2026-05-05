-- ============================================
-- SQL Server — Class 1 Homework
-- BikeStores Sample Database
-- Topics: Querying · Sorting · Filtering · Set Operators
-- ============================================

-- Q1: List all brand names from the brands table.

select brand_name from [production].[brands];

-- Q2: Show the product name and list price of all products,
-- sorted from most expensive to cheapest.

Select product_name , list_price 
from [production].[products]
order by list_price desc; 

-- Q3: Find all customers who live in the state of New York (NY).

select [first_name] + '' + [last_name] as Full_Name ,[state]
from [sales].[customers]
where [state] ='NY';

-- Q4: Show only the top 5 most expensive products in the store.

select Top 5  [product_name], [list_price]
from [production].[products] 
order by  [list_price]  DESC;

-- Q5: List all products with a price between $200 and $500,
-- sorted by price ascending.

select 
* 
from
[production].[products]
where list_price between 200 and 500
order by list_price asc;


--select *
--from [production].[products]
--Where [list_price] between $200 and $500;
--ORDER BY [list_price] ASC;

-- Q6: Find all customers whose last name starts with the letter 'S'.


select [first_name] + '' + [last_name] as Full_Name
from [sales].[customers]
Where [last_name] LIKE 'S%';

-- Q7: List all products that belong to:
-- category 6 (Mountain Bikes) OR category 7 (Road Bikes).


Select *
from [production].[categories]
where [category_id] = '7' or [category_id] = '6';

-- Q8: Show all orders that have NOT been shipped yet
-- (shipped_date is missing).

Select *
from [sales].[orders]
where [shipped_date] is Null;

-- Q9: Display:
-- product name,
-- brand ID,
-- and a computed column showing 15% off the list price
-- labeled as 'Sale Price'.

select [product_name], [brand_id], [list_price] * 0.85 as Sale_Price
from [production].[products];

-- Q10: Get a unique list of all cities where BikeStores customers live,
-- sorted alphabetically.

select Distinct [city]
from [sales].[customers]
order by city ASC;

-- Q11: List all staff members who are currently active (active = 1),
-- showing their full name and email.

select [first_name] + '' + [last_name] as Full_Name ,[email], [active]
from [sales].[staffs]
where active = 1;

-- Q12: Using UNION:
-- Get a combined list of all cities from both customers and stores
-- (no duplicates), sorted A–Z.

select [city] from [sales].[customers]
union 
select [city] from [sales].[stores]
Order by city ASC

-- Q13: Using EXCEPT:
-- Find product IDs that exist in order_items
-- but are NOT in the products table.

select product_id
from [sales].[order_items]
except
select product_id 
from [production].[products]

--Select [product_id]  from [sales].[order_items] 
--where [product_id] Not in  Select [product_id] from [production].[products];



Select [product_name],[model_year], [list_price]
from [production].[products]
where  (model_year) = 2016
and [list_price] >1500 
Order by [list_price] DESC;



select 
	*
from [production].[products]
where model_year >= 2016 and brand_id = 9
union all
select 
	*
from [production].[products]
where model_year >= 2017 and brand_id = 8
order by model_year, list_price desc;

--select [product_name], [brand_id], [model_year], [list_price]
--from [production].[products]
--where brand_id = 9 and  (model_year)  = 2016;

--Union All

--select [product_name], [brand_id], [model_year], [list_price]
--from [production].[products]
--where brand_id = 8 and  (model_year)  = 2017;
--order by model_year , list_price DESC;