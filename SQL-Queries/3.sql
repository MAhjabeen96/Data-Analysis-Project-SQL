/*3.Find the Retailer with the highest total sales in each region?*/
WITH max_region_sales AS (
    SELECT l.region, MAX(s.total_sales) as max_total_sales
    FROM adidas_sales s
    JOIN locations l ON s.transaction_id = l.transaction_id
    GROUP BY l.region
)
SELECT l.region,s.retailer, SUM(s.total_sales) as total_sales
FROM adidas_sales s
JOIN locations l ON s.transaction_id = l.transaction_id
JOIN max_region_sales mrs ON l.region = mrs.region
WHERE s.total_sales = mrs.max_total_sales
GROUP BY l.region, s.retailer
ORDER BY total_sales desc;




