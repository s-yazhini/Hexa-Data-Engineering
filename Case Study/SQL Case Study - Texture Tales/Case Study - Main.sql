--CASE STUDY BY : Yazhini

--QUE 1 What was the total quantity sold for all products?
SELECT p.product_name, SUM(s.qty) AS sale_counts
FROM sales AS s
INNER JOIN product_details AS p
ON s.prod_id = p.product_id
GROUP BY p.product_name
ORDER BY SUM(s.qty) DESC;

--2. What is the total generated revenue for all products before discounts?
SELECT SUM(qty * price) AS total_revenue_before_discount
FROM sales;

--3. What was the total discount amount for all products?
SELECT SUM(qty * price * (discount / 100.0)) AS total_discount_amount
FROM sales;

--4. How many unique transactions were there?
SELECT COUNT(DISTINCT txn_id) AS unique_transactions
FROM sales;

--5. What are the average unique products purchased in each transaction?
SELECT AVG(product_count) AS avg_unique_products_per_transaction
FROM (
    SELECT txn_id, COUNT(DISTINCT prod_id) AS product_count
    FROM sales
    GROUP BY txn_id
) AS transaction_products;

--6. What is the average discount value per transaction?
SELECT AVG(total_discount) AS avg_discount_per_transaction
FROM (
    SELECT txn_id, SUM(qty * price * (discount / 100.0)) AS total_discount
    FROM sales
    GROUP BY txn_id
) AS discounts_per_transaction;

--7.What is the average revenue for member transactions and non- member transactions?
WITH cte_member_revenue AS (
    SELECT member, txn_id, SUM(price * qty) AS revenue
    FROM sales
    GROUP BY member, txn_id
)
SELECT member, AVG(revenue) AS avg_revenue
FROM cte_member_revenue
GROUP BY member;

--8. What are the top 3 products by total revenue before discount?
SELECT TOP 3 pd.product_name,
       SUM(s.qty * s.price) AS total_revenue
FROM sales s
JOIN product_details pd ON s.prod_id = pd.product_id
GROUP BY pd.product_name
ORDER BY total_revenue DESC;

--9. What are the total quantity, revenue and discount for each segment?
SELECT pd.segment_name,
       SUM(s.qty) AS total_quantity,
       SUM(s.qty * s.price) AS total_revenue,
       SUM(s.qty * s.price * (s.discount / 100.0)) AS total_discount
FROM sales s
JOIN product_details pd ON s.prod_id = pd.product_id
GROUP BY pd.segment_name;

--10.What is the top selling product for each segment?
SELECT TOP 3 pd.segment_name, 
       pd.product_name,
       SUM(s.qty) AS total_quantity
FROM sales s
JOIN product_details pd ON s.prod_id = pd.product_id
GROUP BY pd.segment_name, pd.product_name
ORDER BY  total_quantity DESC;

--11. What are the total quantity, revenue and discount for each category?
SELECT pd.category_name,
       SUM(s.qty) AS total_quantity,
       SUM(s.qty * s.price) AS total_revenue,
       SUM(s.qty * s.price * (s.discount / 100.0)) AS total_discount
FROM sales s
JOIN product_details pd ON s.prod_id = pd.product_id
GROUP BY pd.category_name;

--12. What is the top selling product for each category?
SELECT TOP 5 pd.category_name, 
       pd.product_name,
       SUM(s.qty) AS total_quantity
FROM sales s
JOIN product_details pd ON s.prod_id = pd.product_id
GROUP BY pd.category_name, pd.product_name
ORDER BY total_quantity DESC;
