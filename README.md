# Grocery Sales Analysis  

### Table of Contents
- [Project Overview](#project-overview)
- [Data Structure](#data-structure)
- [Executive Summary](#executive-summary)
- [Insights Deep-Dive](#insights-deep-dive)
- [Recommendations](#recommendations)

## Project Overview  
This project analyzes grocery sales data to extract valuable insights and optimize business strategies. By leveraging SQL queries, the analysis provides detailed reports on sales trends and patterns over a four-month period.  

Insights and recommendations are provided on the following key areas:
- **Sales Performance:** Identifies trends and patterns in sales over the four-month period to assess overall performance.  
- **Customer Behavior:** Examines purchasing patterns and interactions with products to understand consumer preferences.  
- **Top-Performing Products:** Determines the best- and worst-selling products within the dataset timeframe.  
- **Salesperson Effectiveness:** Evaluates the contribution of sales personnel to revenue generation.  
- **Geographical Sales Distribution:** Analyzes how sales vary across different cities and countries.  

## Data Structure
Grocery sales database structure as seen below consists of seven tables: categories, products, cities, sales, countries, customers, and employees, with a total row count of 6,761,757 records.

![alt text](<Grocery Sales ERD.png>)

*Grocery sales dataset can be found [here](https://www.kaggle.com/datasets/andrexibiza/grocery-sales-dataset).*

## Executive Summary

Confections led sales, peaking at ₱132.8M in January 2018, while Meat and Poultry remained strong performers. Repeat buyers like Lesley Perry contributed significantly to revenue, with high purchase frequency and basket sizes. Among products, Bread - Calabrese Baguette (₱18.87M) was the top seller, followed by Shrimp - 31/40 (₱18.72M) and Puree - Passion Fruit (₱18.70M). In sales performance, Devon Brewer led with ₱190.04M in total sales, while Shelby Riddle and Julie Dyer followed closely with competitive performance. Additionally, top-performing cities, including Tucson, Jackson, and Sacramento, Fort Wayne, and Indianapolis contributed a total of ₱240.52M in sales.

To increase grocery sales, it is important to focus on product categories, customer retention, sales efficiency, high-performing products, and regional strategies. Grocery stores can achieve business growth by expanding popular items, improving loyalty programs, and enhancing the sales team’s performance. Additionally, maintaining stock availability, bundling products, and targeting key cities can help maximize revenue. By applying these strategies, grocery stores can strengthen their market position and achieve long-term success.

## Insights Deep-Dive
### Sales Performance:

- Confections consistently led sales from January to April 2018, peaking at ₱132.8M in January.

- Meat and Poultry followed similar trends, with Meat maintaining second place.

- The data suggests that the first four months had stable demand, while May saw a significant decline across all categories.

| sales_date | category_name | net_sales |
|------------|--------------|------------|
| 2018-01    | Confections  | 132,815,141.60 |
| 2018-01    | Meat        | 117,126,752.40 |
| 2018-01    | Poultry     | 104,779,706.30 |
| 2018-02    | Confections  | 119,022,995.20 |
| 2018-02    | Meat        | 105,350,958.70 |
| 2018-02    | Poultry     | 94,272,649.27  |
| 2018-03    | Confections  | 132,593,219.50 |
| 2018-03    | Meat        | 117,513,943.50 |
| 2018-03    | Poultry     | 104,739,610.60 |
| 2018-04    | Confections  | 128,067,528.90 |
| 2018-04    | Meat        | 113,668,025.70 |
| 2018-04    | Poultry     | 101,459,715.70 |
| 2018-05    | Confections  | 38,865,310.55  |
| 2018-05    | Meat        | 34,267,238.10  |
| 2018-05    | Poultry     | 30,570,020.35  |

*View my SQL queries [here](monthly_sales_performance.sql).*

### Customer Purchase Behavior:

- Lesley Perry generated the highest net sales (269.9K) despite not having the highest purchase frequency, likely due to a higher average order value (1,237.88).

- Rosa Shelton had the highest purchase frequency (229 orders) but had the lowest average order value (1,024.71), leading to lower net sales.

- All top customers are repeat buyers, highlighting strong customer retention.

- Average basket size remains consistent (20-23 items), suggesting stable purchasing behavior among repeat buyers.

| customer_name  | customer_type  | purchase_frequency | average_order_value | average_basket_size | net_sales   |
|---------------|---------------|--------------------|---------------------|--------------------|------------|
| Lesley Perry  | Repeat Buyer  | 218                | 1,237.88            | 23                 | 269,858.03  |
| Beth Underwood | Repeat Buyer  | 208                | 1,167.57            | 23                 | 242,855.11  |
| Alberto Lamb  | Repeat Buyer  | 223                | 1,082.09            | 21                 | 241,305.79  |
| Rosa Shelton  | Repeat Buyer  | 229                | 1,024.71            | 20                 | 234,658.99  |
| Colleen Bass  | Repeat Buyer  | 209                | 1,120.22            | 21                 | 234,126.57  |

*View my SQL queries [here](customer_purchase_behavior.sql).*

### Top Performing Products:

- The top-grossing product is Bread - Calabrese Baguette (Dairy) with a total revenue of 18.87M.

- Cereals and Beverages follow closely, with Shrimp - 31/40 (18.72M) and Puree - Passion Fruit (18.70M).

- Tia Maria (Beverages) and Zucchini - Yellow (Snails) complete the top five, each generating over 18.55M in revenue.

- The revenue difference between the highest and lowest-ranked products in the top five is minimal, indicating strong sales performance across multiple categories.

| category_name | product_name                | net_sales     | ranking |
|--------------|----------------------------|--------------|---------|
| Dairy        | Bread - Calabrese Baguette  | 18,868,838.46 | 1       |
| Cereals      | Shrimp - 31/40              | 18,721,942.13 | 2       |
| Beverages    | Puree - Passion Fruit       | 18,703,480.12 | 3       |
| Beverages    | Tia Maria                   | 18,685,124.71 | 4       |
| Snails       | Zucchini - Yellow           | 18,551,657.91 | 5       |

*View my SQL queries [here](top_products_identification.sql).*

### Salesperson Effectiveness:

- Devon Brewer achieved the highest net sales (₱190M) with 294,983 transactions, leading in both metrics.

- Shelby Riddle and Julie Dyer closely follow, with minor differences in transactions and net sales, indicating a competitive sales team.

- Nicole Fuller and Seth Franco had slightly lower transactions and sales, but the gap is minimal, showing consistent performance across all salespersons.

- Overall, sales distribution among the top performers is balanced, with no significant outliers.

| sales_person   | transactions | net_sales      |
|---------------|-------------|---------------|
| Devon Brewer  | 294,983     | 190,042,744.00 |
| Shelby Riddle | 293,562     | 189,413,136.40 |
| Julie Dyer    | 294,449     | 188,862,586.80 |
| Nicole Fuller | 293,394     | 187,649,473.60 |
| Seth Franco   | 292,521     | 186,320,422.50 |

*View my SQL queries [here](salesperson_effectiveness.sql).*

### Geographical Sales Distribution:
- All recorded sales are from the United States, totaling 4.33B in revenue.

- Tucson leads U.S. cities in sales (48.84M), followed closely by Jackson (48.42M) and Sacramento (48.19M).

- Fort Wayne and Indianapolis also rank in the top five, with sales exceeding 47M each.

- The sales distribution across cities is relatively balanced, with only a 1.46M difference between the highest and lowest-ranked cities.

| Country Name   | Total Sales     |
|---------------|----------------|
| United States | 4,332,445,646   |


| Country Name   | City Name    | Total Sales      |
|---------------|-------------|------------------|
| United States | Tucson      | 48,839,206.70   |
| United States | Jackson     | 48,416,144.46   |
| United States | Sacramento  | 48,191,156.53   |
| United States | Fort Wayne  | 47,690,126.14   |
| United States | Indianapolis | 47,379,032.03   |

*View my SQL quesries [here](geographical_sales.sql).*

## Recommendations  

### 1. **Optimize Product Category Performance**  

- **Boost High-Demand Items**: Confections generate the highest revenue, peaking at **$132.8M in January 2018**. Increase stock, introduce new varieties, and run promotions to maintain demand.  
- **Tackle Seasonal Slumps**: Sales dropped significantly in May across all categories. Investigate the cause (e.g., demand shifts, supply chain issues) and implement strategies to stabilize sales.  
- **Improve Slow Sellers**: Snails rank among the lower-performing categories. Use promotions, bundles, or pricing adjustments to increase sales.  

### 2. **Strengthen Customer Retention & Engagement**  

- **Personalized Deals for Top Customers**: **Lesley Perry and Beth Underwood** are top repeat buyers, making frequent purchases with high basket sizes. Offer exclusive discounts, loyalty rewards, or targeted promotions to strengthen engagement.  
- **Encourage Bigger Purchases**: Top customers purchase around **20-23 items per order**. Implement bulk discounts, personalized recommendations, or cross-selling strategies to increase basket size and revenue.  

### 3. **Enhance Sales Team Efficiency**  

- **Reward Top Salespeople**: **Devon Brewer leads in total sales ($190.04M)**, while **Shelby Riddle and Julie Dyer** also show competitive performance. Implement incentives for both revenue generation and high transaction volume.  
- **Optimize Sales Strategies**: Analyze the selling techniques of top performers to refine best practices, improve customer conversion rates, and drive team-wide sales growth.  

### 4. **Expand High-Performing Product Lines**  

- **Keep Bestsellers in Stock**: The top-selling product, **Bread - Calabrese Baguette ($18.87M)**, along with **Shrimp - 31/40 ($18.72M)** and **Puree - Passion Fruit ($18.70M)**, are key revenue drivers. Ensure a steady supply to prevent stock shortages.  
- **Boost Sales with Bundles**: Offer bundle deals, such as **Tia Maria paired with other beverages** or **Calabrese Baguette with dairy discounts**, to encourage higher-value purchases.  

### 5. **Optimize Regional Sales Strategies**  

- **City-Specific Marketing**: **Tucson, Jackson, Sacramento, Fort Wayne, and Indianapolis are the top-performing cities**, contributing a total of **$240.52M in sales**. Tailor marketing strategies and optimize inventory allocation to maximize regional performance.  
- **Expand Strategically**: Analyze purchasing trends in high-performing cities to identify the best locations for expansion and improved distribution strategies.
