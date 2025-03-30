/*
Geographical Sales Insights
	Objective: 
		Explore how sales are distributed across different cities and countries within the dataset.
	Tasks:
		Map sales data to specific cities and countries to identify high-performing regions.
		Compare sales volumes between various geographical areas.
		Assess the effectiveness of regional sales strategies.
*/


WITH sales_data AS (
    SELECT
        DISTINCT(countries.CountryName) AS country_name,
        cities.CityName AS city_name,

        ROUND(SUM(COALESCE(TRY_CAST(sales.Quantity AS INT), 0) * COALESCE(products.Price, 0) * 
                  (1 - COALESCE(TRY_CAST(sales.Discount AS DECIMAL(10,2)), 0))), 2) AS net_sales  

    FROM countries
    JOIN cities ON cities.CountryID = countries.CountryID 
    JOIN customers ON customers.CityID = cities.CityID 
    JOIN sales ON sales.CustomerID = customers.CustomerID
    JOIN products ON products.ProductID = sales.ProductID

    GROUP BY
        countries.CountryName,
        cities.CityName
)
SELECT TOP 5
    country_name,
    city_name,
    net_sales
FROM sales_data
ORDER BY sales_data.net_sales DESC