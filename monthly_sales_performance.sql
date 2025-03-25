/*
Monthly Sales Performance
	Objective: 
		Analyze sales performance within the four-month period to identify trends and patterns.

	Tasks:
		Calculate total sales for each month.
		Compare sales performance across different product categories each month.
        Identify the top 5 product in terms of sales in each month
*/

WITH sales_data AS (
    -- Ensure only valid dates are considered
    SELECT  
        categories.CategoryName AS product_category,  
        TRY_CAST(sales.SalesDate AS DATE) AS sales_date,
        -- Compute total transaction price
        COALESCE(TRY_CAST(sales.Quantity AS INT), 0) * COALESCE(products.Price, 0) * 
        (1 - COALESCE(TRY_CAST(sales.Discount AS DECIMAL(10,2)), 0)) AS total_price  
    FROM sales
    LEFT JOIN products ON sales.ProductID = products.ProductID
    LEFT JOIN categories ON products.CategoryID = categories.CategoryID
    WHERE TRY_CAST(sales.SalesDate AS DATE) IS NOT NULL  
    -- Exclude incorrect or placeholder dates
    AND TRY_CAST(sales.SalesDate AS DATE) > '2000-01-01'
),  
monthly_sales AS (
    SELECT  
        FORMAT(sales_date, 'yyyy-MM') AS month_sales, 
        product_category,  
        ROUND(SUM(total_price), 2) AS sum_total_sales
    FROM sales_data  
    GROUP BY FORMAT(sales_date, 'yyyy-MM'), product_category
),  
ranked_sales AS (
    SELECT  
        month_sales,  
        product_category,  
        sum_total_sales,  
        RANK() OVER (PARTITION BY month_sales ORDER BY sum_total_sales DESC) AS sales_rank
    FROM monthly_sales
)  
-- Keep only the top 5 categories per month
SELECT month_sales, product_category, sum_total_sales
FROM ranked_sales  
WHERE sales_rank <= 5
ORDER BY month_sales DESC, sales_rank;
