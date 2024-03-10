use akash;
-- Question 4
CREATE TABLE Emp_ld (
    Emp_id INT PRIMARY KEY,
    Emp_name VARCHAR(25),
    Salary INT,
    Manager_Id INT
);


INSERT INTO Emp_ld (Emp_id, Emp_name, Salary, Manager_Id) VALUES 
(10, 'Anil', 50000, 18),
(11, 'Vikas', 75000, 16),
(12, 'Nisha', 40000, 18),
(13, 'Nidhi', 60000, 17),
(14, 'Priya', 80000, 18),
(15, 'Mohit', 45000, 18),
(16, 'Rajesh', 90000, null),
(17, 'Raman', 55000, 16),
(18, 'Santosh', 65000, 17);

with tab1 as (
SELECT  Manager_Id, Manager, AVG(Salary) AS Average_Salary_Under_Manager
FROM (SELECT  e.Manager_Id,e.Emp_name AS Manager, COALESCE(sub.Salary, 0) AS Salary FROM Emp_ld e
    LEFT JOIN 
	(SELECT Manager_Id, AVG(Salary) AS Salary FROM Emp_ld WHERE Manager_Id IS NOT NULL GROUP BY Manager_Id) sub
    ON e.Emp_id = sub.Manager_Id ) AS managers_and_salaries
GROUP BY Manager_Id, Manager ORDER BY Manager_Id)
select Manager,Average_Salary_Under_Manager from tab1 where Average_Salary_Under_Manager>0;

