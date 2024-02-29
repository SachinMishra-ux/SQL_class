SELECT * FROM testdb.employee;

-- Create a table
CREATE TABLE Employee1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert data into the table
INSERT INTO Employee1 (EmployeeID, FirstName, LastName, Salary)
VALUES
    (1, 'John', 'Doe', 50000.00),
    (2, 'Jane', 'Smith', 60000.00),
    (3, 'Bob', 'Johnson', 75000.00);

-- Create a view based on the table
CREATE VIEW EmployeeView_Salary AS
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employee1
WHERE Salary > 60000.00;
