/*
Top Products Identification
	Objective: 
		Determine which products are the best and worst performers within the dataset timeframe.

	Tasks:
		Rank products based on total sales revenue.
		Analyze sales quantity and revenue to identify high-demand products.
		Examine the impact of product classifications on sales performance.
*/

WITH sales_data AS (
	-- Extract relevant data: Category ID, product name, and total price calculation  
    SELECT  
        products.CategoryID,  
        products.ProductName,  
        SUM(COALESCE(TRY_CAST(sales.Quantity AS INT), 0) * COALESCE(products.Price, 0) * 
            (1 - COALESCE(TRY_CAST(sales.Discount AS DECIMAL(10,2)), 0))) AS total_price  
    FROM sales
    LEFT JOIN products ON sales.ProductID = products.ProductID
    GROUP BY products.CategoryID, products.ProductName
)  
-- Retrieve category names for better readability  
-- Rank products based on total revenue in descending order  
SELECT  TOP 5
    RANK() OVER (ORDER BY sales_data.total_price DESC) AS revenue_rank,
    categories.CategoryName AS product_category,
    sales_data.ProductName AS product_name,  
    ROUND(sales_data.total_price, 2) AS total_revenue

FROM sales_data
LEFT JOIN categories ON categories.CategoryID = sales_data.CategoryID
ORDER BY sales_data.total_price DESC