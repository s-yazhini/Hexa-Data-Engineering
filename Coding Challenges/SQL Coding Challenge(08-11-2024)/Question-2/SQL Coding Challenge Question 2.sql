-- query 1:
SELECT pd.category_name, 
       SUM(s.qty * s.price) AS total_sales
FROM sales s
JOIN product_details pd ON s.prod_id = pd.product_id
GROUP BY pd.category_name
HAVING SUM(s.qty * s.price) > 10000;


--query 2:
SELECT member, 
       COUNT(txn_id) AS transaction_count
FROM sales
GROUP BY member
HAVING COUNT(txn_id) > 5;
