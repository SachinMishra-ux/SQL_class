-- Create another table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert data into the Department table
INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

-- Perform an inner join on Employee and Department tables
SELECT Employee1.EmployeeID, Employee1.FirstName, Employee1.LastName, Employee1.Salary, Department.DepartmentName
FROM Employee1
INNER JOIN Department ON Employee1.EmployeeID = Department.DepartmentID;

-- Create a view based on the result of the join
CREATE VIEW EmployeeDepartmentView AS
SELECT Employee1.EmployeeID, Employee1.FirstName, Employee1.LastName, Employee1.Salary, Department.DepartmentName
FROM Employee1
INNER JOIN Department ON Employee1.EmployeeID = Department.DepartmentID;
