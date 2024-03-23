--Find the unique flavors ?--
select *from sales_data

select distinct(cupcake_flavor)from sales_data

--Find the revenue per flavor--
select cupcake_flavor,
sum(Quantity *unit_price)
from sales_data
group by cupcake_flavor

--Total Revenue for year 2023--

select sum(quantity*unit_price)as Total_Revenue
from sales_data;


--Which month has the highest sale?__

select 
to_char(order_date,'Month') as Month,
sum(Quantity *unit_price) as Total_Sales 
from Sales_data
group by to_char(order_date,'Month')
order by Total_Sales desc
limit 1

-- which flavor sells most during this month?--


select 
to_char(order_date,'Month') as Month,
cupcake_flavor,
sum(Quantity *unit_price) as Total_Sales 
from Sales_data
group by to_char(order_date,'Month'),cupcake_flavor
order by Total_Sales desc
limit 1



--Which is the most popular flavor?--

select 
cupcake_flavor,
sum(Quantity *unit_price) as Total_Sales 
from Sales_data
group by to_char(order_date,'Month'),cupcake_flavor
order by Total_Sales desc
limit 1


--Which flavor has the most rating?--


select cupcake_flavor, count(rating)
from sales_data
where rating=5
group by cupcake_flavor
order by count desc
limit 1

--Is there any relation between rating 5 and revenue?--
--No--



--Top 3 loyal customers--

select customer_id, count(customer_id)
from sales_data
group by customer_id
having count(customer_id)>1
order by count desc

--From which city are we getting most orders from?--

select city, sum(quantity)
from sales_data
group by city
order by sum(quantity) desc
limit 1

--which month has least sale--

select 
to_char(order_date,'Month') as Month,
sum(Quantity *unit_price) as Total_Sales 
from Sales_data
group by to_char(order_date,'Month')
order by Total_Sales asc
limit 1








