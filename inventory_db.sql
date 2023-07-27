use inventory_db;
CREATE TABLE items (
  item_id INT PRIMARY KEY,
  item_name VARCHAR(50),
  item_description VARCHAR(255),
  item_price DECIMAL(10,2),
  item_stock INT
);

CREATE TABLE supplier (
  supplier_id INT PRIMARY KEY,
  supplier_name VARCHAR(50),
  supplier_email VARCHAR(50),
  supplier_phone VARCHAR(20)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  order_status VARCHAR(20)
);

CREATE TABLE order_items (
  order_id INT,
  item_id INT,
  item_quantity INT,
  item_price DECIMAL(10,2)
  );
CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  customer_Firstname VARCHAR(50),
  customer_Lastname VARCHAR(50),
  customer_email VARCHAR(50),
  customer_city VARCHAR(15),
  customer_phone VARCHAR(20)
);

INSERT INTO items VALUES
  (1, 'Product A', 'Description of product A', 100.50, 100),
  (2, 'Product B', 'Description of product B', 20.00, 50),
  (3, 'Product C', 'Description of product C', 5.00, 200),
  (4, 'Product D', 'Description of product D', 15.99, 75),
  (5, 'Product E', 'Description of product E', 500.00, 200),
  (6, 'Product F', 'Description of product F', 150.99, 175),
  (7, 'Product G', 'Description of product G', 51.00, 100),
  (8, 'Product H', 'Description of product H', 105.99, 745),
  (9, 'Product I', 'Description of product I', 52.00, 280),
  (10, 'Product J', 'Description of product J', 115.99, 475);

INSERT INTO suppliers VALUES
  (1, 'Supplier A', 'supplier_a@example.com', '555-1234'),
  (2, 'Supplier B', 'supplier_b@example.com', '555-5678'),
  (3, 'Supplier C', 'supplier_C@example.com', '555-1238'),
  (4, 'Supplier D', 'supplier_D@example.com', '555-5648'),
  (5, 'Supplier E', 'supplier_E@example.com', '555-1534'),
  (6, 'Supplier F', 'supplier_F@example.com', '555-5278');

INSERT INTO customer VALUES
  (1, 'Sujal','Hasoriya', 'sujalhasoriya704@gmail.com','Nagpur', '9022346833'),
  (2, 'Sujal','Ganvir', 'sujal2507ganvir@gmail.com','Nagpur','8010574321');

INSERT INTO orders VALUES
  (1, 2, '2023-04-18', 'Shipped'),
  (2, 3, '2023-04-19', 'Pending'),
  (3, 4, '2023-04-20', 'Shipped'),
  (4, 5, '2023-04-21', 'Shipped'),
  (5, 8, '2023-04-22', 'Pending'),
  (6, 10, '2023-04-23', 'Shipped');
select * from items;
select * from suppliers;
select * from customer;
select * from orders;

CREATE TABLE sale (
id INT ,
product_id INT ,
quantity INT,
total_price DECIMAL(10,2),
sale_date DATE 
);
INSERT INTO sale VALUES
(1,12,100,120.5,'2023-04-20' ),
(2,5,10,250,'2023-04-21'),
(3,8,2,5402,'2023-04-22'),
(4,2,3,452,'2023-04-23');

SELECT * FROM sale;

-- after purchase 

UPDATE items 
SET item_stock = item_stock + 50
WHERE item_id = 3;
select * from items;
-- after sale 

UPDATE items
SET item_stock = item_stock - 5
WHERE item_id = 1;

select * from items;

-- total sale of a particular product

SELECT SUM(total_price * quantity) AS total_sales
FROM sale
WHERE product_id = 12;

-- total sale of a particular customer
SELECT SUM(total_price * quantity) AS total_sales
FROM sale
WHERE id = 2;
