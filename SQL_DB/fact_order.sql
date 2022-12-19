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
