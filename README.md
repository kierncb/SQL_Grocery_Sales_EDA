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

Confections led sales, peaking at $132.8M in January 2018, while Meat, Poultry, and Cereals remained strong performers. Repeat buyers like Wayne Chan drove revenue, with high purchase frequency and basket sizes. The top-selling product, Bread - Calabrese Baguette, earned $18.87M, alongside strong sales in Cereals and Beverages. Shelby Riddle led in total sales ($189.41M), while Julie Dyer handled the most transactions. Tucson, Jackson, and Sacramento topped U.S. sales, contributing to a total revenue of $4.33B.

To increase grocery sales, it is important to focus on product categories, customer retention, sales efficiency, high-performing products, and regional strategies. Grocery stores can achieve business growth by expanding popular items, improving loyalty programs, and enhancing the sales team’s performance. Additionally, maintaining stock availability, bundling products, and targeting key cities can help maximize revenue. By applying these strategies, grocery stores can strengthen their market position and achieve long-term success.

## Insights Deep-Dive
### Sales Performance:

- Confections consistently led in sales every month, with the highest sales in January 2018 ($132.8M).

- Meat, Poultry, and Cereals followed as strong-performing categories, with sales ranging between $29.7M to $117M per month.

- Snails had the lowest total sales among the top 5 categories but still maintained a steady contribution.

- Sales generally increased from January to April 2018 but declined significantly across all categories in May. 

| Month  | Product Category | Total Sales (USD) |
|--------|-----------------|-------------------|
| ***2018-05*** | ***Confections*** | ***38,865,310.55*** |
| 2018-05 | Meat | 34,267,238.10 |
| 2018-05 | Poultry | 30,570,020.35 |
| 2018-05 | Cereals | 29,794,319.91 |
| 2018-05 | Beverages | 25,415,764.67 |
| ***2018-04*** | ***Confections*** | ***128,067,528.90*** |
| 2018-04 | Meat | 113,668,025.70 |
| 2018-04 | Poultry | 101,459,715.70 |
| 2018-04 | Cereals | 98,297,573.41 |
| 2018-04 | Snails | 85,700,809.38 |
| ***2018-03*** | ***Confections*** | ***132,593,219.50*** |
| 2018-03 | Meat | 117,513,943.50 |
| 2018-03 | Poultry | 104,739,610.60 |
| 2018-03 | Cereals | 102,170,027.90 |
| 2018-03 | Snails | 88,317,115.21 |
| ***2018-02*** | ***Confections*** | ***119,022,995.20*** |
| 2018-02 | Meat | 105,350,958.70 |
| 2018-02 | Poultry | 94,272,649.27 |
| 2018-02 | Cereals | 91,660,789.56 |
| 2018-02 | Snails | 79,984,136.47 |
| ***2018-01*** | ***Confections*** | ***132,815,141.60*** |
| 2018-01 | Meat | 117,126,752.40 |
| 2018-01 | Poultry | 104,779,706.30 |
| 2018-01 | Cereals | 101,202,044.30 |
| 2018-01 | Snails | 88,950,227.96 |

*View my SQL queries [here](monthly_sales_performance.sql).*

### Customer Purchase Behavior:
- Wayne Chan has the highest purchase frequency (103) and total spent amount (130,324.16).

- Ronda Wallace records the highest average order value (1,297.05) despite ranking third in total spent.

- Olivia Dean, Ericka O’Connor, and Paula Lin exhibit consistent spending patterns, with average order values ranging from 1,258.85 to 1,269.62.

- All top customers are repeat buyers with an average basket size of approximately 25, indicating strong purchasing consistency.

| Full Name          | Purchase Frequency | Customer Type  | Average Order Value | Average Basket Size | Total Spent   |
|--------------------|-------------------|---------------|---------------------|--------------------|--------------|
| Wayne Chan        | 103               | Repeat Buyer  | 1,265.28           | 24                 | 130,324.16   |
| Olivia Dean       | 97                | Repeat Buyer  | 1,268.09           | 25                 | 123,004.86   |
| Ronda Wallace     | 94                | Repeat Buyer  | 1,297.05           | 25                 | 121,922.59   |
| Ericka O'Connor   | 96                | Repeat Buyer  | 1,269.62           | 25                 | 121,883.95   |
| Paula Lin         | 96                | Repeat Buyer  | 1,258.85           | 25                 | 120,849.78   |

*View my SQL queries [here](customer_purchase_behavior.sql).*

### Top Performing Products:

- The top-grossing product is Bread - Calabrese Baguette (Dairy) with a total revenue of 18.87M.

- Cereals and Beverages follow closely, with Shrimp - 31/40 (18.72M) and Puree - Passion Fruit (18.70M).

- Tia Maria (Beverages) and Zucchini - Yellow (Snails) complete the top five, each generating over 18.55M in revenue.

- The revenue difference between the highest and lowest-ranked products in the top five is minimal, indicating strong sales performance across multiple categories.

| Revenue Rank | Product Category | Product Name                     | Total Revenue     |
|-------------|-----------------|---------------------------------|----------------|
| 1           | Dairy           | Bread - Calabrese Baguette      | 18,868,838.46  |
| 2           | Cereals         | Shrimp - 31/40                 | 18,721,942.13  |
| 3           | Beverages       | Puree - Passion Fruit          | 18,703,480.12  |
| 4           | Beverages       | Tia Maria                      | 18,685,124.71  |
| 5           | Snails          | Zucchini - Yellow              | 18,551,657.91  |

*View my SQL queries [here](top_products_identification.sql).*

### Salesperson Effectiveness:

- Shelby Riddle leads in total sales (189.41M) despite ranking second in transactions (293,562).

- Julie Dyer has the highest number of transactions (294,449) but slightly lower total sales (188.86M).

- Daphne King, Nicole Fuller, and Pablo Cline follow closely, all exceeding 187.5M in total sales.

- The sales performance among the top five salespersons is highly competitive, with a narrow revenue gap.

| Employee ID | Sales Person   | Transactions | Total Sales      |
|------------|---------------|--------------|------------------|
| 20         | Shelby Riddle | 293,562      | 189,413,136.40   |
| 8          | Julie Dyer    | 294,449      | 188,862,586.80   |
| 9          | Daphne King   | 294,180      | 187,854,115.60   |
| 1          | Nicole Fuller | 293,394      | 187,649,473.60   |
| 3          | Pablo Cline   | 293,175      | 187,529,449.80   |

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
1. **Optimize Product Category Performance**

    - **Boost High-Demand Items**: Confections bring in the most revenue. Stock more, add new varieties, and run promotions to increase sales.

    - **Tackle Seasonal Slumps**: Sales dropped in May. Analyze the cause (demand shifts, supply issues) and find ways to prevent future declines.

    - **Improve Slow Sellers**: Snails sell steadily but rank low. Use promos, bundles, or price changes to boost sales.

2. **Strengthen Customer Retention & Engagement**
    
    - **Personalized Deals for Top Customers**: Wayne Chan and Ronda Wallace buy consistently. Use discounts, rewards, or targeted promos to boost loyalty.

    - **Encourage Bigger Purchases**: Top customers buy around 25 items per order. Offer bulk discounts, recommendations, or cross-sells to increase basket size.

3. **Enhance Sales Team Efficiency**

    - **Reward Top Salespeople**: Shelby Riddle leads in sales, while Julie Dyer handles the most transactions. Incentives for both revenue and engagement can boost performance.

    - **Optimize Sales Strategies**: Study top performers' techniques to refine best practices, improve conversions, and drive team-wide growth.

4. **Expand High-Performing Product Lines**

    - **Keep Bestsellers in Stock**: Top items like Calabrese Baguette and Shrimp (31/40) drive revenue. Ensure enough inventory to avoid stockouts.

    - **Boost Sales with Bundles**: Pair Tia Maria with other drinks or offer dairy discounts with Calabrese Baguette to increase purchases.

5. **Optimize Regional Sales Strategies**
    
    
    - **City-Specific Marketing**: Tucson, Jackson, and Sacramento lead in sales. Use local promotions and optimize inventory to boost revenue.

    - **Expand Strategically**: Study buying trends in top cities to find the best locations for growth and distribution.