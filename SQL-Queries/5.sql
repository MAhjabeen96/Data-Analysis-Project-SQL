/*5.Top 10 retailers have the most sales per state?
To answer this question, I'll need to perform the following steps:
1.Calculate the total sales for each retailer and state combination 
2.Rank the retailers within each state based on their total sales 
3.Select the retailer with the highest total sales in each state 
*/
WITH retailer_state_sales AS 
( SELECT l.state,
 ad.retailer, SUM(ad.price_per_unit * ad.units_sold) AS total_sales 
 FROM adidas_sales ad
 INNER JOIN locations l
 ON ad.transaction_id = l.transaction_id 
 GROUP BY l.state, ad.retailer )
 ,
 ranked_retailers AS 
 ( SELECT state, retailer, total_sales, 
 ROW_NUMBER() OVER (PARTITION BY state ORDER BY total_sales DESC) AS rk 
 FROM retailer_state_sales )
 SELECT state, retailer, total_sales 
 FROM ranked_retailers WHERE rk = 1
 limit 10


