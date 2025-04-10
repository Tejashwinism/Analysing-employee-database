# Find Employees Who Earn More Than the Average Salary
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);


# Find Employees in the Same Department as ‘John Doe’
SELECT FirstName, LastName, DepartmentID
FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Employees WHERE FirstName = 'John' AND LastName = 'Doe');


# Find Departments with More Than 3 Employees
SELECT DepartmentName
FROM Departments
WHERE DepartmentID IN (
    SELECT DepartmentID
    FROM Employees
    GROUP BY DepartmentID
    HAVING COUNT(*) > 3
);


# Find the Highest Paid Employee in Each Department
SELECT FirstName, LastName, Salary, DepartmentID
FROM Employees
WHERE (DepartmentID, Salary) IN (
    SELECT DepartmentID, MAX(Salary)
    FROM Employees
    GROUP BY DepartmentID
);


#  Find Employees Who Earn More Than Their Department’s Average Salary
SELECT FirstName, LastName, Salary, DepartmentID
FROM Employees E
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = E.DepartmentID
);


# Find Employees Who Are Not Managers
SELECT FirstName, LastName
FROM Employees
WHERE EmployeeID NOT IN (SELECT DISTINCT ManagerID FROM Employees WHERE ManagerID IS NOT NULL);


# Find Employees Who Have the Same Salary as at Least One Other Employee
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary IN (
    SELECT Salary
    FROM Employees
    GROUP BY Salary
    HAVING COUNT(*) > 1
);


#  Find Employees Who Work in the IT Department
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID = (
    SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT'
);


# Find Employees Hired Before the Oldest IT Employee
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE HireDate < (
    SELECT MIN(HireDate)
    FROM Employees
    WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'IT')
);


#  Find the Second Highest Salary in the Company
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);


# Retrieve Employees with Their Department Names
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;


# Find Employees with Their Manager’s Name
SELECT E.FirstName AS Employee, E.LastName, M.FirstName AS Manager, M.LastName AS ManagerLastName
FROM Employees E
INNER JOIN Employees M ON E.ManagerID = M.EmployeeID;


# Retrieve Employees and Their Salaries from Departments Located in ‘New York’
SELECT E.FirstName, E.LastName, E.Salary, D.DepartmentName, D.Location
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.Location = 'New York';


# Find Employees Who Have a Job Title of ‘Software Engineer’
SELECT E.FirstName, E.LastName, E.JobTitle, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.JobTitle = 'Software Engineer';


# List All Employees Who Work Under ‘Jane Smith’
SELECT E.FirstName, E.LastName, M.FirstName AS Manager, M.LastName AS ManagerLastName
FROM Employees E
INNER JOIN Employees M ON E.ManagerID = M.EmployeeID
WHERE M.FirstName = 'Jane' AND M.LastName = 'Smith';


# Retrieve Employees and Their Departments, Excluding Employees Without a Department
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;


# Find Employees Who Work in IT or Finance Departments
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName IN ('IT', 'Finance');


# Retrieve Employees and Their Department Along with Their Manager’s Name
SELECT E.FirstName AS Employee, E.LastName, D.DepartmentName, M.FirstName AS Manager, M.LastName AS ManagerLastName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
INNER JOIN Employees M ON E.ManagerID = M.EmployeeID;


# Find the Total Salary Paid for Each Department
SELECT D.DepartmentName, SUM(E.Salary) AS TotalSalary
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;



