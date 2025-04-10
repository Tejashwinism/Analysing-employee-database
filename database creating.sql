CREATE DATABASE empDB;
use empDB;

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    HireDate DATE,
    JobTitle VARCHAR(50),
    Salary DECIMAL(10,2),
    DepartmentID INT,
    ManagerID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) UNIQUE,
    Location VARCHAR(100)
);

INSERT INTO Departments (DepartmentName, Location) VALUES 
('HR', 'New York'),
('IT', 'San Francisco'),
('Finance', 'Chicago');


INSERT INTO Employees (FirstName, LastName, Email, PhoneNumber, HireDate, JobTitle, Salary, DepartmentID, ManagerID)
VALUES
('John', 'Doe', 'johndoe@example.com', '1234567890', '2020-01-15', 'Software Engineer', 80000, 2, NULL),
('Jane', 'Smith', 'janesmith@example.com', '9876543210', '2019-03-10', 'HR Manager', 75000, 1, NULL),
('Alice', 'Johnson', 'alicejohnson@example.com', '4561237890', '2021-06-01', 'Financial Analyst', 70000, 3, NULL),
('Michael', 'Brown', 'michaelbrown@example.com', '3216549870', '2018-07-23', 'Software Engineer', 85000, 2, 1),
('Emily', 'Davis', 'emilydavis@example.com', '6549873210', '2017-11-19', 'Project Manager', 95000, 2, 1),
('Robert', 'Wilson', 'robertwilson@example.com', '7893214560', '2016-04-28', 'IT Support Specialist', 60000, 2, 1),
('Olivia', 'Martinez', 'oliviamartinez@example.com', '9632587410', '2020-09-15', 'HR Coordinator', 68000, 1, 2),
('William', 'Anderson', 'williamanderson@example.com', '1472583690', '2015-03-05', 'Finance Manager', 90000, 3, 3),
('Sophia', 'Thomas', 'sophiathomas@example.com', '3691472580', '2019-12-12', 'Software Engineer', 83000, 2, 1),
('James', 'Harris', 'jamesharris@example.com', '7418529630', '2021-02-20', 'Data Analyst', 72000, 3, 3),
('Isabella', 'White', 'isabellawhite@example.com', '8523697410', '2018-06-25', 'HR Assistant', 62000, 1, 2),
('Benjamin', 'Clark', 'benjaminclark@example.com', '9517538520', '2019-08-30', 'Network Administrator', 78000, 2, 1),
('Charlotte', 'Lewis', 'charlottelewis@example.com', '3571594862', '2022-01-10', 'Accountant', 69000, 3, 3);


