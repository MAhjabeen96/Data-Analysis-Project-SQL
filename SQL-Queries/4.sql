/*4.Calculate the total sales and percentage contribution of each product category to the overall sales?
*/
SELECT product, 
       SUM(total_sales) as total_Sales,
	   (SUM(total_sales) / (SELECT SUM(total_sales) FROM adidas_sales)) * 100 as sales_percentage
FROM adidas_sales
GROUP BY product
order by sales_percentage desc
