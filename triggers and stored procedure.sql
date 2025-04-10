# Trigger to prevent assigning the same employee to the same project more than once.
use empdb;

DELIMITER $$

CREATE TRIGGER prevent_duplicate_assignment
BEFORE INSERT ON EmployeeProjects
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM EmployeeProjects
        WHERE EmployeeID = NEW.EmployeeID AND ProjectID = NEW.ProjectID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate assignment: Employee already assigned to this project.';
    END IF;
END$$

DELIMITER ;

# stored procedure to view all employee-project assignments.

DELIMITER $$

CREATE PROCEDURE GetEmployeeProjectAssignments()
BEGIN
    SELECT EP.EmployeeProjectID, 
           E.FirstName, E.LastName, 
           P.ProjectName, 
           EP.AssignedDate, 
           EP.Role
    FROM EmployeeProjects EP
    INNER JOIN Employees E ON EP.EmployeeID = E.EmployeeID
    INNER JOIN Projects P ON EP.ProjectID = P.ProjectID
    ORDER BY EP.AssignedDate DESC;
END$$

DELIMITER ;
 
CALL GetEmployeeProjectAssignments();
