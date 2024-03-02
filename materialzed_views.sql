-- Create a main query with an inline view
SELECT *
FROM (
    SELECT EmployeeID, FirstName, LastName, Salary
    FROM Employees
    WHERE DepartmentID = 1
) AS Department1Employees;


