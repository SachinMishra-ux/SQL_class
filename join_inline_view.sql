-- Create a main query with a JOIN and an inline view
SELECT Orders.OrderID, Orders.CustomerID, CustomerNames.CustomerName
FROM Orders
JOIN (
    SELECT CustomerID, CustomerName
    FROM Customers
    WHERE Country = 'USA'
) AS CustomerNames ON Orders.CustomerID = CustomerNames.CustomerID;

