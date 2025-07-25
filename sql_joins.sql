CREATE DATABASE sql_joins

USE sql_joins

SELECT * FROM customers

SELECT * FROM orders

SELECT * FROM products

-- 1.	Retrieve all customers and their corresponding orders. If a customer has no orders, still include them. (Full Outer Join/ LEFT JOIN)
SELECT 
    *
FROM
    customers c
       LEFT JOIN
    orders o ON c.CustomerID = o.CustomerID


-- 2.	Get a list of all orders along with customer details. (LEFT JOIN)
SELECT 
    *
FROM
    orders o
       LEFT JOIN
    customers c ON o.CustomerID = c.CustomerID


-- 3.	Find all products that have never been ordered. (LEFT / RIGHT)
SELECT 
    *
FROM
    products p
       LEFT JOIN
    orders o ON p.ProductID = o.ProductID
WHERE o.OrderID IS NULL


-- 4.	Retrieve all customers who have placed at least one order.
SELECT 
    DISTINCT c.CustomerID,c.CustomerName
FROM
    customers c
       LEFT JOIN
    orders o ON c.CustomerID = o.CustomerID


-- 5.	List all orders along with the product details.
SELECT 
    *
FROM
    orders o
       LEFT JOIN
    products p ON p.ProductID = o.ProductID


-- 6.	Find all orders placed in "New York" along with customer details.

SELECT 
    *
FROM
    customers c
       RIGHT JOIN
    orders o ON c.CustomerID = o.CustomerID
WHERE c.City = "New York"

-- 7.	Get a list of customers who have never placed an order.
SELECT 
    *
FROM
    customers c
       Left JOIN
    orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL


-- 8.	Retrieve all product categories along with the products that belong to them.
SELECT 
    ProductName, Category
FROM
    products

-- 9.	Find the total amount spent by each customer (include customers who haven't spent anything).
SELECT 
    c.CustomerID,c.CustomerName , sum(o.TotalAmount) as TotalSpent
FROM
    customers c
       LEFT JOIN
    orders o ON c.CustomerID = o.CustomerID
group by c.CustomerID,c.CustomerName 

-- 10.	Retrieve all orders along with the respective customer's city.
SELECT 
    o.OrderID,c.City
FROM
    customers c
       INNER JOIN
    orders o ON c.CustomerID = o.CustomerID

-- 11.	List all customers who have purchased products from the "Electronics" category.

SELECT 
   c.CustomerID,  c.CustomerName, p.ProductName, p.Category
FROM
    customers c
	JOIN
    orders o ON c.CustomerID = o.CustomerID
    JOIN
    products p ON p.productID = o.productID
WHERE p.Category = "Electronics"


-- 12.	Find customers who have made purchases of more than $500 in a single order.
SELECT 
    c.CustomerID,c.CustomerName, o.TotalAmount
FROM
    customers c
       LEFT JOIN
    orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > 500


-- 13.	Retrieve all customers and the total quantity of products they have purchased.
SELECT 
    c.CustomerID,c.CustomerName , sum(o.Quantity) as TotalQuantity
FROM
    customers c
       LEFT JOIN
    orders o ON c.CustomerID = o.CustomerID
group by c.CustomerID,c.CustomerName 


-- 14.	Get a list of all products and the number of times each has been ordered.
SELECT p.ProductID, p.ProductName,
       COUNT(o.OrderID) AS TimesOrdered
FROM Products p
LEFT JOIN orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName;


-- 15.	Retrieve the most expensive order placed along with customer details.
SELECT 
   o.OrderId, c.CustomerID,c.CustomerName , sum(o.TotalAmount) as TotalSpent
FROM
    customers c
       LEFT JOIN
    orders o ON c.CustomerID = o.CustomerID
group by o.OrderId, c.CustomerID,c.CustomerName
Order by TotalSpent DESC
LIMIT 1