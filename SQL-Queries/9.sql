/*Identify the top 5 performing cities based on profit*/
SELECT 
    l.city,
    SUM(a.price_per_unit * a.units_sold) AS Total_profit, retailer
FROM
    adidas_sales a
JOIN
    locations l ON a.transaction_id = l.transaction_id
GROUP BY
    l.city, retailer
ORDER BY
    total_profit DESC
LIMIT 5;