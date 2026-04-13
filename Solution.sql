/*
Name: Larissa Asendar
ID: 202310233
Course: DBMS
*/

--Q1 /A

 Select customer_id,COUNT(*) AS total_of_orders
 from Orders 
 group by customer_id;

--Q1 /B

select customer_id 
From Oreder
group by customer_id 
having count (order_id) >
  (select  avg (order_count)
   from (select count (order_id) AS order_count)
        from orders 
        group by customer_id )
    AS avg_table );

--Q1/C

create INDEX inx_orders-cutomer
on orders (customer_id);

--  Q1/D

START TRANSACTION ;
--INSERT ORDERS 
INSERT INTO orders (order_id , customer_id , order_date , total_amount)
VALUES (101 , 1 , '10-04-2026' , 250.00);
--INSERT ITEMS 
NSERT INTO orders_items (item_id , order_id , product_name , quantity , price)
VALUES ( 1 , 101 , 'laptop' , 1 , 250.00),
        ( 2 , 101 , 'keyboard' , 2 , 100.00);
--all good then 
COMMIT;
--THERES A PROBLEM THEN ROLLBACK 

--Q1/E

/*
What ACID prop are ?
     ACID stands for:
           1 . Atomicity: The operation either executes completely or not at all.
           2 . Consistency: Data remains accurate before and after the operation.
           3 . Isolation: Each transaction operates independently
           4 . Durability: After saving, data is not lost even in the event of a crash.
*/

--Q2 
 SELECT   qty , SUM(qty) OVER (ORDER BY qty) 
 AS cumulative_qty
 FROM demand;




