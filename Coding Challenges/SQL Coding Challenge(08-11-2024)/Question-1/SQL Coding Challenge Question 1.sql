--Query 1
SELECT p.product_name, SUM(s.qty * s.price) AS total_sales
FROM sales s
JOIN product_details p ON s.prod_id = p.product_id
GROUP BY p.product_name;

--Query 2
SELECT txn_id, 
       SUM(qty * price * (1 - discount / 100.0)) AS discounted_total
FROM sales
GROUP BY txn_id;

--Query 3
SELECT pd.segment_name, 
       SUM(s.qty * s.price) AS segment_sales
FROM sales s
JOIN product_details pd ON s.prod_id = pd.product_id
GROUP BY pd.segment_name;

--Query 4
SELECT ph.level_name, 
       SUM(pp.price) AS total_price
FROM product_prices pp
JOIN product_details pd ON pp.product_id = pd.product_id
JOIN product_hierarchy ph ON pd.category_id = ph.id
GROUP BY ph.level_name;

--Query 5
SELECT pd.segment_name,
       pd.category_name,
       SUM(s.qty * s.price) AS total_sales,
       SUM(s.qty * s.price * (1 - s.discount / 100.0)) AS total_discounted_sales
FROM sales s
JOIN product_details pd ON s.prod_id = pd.product_id
GROUP BY pd.segment_name, pd.category_name
ORDER BY pd.segment_name, pd.category_name;


