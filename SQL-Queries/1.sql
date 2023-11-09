/*Analyze the overall sales, profit, average price per unit, and total units sold.*/
SELECT 
    SUM(total_sales) AS "Total Sales",
    SUM(price_per_unit * units_sold) AS "Total Profit",
    SUM(units_sold) AS "Total Units Sold", 
    Round(AVG(price_per_unit),2) AS "Average Price per Unit"
FROM
    adidas_sales;