CREATE TABLE Products(

Product_ID INT PRIMARY KEY,
Product_name VARCHAR(50),
Product_type VARCHAR(50),
Price INT
)

INSERT INTO Products
VALUES 
(1,'Widget A','Widget',10.00),
(2,'Widget B','Widget',15.00),
(3,'Gadget X','Gadget',20.00),
(4,'Gadget Y','Gadget',25.00),
(5,'Doohickey Z','Doohickey',30.00)

CREATE TABLE Customers(

Customer_ID INT PRIMARY KEY,
Customer_name VARCHAR(50),
Email VARCHAR(50),
Phone VARCHAR(50)
)


INSERT INTO Customers
VALUES
(1,'John Smith','john@example.com','123-456-7890'),
(2,'Jane Doe','jane.doe@example.com','987-654-3210'),
(3,'Alice Brown','alice.brown@example.com','456-789-0123')


CREATE TABLE Orders(
Order_ID INT PRIMARY KEY,
Customer_ID INT,
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
Order_Date DATE

)


INSERT INTO Orders
VALUES 
(101,1,'2024-05-01'),
(102,2,'2024-05-02'),
(103,3,'2024-05-01')

CREATE TABLE OrderDetails(
Order_Detail_ID INT PRIMARY KEY,
Order_ID INT,
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
Product_ID INT,
FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
Quantity INT
)


INSERT INTO Orderdetails
VALUES
(1,101,1,2),
(2,101,3,1),
(3,102,2,3),
(4,102,4,2),
(5,103,5,1)


CREATE TABLE ProductTypes(

Product_Type_ID INT PRIMARY KEY,
Product_Type_Name VARCHAR(50)

)

INSERT INTO ProductTypes
VALUES
(1,'Widget'),
(2,'Gadget'),
(3,'Doohickey')



--1.Retrieve all products.


SELECT * FROM Products

--2. Retrieve all customers.

SELECT * FROM Customers


--3.Retrieve all orders.

SELECT * FROM Orders

--4.Retrieve all order details.

SELECT * FROM Orderdetails

--5. Retrieve all product types.

SELECT * FROM ProductTypes

--6.Retrieve the names of the products that have been ordered by at least one customer,
--along with the total quantity of each product ordered.

SELECT product_name
FROM Products
INNER JOIN Orderdetails ON Products.product_id = Orderdetails.product_id
INNER JOIN Orders ON Orders.order_id = Orderdetails.order_id  
INNER JOIN Customers ON Customers.customer_id = Orders.customer_id 

--7.Retrieve the names of the customers who have placed an order on every day of the week, 
--along with the total number of orders placed by each customer

SELECT customer_name, Orders.order_date
FROM customers
INNER JOIN Orders ON Orders.customer_id = Customers.customer_id
INNER JOIN Orderdetails ON Orderdetails.order_id = Orders.order_id

--8. Retrieve the names of the customers who have placed the most orders,
--along with the total number of orders placed by each customer.

SELECT DISTINCT (customer_name) AS c,Orderdetails.quantity
FROM Customers
INNER JOIN Orders ON Orders.customer_id = Customers.customer_id
INNER JOIN Orderdetails ON Orderdetails.order_id = Orders.order_id
GROUP BY c,Orderdetails.quantity




--9.Retrieve the names of the products that have been ordered the most, 
--along with the total quantity of each product ordered.


SELECT product_name, Orderdetails.quantity
FROM Products
INNER JOIN Orderdetails ON Orderdetails.product_id = Products.product_id
ORDER BY Orderdetails.quantity DESC


--10.Retrieve the names of customers who have placed an order for at least one widget.

SELECT customer_name, Products.product_type
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
INNER JOIN Orderdetails ON Orderdetails.order_id = Orders.order_id
INNER JOIN Products ON Products.product_id = Orderdetails.product_id
WHERE Products.product_type = 'Widget'


--11. Retrieve the names of the customers who have placed an order for at least one widget and at least one gadget,
--along with the total cost of the widgets and gadgets ordered by each customer.

SELECT customer_name, Products.product_type, Products.price AS total_cost
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
INNER JOIN Orderdetails ON Orderdetails.order_id = Orders.order_id
INNER JOIN Products ON Products.product_id = Orderdetails.product_id
WHERE Products.product_type = 'Widget' OR Products.product_type = 'Gadget'


--12.Retrieve the names of the customers who have placed an order for at least one gadget,
--along with the total cost of the gadgets ordered by each customer.

SELECT customer_name, Products.product_type,Products.price AS total_cost
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
INNER JOIN Orderdetails ON Orderdetails.order_id = Orders.order_id
INNER JOIN Products ON Products.product_id = Orderdetails.product_id
WHERE Products.product_type = 'Gadget'

--13. Retrieve the names of the customers who have placed an order for at least one doohickey,
--along with the total cost of the doohickeys ordered by each customer.

SELECT customer_name, Products.product_type,Products.price AS total_cost
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
INNER JOIN Orderdetails ON Orderdetails.order_id = Orders.order_id
INNER JOIN Products ON Products.product_id = Orderdetails.product_id
WHERE Products.product_type = 'Doohickey'

--14.Retrieve the names of the customers who have placed an order every day of the week,
--along with the total number of orders placed by each customer

SELECT customer_name,Orders.order_date,Orderdetails.quantity
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id
INNER JOIN Orderdetails ON Orderdetails.order_id = Orders.order_id



--15. Retrieve the total number of widgets and gadgets ordered by each customer,
--along with the total cost of the orders.


SELECT COUNT(product_type),price
FROM Products
INNER JOIN Orderdetails ON Products.product_id = Orderdetails.product_id
INNER JOIN Orders ON Orders.order_id = Orderdetails.product_id
INNER JOIN Customers ON Customers.customer_id = Orders.customer_id
WHERE product_type = 'Widget' OR product_type = 'Gadgets'

