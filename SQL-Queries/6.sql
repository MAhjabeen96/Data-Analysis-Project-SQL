/*6.Are there any interesting patterns as to when customers buy more products in terms of seasonality?
*/
SELECT 
CASE WHEN EXTRACT(MONTH FROM invoice_date) IN (12, 1, 2) THEN 'Winter' 
WHEN EXTRACT(MONTH FROM invoice_date) IN (3, 4, 5) THEN 'Spring' 
WHEN EXTRACT(MONTH FROM invoice_date) IN (6, 7, 8) THEN 'Summer' 
WHEN EXTRACT(MONTH FROM invoice_date) IN (9, 10, 11) THEN 'Autumn' 
END AS Season, 
SUM(price_per_unit * units_sold) AS Total_Sales 
FROM adidas_sales 
GROUP BY season 
ORDER BY total_sales desc; 

