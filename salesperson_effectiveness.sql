/*
Salesperson Effectiveness
	Objective: 
		Evaluate the performance of sales personnel in driving sales.

	Tasks:
		Calculate total sales attributed to each salesperson.
		Identify top-performing and underperforming sales staff.
		Analyze sales trends based on individual salesperson contributions over time.
*/

WITH SalesData AS (
    -- aggregate sales performance at the employee level  
    -- calculate total transactions and total sales revenue per salesperson  

    SELECT TOP 5
        employees.EmployeeID,
        CONCAT(employees.FirstName, ' ', employees.LastName) AS sales_person,  
        COUNT(DISTINCT sales.TransactionNumber) AS transactions,  
        ROUND(SUM(COALESCE(TRY_CAST(sales.Quantity AS INT), 0) * COALESCE(products.Price, 0) * 
                  (1 - COALESCE(TRY_CAST(sales.Discount AS DECIMAL(10,2)), 0))), 2) AS total_sales  

    FROM employees  
    LEFT JOIN sales ON sales.SalesPersonID = employees.EmployeeID
    LEFT JOIN products ON sales.ProductID = products.ProductID 

    GROUP BY 
    employees.EmployeeID, CONCAT(employees.FirstName, ' ', employees.LastName)  
)

-- Retrieve and display all sales performance data, sorted by highest total sales  
SELECT * FROM SalesData  
ORDER BY total_sales DESC 