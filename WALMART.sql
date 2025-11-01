USE  walmart;
SHOW TABLES;
SELECT COUNT(*)
FROM walmart;

SELECT *
FROM walmart;

SELECT 
	 payment_method,
	 COUNT(payment_method) 
FROM walmart
GROUP BY payment_method ;

SELECT  COUNT(DISTINCT Branch) 
FROM walmart ;

SELECT MAX(quantity)
FROM walmart ;

SELECT MIN(quantity)
FROM walmart ;

-- BUISNESS PROBLEMS --
-- Q1 FIND DIFFERENT PAYMENT METHOD AND NUMBER OF TRANSACTIONS ,NUMBER OF QUANTITY SOLD .--

SELECT 
	payment_method,
    COUNT(payment_method),
    SUM(quantity) as quantity_sold
FROM walmart
GROUP BY payment_method 
ORDER BY quantity_sold DESC ;

-- Q2 IDENTIFY HIGHEST RATED CATEGORY IN EACH BRANCH , DISPLAYING THE BRANCH , CATEGORY , AVG RATING .--
WITH avg_ratings AS (
    SELECT 
        branch,
        category,
        AVG(rating) AS avg_rating
    FROM walmart
    GROUP BY branch, category
)
SELECT 
    branch,
    category,
    avg_rating
FROM avg_ratings a
WHERE avg_rating = (
    SELECT MAX(avg_rating)
    FROM avg_ratings b
    WHERE b.branch = a.branch
);

-- Q3 IDENTIFY BUSIEST DAY FOR EACH BRANCH BASED ON NUMBER OF TRANSACTIONS --
SELECT 
    branch,
    DAYNAME(STR_TO_DATE(date, '%d/%m/%y')) AS day_name,
    COUNT(*) AS no_of_transactions
FROM walmart
GROUP BY branch, day_name
ORDER BY branch ,no_of_transactions DESC ;
  
-- Q4 CALCUALATE TIOTAL QUANTITY OF ITEMS SOLD PER PAYMENTS METHOD AND TOTAL QUANTITY .--
SELECT 
	 payment_method,
	 COUNT(payment_method) 
FROM walmart
GROUP BY payment_method ; 

-- Q5 DETERMINE AVERAGE ,MINIMUM , MAXIMUM RATING OF PRODUCTS FOR EACH CITY .LIST THE CITY ,AVERAGE RATING ,MIN RATING AND MAX RATIMNG .--
SELECT 
	City ,
    category,
    AVG(rating) AS avg_rating,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating
FROM walmart 
GROUP BY City,category  

