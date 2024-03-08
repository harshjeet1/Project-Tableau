#Show all customer records
SELECT * FROM customers;

#Show total number of customers
SELECT count(*) AS Total_customers FROM customers; #38

#Show transactions for Chennai market (market code for chennai is Mark001)
SELECT * FROM transactions WHERE market_code='Mark001';
SELECT COUNT(*) FROM transactions WHERE market_code='Mark001'; #1035

#Show distrinct product codes that were sold in chennai
SELECT distinct product_code, market_code FROM transactions where market_code='Mark001';
SELECT count(DISTINCT(product_code)) AS Total_dist_code FROM transactions where market_code='Mark001'; #77

#Show transactions where currency is US dollars
SELECT * FROM transactions WHERE currency = "USD"; #2

#Show transactions in 2020 join by date table ---'21550'
SELECT transactions.*, date.* FROM transactions 
INNER JOIN date ON transactions.order_date = date.date 
WHERE date.year = 2020 ;

SELECT transactions.*, date.*, count(product_code) AS total_transaction FROM transactions 
INNER JOIN date ON transactions.order_date = date.date 
WHERE date.year = 2020 ;  

#Show total revenue in year 2020 ---'142235559'
SELECT sum(transactions.sales_amount) AS Total_sales from transactions 
INNER JOIN date on transactions.order_date = date.date
WHERE date.year = 2020;

#Show total revenue in year 2020, January Month ----'25659711'
SELECT sum(transactions.sales_amount) AS Total_sales from transactions 
INNER JOIN date on transactions.order_date = date.date
WHERE date.year = 2020 AND date.month_name = "January" ;

#Show total revenue in year 2020 in Chennai ---'2463024'
SELECT sum(transactions.sales_amount) AS Total_sales from transactions 
INNER JOIN date on transactions.order_date = date.date
WHERE date.year = 2020 AND transactions.market_code="Mark001" ;
