/*What are the top three products on highest demand in terms of quantity?
*/
SELECT product, SUM(units_sold) AS Total_units_sold FROM adidas_sales
 GROUP BY product 
 ORDER BY total_units_sold 
 DESC LIMIT 3; 





