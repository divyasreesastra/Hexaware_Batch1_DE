create database burger_bash
use burger_bash

CREATE TABLE customer_orders(
   order_id    INTEGER  NOT NULL 
  ,customer_id INTEGER  NOT NULL
  ,burger_id    INTEGER  NOT NULL
  ,exclusions  VARCHAR(4)
  ,extras      VARCHAR(4)
  ,order_time  datetime null
);
alter table customer_orders add constraint pkk1 primary key (order_id,burger_id)

CREATE TABLE burger_names(
   burger_id   INTEGER  NOT NULL PRIMARY KEY 
  ,burger_name VARCHAR(10) NOT NULL
);

CREATE TABLE burger_runner(
   runner_id   INTEGER  NOT NULL PRIMARY KEY 
  ,registration_date date NOT NULL
);

CREATE TABLE runner_orders(
   order_id     INTEGER  NOT NULL PRIMARY KEY 
  ,runner_id    INTEGER  NOT NULL
  ,pickup_time  datetime
  ,distance     VARCHAR(7)
  ,duration     VARCHAR(10)
  ,cancellation VARCHAR(23)
);

--alter table runner_orders add constraint fk1 foreign key (runner_id) references burger_runner(runner_id)
--INSERT INTO customer_orders VALUES (1,101,1,NULL,NULL,'2021-01-01 18:05:02');
--INSERT INTO customer_orders VALUES (2,101,1,NULL,NULL,'2021-01-01 19:00:52');
--INSERT INTO customer_orders VALUES (3,102,1,NULL,NULL,'2021-01-02 23:51:23');
--INSERT INTO customer_orders VALUES (3,102,2,NULL,NULL,'2021-01-02 23:51:23');
--INSERT INTO customer_orders VALUES (4,103,1,'4',NULL,'2021-01-04 13:23:46');
--INSERT INTO customer_orders VALUES (4,103,2,'4',NULL,'2021-01-04 13:23:46');
--INSERT INTO customer_orders VALUES (5,104,1,NULL,'1','2021-01-08 21:00:29');
--INSERT INTO customer_orders VALUES (6,101,2,NULL,NULL,'2021-01-08 21:03:13');
--INSERT INTO customer_orders VALUES (7,105,2,NULL,'1','2021-01-08 21:20:29');
--INSERT INTO customer_orders VALUES (8,102,1,NULL,NULL,'2021-01-09 23:54:33');
--INSERT INTO customer_orders VALUES (9,103,1,'4','1, 5','2021-01-10 11:22:59');
--INSERT INTO customer_orders VALUES (10,104,1,NULL,NULL,'2021-01-11 18:34:49');
--INSERT INTO customer_orders VALUES (10,104,2,'2, 6','1, 4','2021-01-11 18:34:49');



--INSERT INTO burger_names(burger_id,burger_name) VALUES (1,'Meatlovers');
--INSERT INTO burger_names(burger_id,burger_name) VALUES (2,'Vegetarian');


--INSERT INTO burger_runner VALUES (1,'2021-01-01');
--INSERT INTO burger_runner VALUES (2,'2021-01-03');
--INSERT INTO burger_runner VALUES (3,'2021-01-08');
--INSERT INTO burger_runner VALUES (4,'2021-01-15');



--INSERT INTO runner_orders VALUES (1,1,'2021-01-01 18:15:34','20km','32 minutes',NULL);
--INSERT INTO runner_orders VALUES (2,1,'2021-01-01 19:10:54','20km','27 minutes',NULL);
--INSERT INTO runner_orders VALUES (3,1,'2021-01-03 00:12:37','13.4km','20 mins',NULL);
--INSERT INTO runner_orders VALUES (4,2,'2021-01-04 13:53:03','23.4','40',NULL);
--INSERT INTO runner_orders VALUES (5,3,'2021-01-08 21:10:57','10','15',NULL);
--INSERT INTO runner_orders VALUES (6,3,NULL,NULL,NULL,'Restaurant Cancellation');
--INSERT INTO runner_orders VALUES (7,2,'2021-01-08 21:30:45','25km','25mins',NULL);
--INSERT INTO runner_orders VALUES (8,2,'2021-01-10 00:15:02','23.4 km','15 minute',NULL);
--INSERT INTO runner_orders VALUES (9,2,NULL,NULL,NULL,'Customer Cancellation');
--INSERT INTO runner_orders VALUES (10,1,'2021-01-11 18:50:20','10km','10minutes',NULL);

--1. Retrieve all customer orders along with burger names
SELECT c.order_id, c.customer_id, c.burger_id, b.burger_name, c.exclusions, c.extras, c.order_time
FROM customer_orders c
left JOIN burger_names b ON c.burger_id = b.burger_id;

--2. Find orders with runner details
SELECT c.order_id, c.customer_id, c.burger_id, r.runner_id, r.pickup_time, 
r.distance, r.duration,r.cancellation
FROM customer_orders c
inner JOIN runner_orders r ON c.order_id = r.order_id;

--3. Retrieve All Orders with Customer, Burger, and Runner Details
SELECT co.order_id, co.customer_id, bn.burger_name, ro.runner_id, ro.pickup_time, ro.distance, ro.duration, ro.cancellation
FROM customer_orders co
FULL OUTER JOIN runner_orders ro ON co.order_id = ro.order_id
FULL OUTER JOIN burger_names bn ON co.burger_id = bn.burger_id;

--4. Get Runner Orders with Longest Duration for Each Runner
SELECT ro.runner_id, ro.order_id, ro.duration
FROM runner_orders ro
WHERE ro.duration = (SELECT MAX(duration) FROM runner_orders WHERE runner_id = ro.runner_id);

--5.Total Orders and Revenue with Customer Subtotals and Grand Total
SELECT 
    co.customer_id,
    bn.burger_name,
    COUNT(co.order_id) AS total_orders,
    COUNT(co.order_id) * 10 AS total_revenue,
    GROUPING(co.customer_id) AS is_customer_total,
    GROUPING(bn.burger_name) AS is_burger_total
FROM customer_orders co
JOIN burger_names bn ON co.burger_id = bn.burger_id
GROUP BY ROLLUP(co.customer_id, bn.burger_name)
ORDER BY co.customer_id, bn.burger_name;

--6. Calculate the total number of orders each runner delivered
 
SELECT runner_id, COUNT(order_id) AS successful_deliveries
FROM runner_orders
WHERE cancellation IS NULL
GROUP BY runner_id
HAVING COUNT(order_id) > 2;

--7. Find Customers Who Have Ordered More Than One Type of Burger

SELECT customer_id, COUNT(DISTINCT burger_id) AS unique_burgers_ordered
FROM customer_orders
GROUP BY customer_id
HAVING COUNT(DISTINCT burger_id) > 1;