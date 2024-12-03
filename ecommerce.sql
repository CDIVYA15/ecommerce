create database Ecommerce;
use  Ecommerce;
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address TEXT
);

CREATE TABLE Buyers (
    BuyerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address TEXT
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address TEXT
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PriceAtPurchase DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Suppliers (Name, Email, Phone, Address) VALUES
('Tech Supplies Co.', 'info@techsupplies.com', '1234567890', '123 Tech Street, NY'),
('Office Essentials Ltd.', 'contact@officeessentials.com', '9876543210', '456 Office Blvd, CA'),
('Gadget World', 'support@gadgetworld.com', '5554443333', '789 Tech Drive, TX'),
('Furniture Haven', 'sales@furniturehaven.com', '8887776666', '321 Furniture Lane, FL'),
('Smart Solutions', 'help@smartsolutions.com', '9998887777', '111 Smart Way, WA'),
('Tech Sphere', 'contact@techsphere.com', '6665554444', '222 Innovation Road, IL'),
('Eco Supplies', 'info@ecosupplies.com', '4443332222', '789 Green St, OR'),
('Office Supplies Hub', 'support@officesupplieshub.com', '2221110000', '567 Office Road, NJ'),
('Digital Depot', 'sales@digitaldepot.com', '1010101010', '123 Digital Blvd, NV'),
('Modern Tech', 'help@moderntech.com', '2020202020', '345 Future Ave, TX');

insert INTO Buyers (Name, Email, Phone, Address) VALUES
('Retailer A', 'retailerA@example.com', '1112223333', '789 Retail Lane, TX'),
('Retailer B', 'retailerB@example.com', '4445556666', '321 Retail Ave, FL'),
('Corporate Supplies', 'corp_supplies@example.com', '8887774444', '890 Corporate Blvd, NY'),
('Stationery World', 'stationery_world@example.com', '3332221111', '654 Stationery St, CA'),
('Office Pro', 'officepro@example.com', '5554443333', '123 Office Circle, OR'),
('E-Shop X', 'eshopx@example.com', '7776665555', '567 E-Shop Blvd, WA'),
('Home Office Supplies', 'homeoffice@example.com', '9998887777', '234 Home Office St, NV'),
('BizMart', 'bizmart@example.com', '1010101010', '890 Business Blvd, TX'),
('Tech Traders', 'techtraders@example.com', '2020202020', '321 Tech Park, NJ'),
('Global Supplies', 'globalsupplies@example.com', '3030303030', '456 Global Ave, FL');

INSERT INTO Products (Name, Description, Price, StockQuantity, SupplierID) VALUES
('Laptop', 'High-performance laptop', 1200.00, 50, 1),
('Printer', 'All-in-one printer', 200.00, 30, 2),
('Desk Chair', 'Ergonomic office chair', 150.00, 20, 4),
('Monitor', '27-inch 4K monitor', 350.00, 15, 1),
('Tablet', 'Portable touchscreen device', 400.00, 25, 3),
('Office Desk', 'Spacious wooden desk', 500.00, 10, 4),
('Keyboard', 'Mechanical keyboard', 75.00, 40, 1),
('Mouse', 'Wireless optical mouse', 25.00, 60, 2),
('Projector', 'HD Projector for presentations', 300.00, 12, 5),
('Desk Lamp', 'Adjustable LED desk lamp', 50.00, 35, 4);

INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('Alice Johnson', 'alice.johnson@example.com', '5551234567', '12 Elm Street, NY'),
('Bob Smith', 'bob.smith@example.com', '5559876543', '34 Oak Avenue, CA'),
('Charlie Brown', 'charlie.brown@example.com', '5554567890', '56 Maple Drive, TX'),
('Diana Prince', 'diana.prince@example.com', '5556541234', '78 Birch Blvd, FL'),
('Ethan Hunt', 'ethan.hunt@example.com', '5553216547', '90 Cedar Street, WA'),
('Fiona Carter', 'fiona.carter@example.com', '5557890123', '11 Pine Lane, OR'),
('George Miller', 'george.miller@example.com', '5551478523', '23 Redwood Ave, NV'),
('Hannah Lee', 'hannah.lee@example.com', '5559638527', '45 Cypress Road, TX'),
('Ian Wright', 'ian.wright@example.com', '5557531597', '67 Willow Way, NJ'),
('Julia Roberts', 'julia.roberts@example.com', '5559513574', '89 Palm Street, FL');

INSERT INTO Orders (OrderDate, CustomerID, TotalAmount) VALUES
('2024-12-01 10:30:00', 1, 1400.00),
('2024-12-01 15:45:00', 2, 200.00),
('2024-12-02 09:15:00', 3, 500.00),
('2024-12-02 12:00:00', 4, 750.00),
('2024-12-02 14:30:00', 5, 100.00),
('2024-12-03 08:45:00', 6, 600.00),
('2024-12-03 11:20:00', 7, 120.00),
('2024-12-03 16:10:00', 8, 800.00),
('2024-12-04 10:50:00', 9, 350.00),
('2024-12-04 15:35:00', 10, 250.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, PriceAtPurchase) VALUES
(1, 1, 1, 1200.00),
(1, 4, 2, 350.00),
(2, 2, 1, 200.00),
(3, 5, 1, 400.00),
(3, 6, 1, 500.00),
(4, 7, 2, 75.00),
(5, 9, 1, 300.00),
(6, 10, 4, 50.00),
(7, 8, 3, 25.00),
(8, 1, 1, 1200.00),
(9, 3, 2, 150.00),
(10, 4, 1, 350.00);

select * from Suppliers;
select * from Buyers;
select * from Products;
select * from Customers;
select * from Orders;
select * from OrderDetails;

select ProductID, Name, StockQuantity from products where StockQuantity < 10;

select sum(totalamount) AS TotalRevenue from orders;

select ProductID, Name, Price from Products order by Price desc Limit 1;

SELECT Orders.OrderID, Orders.OrderDate, Customers.Name AS CustomerName, Orders.TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT DISTINCT Customers.CustomerID, Customers.Name, Customers.Email
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT OrderDetails.OrderDetailID, Products.Name AS ProductName, OrderDetails.Quantity, OrderDetails.PriceAtPurchase
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE OrderDetails.OrderID = 1

SELECT Customers.Name AS CustomerName, COUNT(Orders.OrderID) AS TotalOrders
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.Name;

SELECT OrderID, OrderDate, CustomerID, TotalAmount
FROM Orders
WHERE TotalAmount > 500;




  




















