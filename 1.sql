SELECT * FROM salesdatawalmart.sales;

--Feature Engineering--

-- time_of_day
SELECT 
    time,
    (CASE 
        WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
    ) AS time_of_date
    FROM sales; 
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
    CASE 
        WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);

-- day_name --

SELECT 
    date,
    DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);


-- month_name --
SELECT date,
MONTHNAME(date) AS month_name
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales 
SET month_name = MONTHNAME(date);

-- ------------------------------------------------------------------------------
-- ------------------------------- GENERIC --------------------------------------
-- How many unique cities does the data have?
SELECT DISTINCT(city)
FROM sales;
 
--In which city is each branch? --NOT UNDERSTOOD
SELECT DISTINCT city, branch
FROM sales;


------------------------------------------------------------------------------------
---------------------------------- PRODUCT -----------------------------------------
------------------------------------------------------------------------------------

-- How many unique poduct lines does the data have?
SELECT DISTINCT product_line
FROM sales;
SELECT COUNT(DISTINCT product_line)
FROM sales;

-- What is the most common payment method? -- getting the count of each payment method and then sorting it 
SELECT payment_method, COUNT(payment_method) AS cnt
FROM sales
GROUP BY payment_method
ORDER BY cnt DESC LIMIT 1;

-- What is the most selling product line?
SELECT product_line, COUNT(product_line) AS cnt
FROM sales
GROUP BY product_line
ORDER BY cnt DESC LIMIT 1;

-- What is the total revenue by month?
SELECT month_name AS Month,SUM(total) AS Monthly_Income
FROM sales
GROUP BY Month
ORDER BY Monthly_income DESC;

-- What month had the largest COGS?
SELECT month_name as month, SUM(cogs) AS cogs
FROM sales
GROUP BY month
ORDER BY cogs DESC ;

--What product line had the largest revenue?

SELECT product_line , SUM(total) AS total
FROM sales
GROUP BY product_line
ORDER BY total DESC ;

-- What is the city with the largest revenue?
SELECT branch, city, SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue DESC;

-- What product line had the largest VAT?
SELECT product_line, SUM(VAT) AS VAT
FROM sales
GROUP BY product_line
ORDER BY VAT DESC;

-- Fetch each product line and add a column to those product line showing "Good", "Bad".
-- Good if its greater than average sales

-- Which branch sold more products 
-- than average product sold?

SELECT branch, SUM(quantity) AS qty
FROM sales
GROUP BY branch
HAVING qty > (SELECT AVG(quantity) FROM sales);

-- What is the most common product line by gender?
SELECT gender, product_line, COUNT(gender) AS cnt
FROM sales
GROUP BY gender, product_line
ORDER BY cnt DESC;

-- What is the average rating of each product line?
SELECT product_line, ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;


-- -----------------------------------------------------------------------------------
-- --------------------------------------- Sales -------------------------------------
-- -----------------------------------------------------------------------------------

-- Number of sales made in each time of the day per weekday
SELECT COUNT(*) AS no_of_sales, time_of_day, day_name
FROM sales
GROUP BY time_of_day, day_name
ORDER BY no_of_sales DESC;

SELECT COUNT(*) AS no_of_sales, time_of_day, day_name
FROM sales
GROUP BY time_of_day, day_name
ORDER BY no_of_sales DESC;

SELECT COUNT(*) AS no_of_sales, time_of_day
FROM sales
WHERE day_name = "Monday" -- change day_name according to NEED 
GROUP BY time_of_day
ORDER BY no_of_sales DESC;

-- Which of the customer types brings the most revenue?
SELECT customer_type, SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue DESC;

-- Which city has the largest
-- tax percent/ VAT (Value Added Tax)?
SELECT city, AVG(VAT) AS VAT
FROM sales
GROUP by city
ORDER BY VAT DESC;

-- Which customer type pays the most in VAT?
SELECT customer_type, AVG(VAT) AS VAT
FROM sales
GROUP by customer_type
ORDER BY VAT DESC;

----------------------------------------------------------------------------------------
---------------------------------- Customer --------------------------------------------
----------------------------------------------------------------------------------------\

-- How many unique customer types does the data have?
SELECT DISTINCT(customer_type)
FROM sales;

-- How many unique payment methods does the data have?
SELECT DISTINCT(payment_method)
FROM sales;

-- What is the most common customer type?
SELECT customer_type, COUNT(*) AS customer_type_cnt
FROM sales
GROUP BY customer_type
ORDER BY customer_type_cnt DESC;

--Which customer type buys the most?
SELECT customer_type, COUNT(*)
FROM sales
GROUP BY customer_type;

--What is the gender of most of the customers?
SELECT gender, COUNT(*) AS gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC;

--What is the gender distribution per branch?
SELECT branch, gender, COUNT(gender) AS gender_cnt
FROM sales
GROUP BY branch, gender
ORDER BY branch ASC, gender_cnt DESC;

--Which time of the day do customers give most ratings?
SELECT AVG(rating) AS avg_rat, time_of_day
FROM sales
GROUP BY time_of_day
ORDER BY avg_rat DESC;

--Which time of the day do customers give most ratings per branch?
SELECT AVG(rating) AS avg_rat, time_of_day, branch
FROM sales
GROUP BY time_of_day, branch
ORDER BY avg_rat DESC, branch ASC;


--Which day fo the week has the best avg ratings?
SELECT AVG(rating) AS avg_rat, day_name
FROM sales
GROUP BY day_name
ORDER BY avg_rat DESC;

--Which day of the week has the best average ratings per branch?
SELECT AVG(rating) AS avg_rat, day_name, branch
FROM sales
GROUP BY day_name, branch
ORDER BY avg_rat DESC, branch ASC;