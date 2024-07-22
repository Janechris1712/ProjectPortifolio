SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT *
FROM SQLTutorial.dbo.EmployeeSalary

INSERT INTO SQLTutorial.dbo.EmployeeDemographics
 VALUES
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female'),
(1013, 'Darryl', 'Philbin', Null, 'Male')

INSERT INTO SQLTutorial.dbo.EmployeeSalary
 VALUES
 (1010, 'NULL', 470000),
 (Null, 'SalesMan',43000)

 CREATE TABLE WareHouseEmployeeDemographics
 (EmployeeID int, FirstName varchar(50),
 LastName varchar(50),
 Age int,
 Gender varchar(50)
 )

SELECT *
FROM WareHouseEmployeeDemographics

INSERT INTO WareHouseEmployeeDemographics
 VALUES
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female'),
(1013, 'Darryl', 'Philbin', Null, 'Male')

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION 
SELECT *
FROM WareHouseEmployeeDemographics

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM WareHouseEmployeeDemographics

SELECT EmployeeID, FirstName, Age
FROM SQLTutorial.dbo.EmployeeDemographics
UNION 
SELECT EmployeeID, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeSalary
ORDER BY EmployeeID

SELECT FirstName, Age
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is Not NULL

SELECT FirstName, Age
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is Not NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
WHEN Age > 30 THEN 'Old'
ELSE 'Young'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is Not NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
WHEN Age > 30 THEN 'Old'
WHEN Age BETWEEN 27 AND 30 THEN 'Young'
ELSE 'Baby'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is Not NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
WHEN Age > 30 THEN 'Old'
WHEN Age = 38 THEN 'Standlery'
ELSE 'Baby'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is Not NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
WHEN Age > 30 THEN 'Standlery'
WHEN Age = 38 THEN 'Old'
ELSE 'Baby'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is Not NULL
ORDER BY Age

SELECT FirstName, LastName, JobTitle,Salary
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN  SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT FirstName, LastName, JobTitle,Salary,
CASE
WHEN JobTitle ='SalesMan' THEN Salary + (Salary *.10)
WHEN JobTitle ='Accountant' THEN Salary + (Salary *.05)
WHEN JobTitle ='HR' THEN Salary + (Salary *.000001)
ELSE Salary +(Salary *.03)
END AS SalaryAfterRaise
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN  SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT JobTitle, COUNT(JobTitle)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN  SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle)>1

SELECT JobTitle, AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN  SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary)>45000
ORDER BY AVG(Salary)

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET LastName = 'Howard' 
WHERE EmployeeID = 1011 and  FirstName = 'Ryan'

SELECT*
FROM SQLTutorial.dbo.EmployeeDemographics

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID = NULL
WHERE FirstName = 'Hidetoshi' and LastName = 'Hasagawa'