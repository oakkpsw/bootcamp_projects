-- find user 
SELECT customer_name,
       sum(amount*quantity) as total_pay
FROM   orders as o
LEFT JOIN customer as c
ON  o.customer_id = c.customer_id
LEFT JOIN product as p
ON  o.product_id = p.product_id
GROUP BY o.customer_id
ORDER BY sum(amount*quantity) DESC;

-- find where branch is most sale hamburger
SELECT 
  branch_name,
  sum(order_id) as sum_order
FROM   orders as o
LEFT JOIN branch as b
ON  o.branch_id = b.branch_id
WHERE o.product_id = 1
GROUP BY o.branch_id
ORDER BY sum(order_id) DESC;

-- find where brach have most order
SELECT 
  branch_name,
  sum(order_id) as sum_order
FROM   orders as o
LEFT JOIN branch as b
ON  o.branch_id = b.branch_id
GROUP BY o.branch_id
ORDER BY sum(order_id) DESC;

-- find most sale product

SELECT 
  product_name,
  sum(order_id) as sum_order
FROM   orders as o
LEFT JOIN product as p
ON  o.product_id = p.product_id
GROUP BY o.product_id 
ORDER BY sum(order_id) DESC;