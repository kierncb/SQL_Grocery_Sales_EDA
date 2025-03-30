/*

Top Products Identification
	Objective: 
		Determine which products are the best and worst performers within the dataset timeframe.

	Tasks:
		Rank products based on total sales revenue.
		Analyze sales quantity and revenue to identify high-demand products.
		Examine the impact of product classifications on sales performance.
*/

SELECT TOP 5
	category_name,
	product_name,
	net_sales,
	RANK() OVER (ORDER BY net_sales DESC) AS ranking

FROM (
	SELECT  
		categories.CategoryName AS category_name,  
		products.ProductName AS product_name,  
		ROUND(SUM(COALESCE(TRY_CAST(sales.Quantity AS INT), 0) * COALESCE(products.Price, 0) * 
		(1 - COALESCE(TRY_CAST(sales.Discount AS DECIMAL(10,2)), 0))), 2) AS net_sales 

	FROM sales
	LEFT JOIN products ON sales.ProductID = products.ProductID
	LEFT JOIN categories ON categories.CategoryID = products.CategoryID

	GROUP BY
		categories.CategoryName, 
		products.ProductName

) AS ranked_net_sales