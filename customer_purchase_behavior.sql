/*
Customer Purchase Behavior
	Objective: 
		Understand how customers interact with products during the four-month period.

	Tasks:
		Segment customers based on their purchase frequency and total spend.
		Identify repeat customers versus one-time buyers.
		Analyze average order value and basket size.
*/

WITH sales_data AS (
	SELECT  
		CONCAT(customers.FirstName, ' ', customers.LastName) AS customer_name,
		COUNT(DISTINCT sales.TransactionNumber) AS purchase_frequency, 
		SUM(ISNULL(TRY_CAST(sales.Quantity AS INT), 0)) AS total_quantity,
		CASE  
			WHEN COUNT(DISTINCT sales.TransactionNumber) > 1 THEN 'Repeat Buyer' 
			ELSE 'One-Time Buyer'  
		END AS customer_type,

		ROUND(SUM(ISNULL(TRY_CAST(sales.Quantity AS INT), 0) * ISNULL(products.Price, 0) * 
			(1 - ISNULL(TRY_CAST(sales.Discount AS DECIMAL(10,2)), 0) / 100)), 2) AS net_sales
	FROM sales
		LEFT JOIN products ON products.ProductID = sales.ProductID
		LEFT JOIN customers ON customers.CustomerID = sales.CustomerID
	GROUP BY CONCAT(customers.FirstName, ' ', customers.LastName)
)
SELECT TOP 5
	customer_name,
	customer_type,
	purchase_frequency,
	ROUND(net_sales / NULLIF(purchase_frequency, 0), 2) AS average_order_value,
	ROUND(total_quantity / NULLIF(purchase_frequency, 0), 2) AS average_basket_size,
	net_sales
FROM sales_data
ORDER BY net_sales DESC;