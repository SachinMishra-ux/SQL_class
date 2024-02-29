-- Create a table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

-- Insert data into the Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 101, '2022-01-01', 100.50),
    (2, 102, '2022-02-01', 150.75),
    (3, 103, '2022-03-01', 200.00);

-- Create a materialized view
CREATE MATERIALIZED VIEW TotalSalesByCustomer AS
SELECT CustomerID, SUM(TotalAmount) AS TotalSales
FROM Orders
GROUP BY CustomerID;

-- Create a table with the same result as a materialized view
CREATE TABLE TotalSalesByCustomer AS
SELECT CustomerID, SUM(TotalAmount) AS TotalSales
FROM Orders
GROUP BY CustomerID;


-- Query the materialized view
SELECT * FROM TotalSalesByCustomer;


