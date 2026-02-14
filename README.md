# CoffeeShop_Sales_Analysis_Using-SQL
☕ Coffee Shop Sales Analysis – SQL Project Summary
📊 Results Achieved

Built 9 analytical SQL views (A–I) to measure monthly Sales, Orders, and Quantity trends.

Calculated total monthly revenue using (Quantity × Unit_Price) aggregation.

Measured Month-on-Month (MoM) growth/decline for Sales, Orders, and Quantity including percentage change.

Generated structured monthly performance reports for trend comparison and business monitoring.

🏆 Key Achievements

Implemented full MoM growth analysis framework using window functions.

Created reusable SQL views for business reporting automation.

Handled division-by-zero scenarios using NULLIF() for accurate percentage calculations.

Designed structured time-based aggregation using month-level grouping.

📈 Trends & Business Insights

Identified monthly revenue fluctuations and seasonal performance patterns.

Detected increases/decreases in customer order volume over time.

Tracked quantity demand trends to monitor product consumption behavior.

Enabled performance comparison between current and previous months for strategic decisions.

🛠 Tools & Technologies Used

PostgreSQL

Time-based data transformation using DATE_TRUNC, DATE_PART, TO_CHAR

Structured reporting via CREATE VIEW

Transaction-level revenue modeling from raw sales data

⚙ SQL Methods Applied

Aggregations: SUM(), COUNT()

Window Functions: LAG() for previous month comparison

Growth Calculations: Difference & Percentage Change formulas

Data Formatting & Safety: ROUND(), NULLIF()

Grouping & Ordering: GROUP BY, ORDER BY
-------

☕ Coffee Shop Sales Analysis — Project Summary
🎯 Project Objective

To analyze the monthly performance of coffee shop transactions by calculating key metrics such as sales, orders, quantity trends, and their month-on-month changes to support business decision-making.

📊 Results & Insights (What You Found)

1. Revenue Trends

Calculated total sales for each month using (Quantity × Unit_Price).

Discovered which months showed higher revenue peaks and months with declines, useful for evaluating seasonality.

2. Growth Patterns

Measured Month-on-Month (MoM) Sales Change (absolute and percentage) that highlights business growth acceleration or slowdown.

Similar MoM insights were derived for Order Count and Quantity Sold, showing customer demand changes.

3. Order & Quantity Behavior

Identified trends in total orders per month, revealing periods of high traffic or slowdown.

Quantity analysis showed product consumption trends and how they changed month to month.

🏆 Key Achievements (What You Accomplished)

1. Built 9 Structured SQL Views

Created reusable and reportable views (A through I) for different analytical aspects (Sales, Orders, Quantity, and their changes).

2. Applied Advanced SQL Techniques

Used window functions (LAG()) to compare values across consecutive months.

Implemented safe percentage change calculation using NULLIF() to prevent division errors.

3. Meaningful Business Patterns

Revealed clear month-by-month performance patterns useful for:

Inventory planning
