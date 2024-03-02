-- basic example

WITH TotalSalesByCustomer AS (
    SELECT CustomerID, SUM(TotalAmount) AS TotalSales
    FROM Orders
    GROUP BY CustomerID
)
SELECT *
FROM TotalSalesByCustomer;

-- advance example

WITH
  CTE1 AS (
    SELECT EmployeeID, FirstName, LastName
    FROM Employees
    WHERE DepartmentID = 1
  ),
  CTE2 AS (
    SELECT OrderID, CustomerID, TotalAmount
    FROM Orders
    WHERE OrderDate >= '2022-01-01'
  )
-- Main query using the CTEs
SELECT CTE1.EmployeeID, CTE1.FirstName, CTE1.LastName, CTE2.OrderID, CTE2.CustomerID, CTE2.TotalAmount
FROM CTE1
JOIN CTE2 ON CTE1.EmployeeID = CTE2.OrderID;

