-- Restaurant Owner
-- 5 Tables
-- 1 Fact , 4 dimension
--  google how to add foreign key
-- write sql 3 quries analyze data
-- 1 x subquery/with

-- create and insert data
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_location TEXT
);

insert into branch values
  (1,'siam paragon'),
  (2,'central world'),
  (3,'central ladprao');

CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  customer_name TEXT
);

insert into customer values
  (1,'John'),
  (2,'Harry'),
  (3,'David');

CREATE TABLE pay (
  pay_id INT PRIMARY KEY,
  pay_type TEXT
);


insert into pay values
  (1,'Credit'),
  (2,'Cash'),
  (3,'Bank Transfer');

CREATE TABLE product (
  product_id INT PRIMARY KEY,
  product_name TEXT ,
  amount REAL
);

insert into product values
  (1,'hamburger',30),
  (2,'french fries',10),
  (3,'sausage',15),
  (4,'salad',15);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  pay_id INT,
  branch_id INT,
  product_id INT,
  order_date TEXT,
  quantity INT,
  CONSTRAINT fk_customer
    FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id),
  CONSTRAINT fk_pay
    FOREIGN KEY (pay_id)
    REFERENCES pay(pay_id),
  CONSTRAINT fk_product
    FOREIGN KEY (product_id)
    REFERENCES product(product_id),
  CONSTRAINT fk_branch
    FOREIGN KEY (branch_id)
    REFERENCES branch(branch_id)
);


insert into orders values
  (1,2,1,1,2,'2022-08-01',2),
  (2,3,3,2,3,'2022-08-01',1),
  (3,1,1,1,2,'2022-08-02',1),
  (4,2,3,1,4,'2022-08-02',3),
  (5,1,2,3,1,'2022-08-03',4),
  (6,3,2,3,1,'2022-08-04',5),
  (7,1,1,3,2,'2022-08-04',1),
  (8,2,1,1,2,'2022-08-05',2),
  (9,3,3,2,3,'2022-08-05',4),
  (10,1,2,3,3,'2022-08-05',2);

.mode markdown
.header on
select * from orders;
-- analyst data

WITH ham_french AS (
  SELECT  *
  FROM product
  WHERE  product_id IN ('1','2')
)

select * from ham_french;

-- find user that most pay
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
  branch_location,
  count(order_id) as count_order
FROM   orders as o
LEFT JOIN branch as b
ON  o.branch_id = b.branch_id
WHERE o.product_id = 1
GROUP BY o.branch_id
ORDER BY count(order_id) DESC;

-- find where brach have most order
SELECT 
  branch_location,
  count(order_id) as count_order
FROM   orders as o
LEFT JOIN branch as b
ON  o.branch_id = b.branch_id
GROUP BY o.branch_id
ORDER BY count(order_id) DESC;

-- find most sale product

SELECT 
  product_name,
  count(order_id) as count_order
FROM   orders as o
LEFT JOIN product as p
ON  o.product_id = p.product_id
GROUP BY o.product_id 
ORDER BY count(order_id) DESC;