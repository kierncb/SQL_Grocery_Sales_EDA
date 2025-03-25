/*
Geographical Sales Insights
	Objective: 
		Explore how sales are distributed across different cities and countries within the dataset.
	Tasks:
		Map sales data to specific cities and countries to identify high-performing regions.
		Compare sales volumes between various geographical areas.
		Assess the effectiveness of regional sales strategies.
*/

-- for countries
SELECT 
    DISTINCT(countries.CountryName) AS country_name,
    -- Compute total sales per city by summing the revenue from all sales transactions  
    ROUND(SUM(COALESCE(TRY_CAST(sales.Quantity AS INT), 0) * COALESCE(products.Price, 0) * 
                (1 - COALESCE(TRY_CAST(sales.Discount AS DECIMAL(10,2)), 0))), 2) AS total_sales  

FROM countries
JOIN cities ON cities.CountryID = countries.CountryID  -- Link cities to their respective countries  
JOIN customers ON customers.CityID = cities.CityID  -- Link customers to their respective cities  
JOIN sales ON sales.CustomerID = customers.CustomerID  -- Link sales transactions to customers  
JOIN products ON products.ProductID = sales.ProductID  -- Link sales transactions to products  

GROUP BY
    countries.CountryName


-- for cities
WITH sales_data AS (
    -- aggregate sales data at the country and city level  
    -- calculate total sales by multiplying quantity with product price,  

    SELECT
        DISTINCT(countries.CountryName) AS country_name,
        cities.CityName AS city_name,

        -- compute total sales per city by summing the revenue from all sales transactions  
        ROUND(SUM(COALESCE(TRY_CAST(sales.Quantity AS INT), 0) * COALESCE(products.Price, 0) * 
                  (1 - COALESCE(TRY_CAST(sales.Discount AS DECIMAL(10,2)), 0))), 2) AS total_sales  

    FROM countries
    JOIN cities ON cities.CountryID = countries.CountryID  -- Link cities to their respective countries  
    JOIN customers ON customers.CityID = cities.CityID  -- Link customers to their respective cities  
    JOIN sales ON sales.CustomerID = customers.CustomerID  -- Link sales transactions to customers  
    JOIN products ON products.ProductID = sales.ProductID  -- Link sales transactions to products  

    GROUP BY
        countries.CountryName,
        cities.CityName
)

-- Retrieve the top 10 cities with the highest total sales  
SELECT TOP 5
    country_name,
    city_name,
    total_sales
FROM sales_data
ORDER BY sales_data.total_sales DESC