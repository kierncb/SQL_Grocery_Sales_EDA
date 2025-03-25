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
    -- Extract customer-level purchase data  
    -- Calculate key metrics:  purchase_frequency, total_spent, total_quantity

    SELECT  
        sales.CustomerID,  
        COUNT(DISTINCT sales.TransactionNumber) AS purchase_frequency, 
        SUM(COALESCE(TRY_CAST(sales.Quantity AS INT), 0) * COALESCE(products.Price, 0) * 
            (1 - COALESCE(TRY_CAST(sales.Discount AS DECIMAL(10,2)), 0))) AS total_spent,
        SUM(COALESCE(TRY_CAST(sales.Quantity AS INT), 0)) AS total_quantity
    FROM sales
    LEFT JOIN products ON products.ProductID = sales.ProductID  -- Join to get product price  
    GROUP BY sales.CustomerID  -- Group by customer for aggregation  
)   
-- Retrieve customer names  
-- Categorize customers as 'Repeat Buyer' or 'One-Time Buyer'  
-- Calculate additional customer metrics:  average_order_value, basket_size
SELECT TOP 5
    TRIM(CONCAT(COALESCE(customers.FirstName, ''), ' ', COALESCE(customers.LastName, ''))) AS full_name,
    sales_data.purchase_frequency,  
    CASE  
        WHEN sales_data.purchase_frequency > 1 THEN 'Repeat Buyer' 
        ELSE 'One-Time Buyer'  
    END AS customer_type,  
    ROUND(sales_data.total_spent / NULLIF(sales_data.purchase_frequency, 0), 2) AS average_order_value,  -- Avoid division by zero  
    ROUND(sales_data.total_quantity / NULLIF(sales_data.purchase_frequency, 0), 2) AS average_basket_size,  -- Average quantity per order  
	ROUND(sales_data.total_spent, 2) AS total_spent

FROM sales_data
LEFT JOIN customers ON customers.CustomerID = sales_data.CustomerID
ORDER BY total_spent DESC

