  
  ==>> Coffee Shop Transactions SQL File - solved
  
-- 1. Calculate the total sales for each respective month

CREATE VIEW A AS 
SELECT
  TO_CHAR(Transaction_Date, 'Month') AS Month_Name,
  DATE_PART('Month', Transaction_Date) AS Month_Number,
  SUM(Quantity * Unit_Price) AS Total_Sales
FROM Transactions
GROUP BY
  TO_CHAR(Transaction_Date, 'Month'),
  DATE_PART('Month', Transaction_Date)
ORDER BY Month_Number;

SELECT * FROM A


-- 2. Determine the month-on-month increase or decrease in sales

CREATE VIEW B AS
SELECT 
  TO_CHAR(transaction_date, 'Mon YYYY') AS month,
  DATE_PART('month', transaction_date) AS month_number,
  SUM(quantity * unit_price) AS total_sales,

  LAG(SUM(quantity * unit_price)) OVER (
    ORDER BY DATE_TRUNC('month', transaction_date)
  ) AS previous_month_sales,

  (SUM(quantity * unit_price) - 
   LAG(SUM(quantity * unit_price)) OVER (
     ORDER BY DATE_TRUNC('month', transaction_date)
   )
  ) AS sales_change,

  ROUND((
    (SUM(quantity * unit_price) - 
     LAG(SUM(quantity * unit_price)) OVER (
       ORDER BY DATE_TRUNC('month', transaction_date)
     )
    ) / NULLIF(
      LAG(SUM(quantity * unit_price)) OVER (
        ORDER BY DATE_TRUNC('month', transaction_date)
      ), 0
    )
  ) * 100, 2) AS percent_change

FROM transactions

GROUP BY 
  DATE_TRUNC('month', transaction_date),
  TO_CHAR(transaction_date, 'Mon YYYY'),
  DATE_PART('month', transaction_date)

ORDER BY 
  DATE_TRUNC('month', transaction_date);

SELECT * FROM B


-- 3. Calculate the difference in sales between the selected month and the previous month

CREATE VIEW C AS
SELECT 
    TO_CHAR(transaction_date, 'Mon YYYY') AS month,
    DATE_PART('month', transaction_date) AS month_number,
    SUM(quantity * unit_price) AS total_sales,
    
    LAG(SUM(quantity * unit_price)) OVER (
        ORDER BY DATE_TRUNC('month', transaction_date)
    ) AS previous_month_sales,
    
    (SUM(quantity * unit_price) - 
     LAG(SUM(quantity * unit_price)) OVER (
         ORDER BY DATE_TRUNC('month', transaction_date)
     )
    ) AS sales_difference

FROM 
    transactions

GROUP BY 
    DATE_TRUNC('month', transaction_date),
    TO_CHAR(transaction_date, 'Mon YYYY'),
    DATE_PART('month', transaction_date)

ORDER BY 
    DATE_TRUNC('month', transaction_date);

SELECT * FROM C


--4. Calculate the total number of orders for each respective month

Create View D As
Select 
To_Char(Transaction_Date, 'Mon YYYY') as Month,
Date_Part('Month', Transaction_Date) AS Month_Number,
Count(Transaction_Id) as Total_Orders
From Transactions
Group By
Date_Trunc('Month', Transaction_Date),
To_Char(Transaction_Date, 'Mon YYYY'),
Date_Part('Month', Transaction_Date)
Order By
Date_Trunc('Month', Transaction_Date);

Select * From D


--5. Determine the month-on-month increase or decrease in the number of orders.

Create View E As
Select
To_Char(Transaction_Date, 'Mon YYYY') as Month,
Date_Part('month', transaction_date) AS month_number,
Count(Transaction_Id) as Total_Orders,
Lag(Count(Transaction_Id))
Over(Order By Date_Trunc('Month', Transaction_Date)) as Previous_Month_Orders,
(Count(Transaction_Id) - Lag(Count(Transaction_Id))
Over(Order by Date_Trunc('Month', Transaction_Date))) as Order_Change,
Round(((Count(Transaction_Id) - Lag(Count(Transaction_Id))
Over(Order By Date_Trunc('Month', Transaction_Date)))::numeric
/ Nullif(Lag(Count(Transaction_Id))
Over(Order By Date_Trunc('Month', Transaction_Date)), 0)) *100,2) as Percent_Change
From Transactions
Group By 
Date_Trunc('Month', Transaction_Date),
To_Char(Transaction_Date, 'Mon YYYY'),
Date_Part('month', transaction_date)
Order By
Date_Trunc('Month', Transaction_Date);

Select * From E


--6. Calculate the difference in the number of orders between the selected month and the previous month

Create View F As
Select
To_Char(Transaction_Date, 'Mon YYYY') as Month,
Date_Part('month', transaction_date) AS month_number,
Count(Transaction_Id) as Total_Orders,
Lag(Count(Transaction_Id))
Over(Order By Date_Trunc('Month', Transaction_Date)) as Previous_Month_Orders,
(Count(Transaction_Id) - Lag(Count(Transaction_Id))
Over(Order By Date_Trunc('Month', Transaction_Date))) as Order_Change
From Transactions
Group By
Date_Trunc('Month', Transaction_Date),
To_Char(Transaction_Date, 'Mon YYYY'),
Date_Part('month', transaction_date)
Order By
Date_Trunc('Month', Transaction_Date);

Select * From F


--7. Calculate the total quantity sold for each respective month.

Create View G as
Select 
To_Char(Transaction_Date, 'Mon YYYY') as Month,
Date_Part('month', transaction_date) AS month_number,
Sum(Quantity) as Total_Quantity
From Transactions
Group By
Date_Trunc('Month', Transaction_Date),
To_Char(Transaction_Date, 'Mon YYYY'),
Date_Part('month', transaction_date)
Order By
Date_Trunc('Month', Transaction_Date);

Select * From G


--8. Determine the month-on-month increase or decrease in the total quantity sold.

Create View H as
Select 
To_Char(Transaction_Date, 'Mon YYYY') as Month,
Date_Part('month', transaction_date) AS month_number,
Sum(Quantity) as Total_Quantity,
Lag(Sum(Quantity))
Over(Order by Date_Trunc('Month', Transaction_Date)) as Previous_Month_Quantity,
(Sum(Quantity) - Lag(Sum(Quantity))
Over(Order by Date_Trunc('Month', Transaction_Date))) as Quantity_Change,
Round(((Sum(Quantity) - Lag(Sum(Quantity))
Over(Order By Date_Trunc('Month', Transaction_Date)))::numeric
/ nullif(Lag(Sum(Quantity))
Over(Order by Date_Trunc('Month', Transaction_Date)),0)) * 100,2) as Percent_Change
From Transactions
Group By 
Date_Trunc('Month', Transaction_Date),
To_Char(Transaction_Date, 'Mon YYYY'),
Date_Part('month', transaction_date)
Order By
Date_Trunc('Month', Transaction_Date);

Select * From H


--9. Calculate the difference in the total quantity sold between the selected month 
and the previous month

Create View I As
Select 
To_Char(Transaction_Date, 'Mon YYYY') As Month,
Date_Part('month', transaction_date) AS month_number,
Sum(Quantity) As Total_Quantity,
Lag(Sum(Quantity))
Over(Order By Date_Trunc('Month', Transaction_Date)) As Previous_Month_Quantity,
Sum(Quantity) - Lag(Sum(Quantity))
Over(Order By Date_Trunc('Month', Transaction_Date)) As Quantity_Change
From Transactions
Group By
Date_Trunc('Month', Transaction_Date),
To_Char(Transaction_Date, 'Mon YYYY'),
Date_Part('month', transaction_date)
Order By
Date_Trunc('Month', Transaction_Date)

Select * From I



----------------------------------------- Thank you
										   ----- RAMESH SABHAVATH
                                           
                                           
                                           
                                           
                                           
                                           
                                           