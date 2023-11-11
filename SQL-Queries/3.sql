/*3.Find the Retailer with the highest total sales in each region?*/
SELECT region, retailer, total_region_sales 
 FROM ( SELECT l.region, s.retailer, SUM(s.total_sales) AS total_region_sales, 
 ROW_NUMBER() OVER (PARTITION BY l.region ORDER BY SUM(s.total_sales) DESC) AS sales_rank 
 FROM adidas_sales s 
 JOIN locations l 
 ON s.transaction_id = l.transaction_id 
 GROUP BY l.region, s.retailer
 order by total_region_sales desc 
 ) AS rankedSales 
 WHERE sales_rank = 1;




