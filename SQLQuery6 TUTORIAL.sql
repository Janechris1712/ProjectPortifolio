SELECT TOP (1000) [EmployeeID]
      ,[JobTitle]
      ,[Salary]
  FROM [SQL Tutorial].[dbo].[EmployeeSalary]

  SELECT AVG(Salary)
  FROM EmployeeSalary