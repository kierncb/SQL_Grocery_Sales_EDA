/*
Monthly Sales Performance
Objective: 
		Analyze sales performance within the four-month period to identify trends and patterns.

	Tasks:
		Calculate total sales for each month.
		Compare sales performance across different product categories each month.
*/

WITH sales_data AS (
    SELECT 
        categories.CategoryName AS category_name,
        FORMAT(TRY_CAST(NULLIF(sales.SalesDate, '') AS DATE), 'yyyy-MM') AS sales_date,
        ROUND(SUM(COALESCE(TRY_CAST(sales.Quantity AS INT), 0) * COALESCE(products.Price, 0) * 
        (1 - COALESCE(TRY_CAST(sales.Discount AS DECIMAL(10,2)), 0))), 2) AS net_sales,
        DENSE_RANK() OVER (PARTITION BY FORMAT(TRY_CAST(NULLIF(sales.SalesDate, '') AS DATE), 'yyyy-MM') 
                           ORDER BY ROUND(SUM(COALESCE(TRY_CAST(sales.Quantity AS INT), 0) * COALESCE(products.Price, 0) * 
                           (1 - COALESCE(TRY_CAST(sales.Discount AS DECIMAL(10,2)), 0))), 2) DESC) AS rank
    FROM sales
    LEFT JOIN products ON sales.ProductID = products.ProductID
    LEFT JOIN categories ON products.CategoryID = categories.CategoryID
    WHERE 
        FORMAT(TRY_CAST(NULLIF(sales.SalesDate, '') AS DATE), 'yyyy-MM') IS NOT NULL
    GROUP BY 
        FORMAT(TRY_CAST(NULLIF(sales.SalesDate, '') AS DATE), 'yyyy-MM'),
        categories.CategoryName
)
SELECT 
    sales_date, 
    category_name, 
    net_sales
FROM sales_data
WHERE rank <= 3
ORDER BY sales_date, rank;