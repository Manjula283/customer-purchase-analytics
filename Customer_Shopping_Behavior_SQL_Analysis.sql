-- ============================================================
-- CUSTOMER SHOPPING BEHAVIOR — END-TO-END SQL PORTFOLIO PROJECT
-- Dataset : customer_shopping_behavior.csv
-- Database: customer_behavior
-- Table   : customer
-- ============================================================


-- ============================================================
-- 1. SELECT DATABASE
-- ============================================================

USE customer_behavior;


-- ============================================================
-- 2. VERIFY TABLE
-- ============================================================

SHOW TABLES;


-- ============================================================
-- 3. CHECK TABLE STRUCTURE
-- ============================================================

DESCRIBE customer;


-- ============================================================
-- 4. VERIFY TOTAL RECORDS
-- ============================================================

SELECT COUNT(*) AS total_records
FROM customer;


-- ============================================================
-- 5. VIEW SAMPLE DATA
-- ============================================================

SELECT *
FROM customer
LIMIT 10;


-- ============================================================
-- 6. TOTAL REVENUE BY GENDER
-- ============================================================

CREATE OR REPLACE VIEW Revenue_By_Gender AS
SELECT
    gender,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY gender
ORDER BY total_revenue DESC;

SELECT *
FROM Revenue_By_Gender;


-- ============================================================
-- 7. CUSTOMERS WHO USED DISCOUNT BUT SPENT MORE THAN
--    THE OVERALL AVERAGE PURCHASE AMOUNT
-- ============================================================

CREATE OR REPLACE VIEW Discount_Customers_Above_Average AS
SELECT
    customer_id,
    gender,
    category,
    purchase_amount,
    discount_applied
FROM customer
WHERE discount_applied = 'Yes'
  AND purchase_amount > (
      SELECT AVG(purchase_amount)
      FROM customer
  )
ORDER BY purchase_amount DESC;

SELECT *
FROM Discount_Customers_Above_Average;


-- ============================================================
-- 8. AVERAGE PURCHASE AMOUNT BY CATEGORY
-- ============================================================

CREATE OR REPLACE VIEW Avg_Purchase_By_Category AS
SELECT
    category,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount
FROM customer
GROUP BY category
ORDER BY avg_purchase_amount DESC;

SELECT *
FROM Avg_Purchase_By_Category;


-- ============================================================
-- 9. TOTAL REVENUE BY CATEGORY
-- ============================================================

CREATE OR REPLACE VIEW Revenue_By_Category AS
SELECT
    category,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY category
ORDER BY total_revenue DESC;

SELECT *
FROM Revenue_By_Category;


-- ============================================================
-- 10. MOST POPULAR ITEMS
-- ============================================================

CREATE OR REPLACE VIEW Most_Popular_Items AS
SELECT
    item_purchased,
    COUNT(*) AS total_purchases
FROM customer
GROUP BY item_purchased
ORDER BY total_purchases DESC;

SELECT *
FROM Most_Popular_Items;


-- ============================================================
-- 11. TOP 5 ITEMS BY REVENUE
-- ============================================================

CREATE OR REPLACE VIEW Top_5_Items_By_Revenue AS
SELECT
    item_purchased,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY item_purchased
ORDER BY total_revenue DESC
LIMIT 5;

SELECT *
FROM Top_5_Items_By_Revenue;


-- ============================================================
-- 12. REVENUE BY SEASON
-- ============================================================

CREATE OR REPLACE VIEW Revenue_By_Season AS
SELECT
    season,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY season
ORDER BY total_revenue DESC;

SELECT *
FROM Revenue_By_Season;


-- ============================================================
-- 13. AVERAGE REVIEW RATING BY CATEGORY
-- ============================================================

CREATE OR REPLACE VIEW Avg_Rating_By_Category AS
SELECT
    category,
    ROUND(AVG(review_rating), 2) AS avg_review_rating
FROM customer
GROUP BY category
ORDER BY avg_review_rating DESC;

SELECT *
FROM Avg_Rating_By_Category;


-- ============================================================
-- 14. SUBSCRIPTION STATUS ANALYSIS
-- ============================================================

CREATE OR REPLACE VIEW Subscription_Analysis AS
SELECT
    subscription_status,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY subscription_status
ORDER BY total_revenue DESC;

SELECT *
FROM Subscription_Analysis;


-- ============================================================
-- 15. DISCOUNT VS NON-DISCOUNT CUSTOMERS
-- ============================================================

CREATE OR REPLACE VIEW Discount_Analysis AS
SELECT
    discount_applied,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY discount_applied
ORDER BY total_revenue DESC;

SELECT *
FROM Discount_Analysis;


-- ============================================================
-- 16. PROMO CODE USAGE ANALYSIS
-- ============================================================

CREATE OR REPLACE VIEW Promo_Code_Analysis AS
SELECT
    promo_code_used,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY promo_code_used
ORDER BY total_revenue DESC;

SELECT *
FROM Promo_Code_Analysis;


-- ============================================================
-- 17. REVENUE BY LOCATION
-- ============================================================

CREATE OR REPLACE VIEW Revenue_By_Location AS
SELECT
    location,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY location
ORDER BY total_revenue DESC;

SELECT *
FROM Revenue_By_Location;


-- ============================================================
-- 18. TOP 5 LOCATIONS BY REVENUE
-- ============================================================

CREATE OR REPLACE VIEW Top_5_Locations_By_Revenue AS
SELECT
    location,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 5;

SELECT *
FROM Top_5_Locations_By_Revenue;


-- ============================================================
-- 19. PURCHASES BY SHIPPING TYPE
-- ============================================================

CREATE OR REPLACE VIEW Shipping_Type_Analysis AS
SELECT
    shipping_type,
    COUNT(*) AS total_orders,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY shipping_type
ORDER BY total_orders DESC;

SELECT *
FROM Shipping_Type_Analysis;


-- ============================================================
-- 20. REVENUE BY CUSTOMER GENDER AND CATEGORY
-- ============================================================

CREATE OR REPLACE VIEW Revenue_By_Gender_Category AS
SELECT
    gender,
    category,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY gender, category
ORDER BY total_revenue DESC;

SELECT *
FROM Revenue_By_Gender_Category;


-- ============================================================
-- 21. AGE GROUP ANALYSIS
-- ============================================================

CREATE OR REPLACE VIEW Age_Group_Analysis AS
SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;

SELECT *
FROM Age_Group_Analysis;


-- ============================================================
-- 22. TOP 10 CUSTOMERS BY PURCHASE AMOUNT
-- ============================================================

CREATE OR REPLACE VIEW Top_10_Customers_By_Purchase AS
SELECT
    customer_id,
    age,
    gender,
    category,
    item_purchased,
    purchase_amount
FROM customer
ORDER BY purchase_amount DESC
LIMIT 10;

SELECT *
FROM Top_10_Customers_By_Purchase;


-- ============================================================
-- 23. CATEGORY WITH HIGHEST AVERAGE PURCHASE
-- ============================================================

CREATE OR REPLACE VIEW Highest_Average_Purchase_Category AS
SELECT
    category,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount
FROM customer
GROUP BY category
ORDER BY avg_purchase_amount DESC
LIMIT 1;

SELECT *
FROM Highest_Average_Purchase_Category;


-- ============================================================
-- 24. HIGHEST REVENUE-GENERATING SEASON
-- ============================================================

CREATE OR REPLACE VIEW Highest_Revenue_Season AS
SELECT
    season,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY season
ORDER BY total_revenue DESC
LIMIT 1;

SELECT *
FROM Highest_Revenue_Season;


-- ============================================================
-- 25. OVERALL BUSINESS SUMMARY
-- ============================================================

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount,
    ROUND(AVG(review_rating), 2) AS average_rating
FROM customer;


-- ============================================================
-- END OF CUSTOMER SHOPPING BEHAVIOR SQL PROJECT
-- ============================================================