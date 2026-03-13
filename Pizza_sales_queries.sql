						
									-- Total Revenue
select sum(total_price) as Total_Revenue
from pizza_sales;

								--Average Order Value
select sum(total_price)/count (distinct order_id) as Avg_Order_value
from pizza_sales;

								-- Total Piazzas Sold
select sum(quantity) as total_pizzas_sold
from pizza_sales;

								-- Total Orders placed
select count(distinct order_id) as tot_order_placed
from pizza_sales;

								-- Average Pizzas per Order
select cast(cast(sum(quantity) as decimal (10,2))/cast(count(distinct order_id) as decimal (10,2)) as decimal (10,2)) as Avg_Pizzas_per_Order
from pizza_sales;

								-- Daily trend for total orders
select datename(DW,order_date) as order_day, count(distinct order_id) as total_orders
from pizza_sales
group by datename(DW,order_date);

								-- Monthly trend for total orders
select datename(month, order_date) as month_name, count(distinct order_id) as total_orders
from pizza_sales
group by datename(month, order_date)
order by count(distinct order_id) desc;

								-- Percentage of sales by pizza category
select pizza_category,sum(total_price) as total_sales, sum(total_price) * 100/(select sum(total_price) from pizza_sales) as percent_total_sales
from pizza_sales
group by pizza_category;

								-- Percentage of sales by pizza category
select pizza_size,round(sum(total_price),2) as total_sales, round(sum(total_price) * 100/(select sum(total_price) from pizza_sales),2) as percent_total_sales
from pizza_sales
group by pizza_size
order by percent_total_sales desc;

								-- Top 5 best sellers by Revenue, Total Quantity & Total Orders
-- top 5 by revenue
select top 5 pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue desc;

-- top 5 by quantity
select top 5 pizza_name, sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity desc;

-- top 5 by Total Orders
select top 5 pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders desc;

-- bottom 5 by revenue
select top 5 pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue asc;

-- bottom 5 by quantity
select top 5 pizza_name, sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity asc;

-- bottom 5 by Total Orders
select top 5 pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders asc;