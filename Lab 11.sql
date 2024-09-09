CREATE TABLE Stu_Info (
    Rno INT ,
    Name VARCHAR(50),
    Branch VARCHAR(50)
);

INSERT INTO Stu_Info (Rno, Name, Branch)
VALUES 
    (101, 'Raju', 'CE'),
    (102, 'Amit', 'CE'),
    (103, 'Sanjay', 'ME'),
    (104, 'Neha', 'EC'),
    (105, 'Meera', 'EE'),
    (106, 'Mahesh', 'ME');

CREATE TABLE Result (
	RNO INT,
    SPI DECIMAL(4, 2),
	);

INSERT INTO Result (Rno, SPI)
VALUES 
    (101, 8.8),
    (102, 9.2),
    (103, 7.6),
    (104, 8.2),
    (105, 7.0),
    (107, 8.9);  

CREATE TABLE EMPLOYEE_MASTER (
    EmployeeNo VARCHAR(50) ,
    Name VARCHAR(50),
    ManagerNo VARCHAR(50)
);

INSERT INTO EMPLOYEE_MASTER(EmployeeNo, Name, ManagerNo)
VALUES 
    ('E01', 'Tarun', NULL),
    ('E02', 'Rohan', 'E02'),
    ('E03', 'Priya', 'E01'),
    ('E04', 'Milan', 'E03'),
    ('E05', 'Jay', 'E01'),
    ('E06', 'Anjana', 'E04');

--Part – A:
--1. Combine information from student and result table using cross join or Cartesian product.
SELECT * 
FROM Stu_Info CROSS JOIN Result 

--2. Perform inner join on Student and Result tables.
SELECT * 
FROM Stu_Info JOIN Result 
ON 
Stu_Info.RNO = Result.RNO

--3. Perform the left outer join on Student and Result tables.
SELECT * 
FROM Stu_Info LEFT JOIN Result 
ON 
Stu_Info.RNO = Result.RNO

--4. Perform the right outer join on Student and Result tables.
SELECT * 
FROM Stu_Info RIGHT JOIN Result 
ON 
Stu_Info.RNO = Result.RNO

--5. Perform the full outer join on Student and Result tables.
SELECT * 
FROM Stu_Info FULL OUTER JOIN Result 
ON 
Stu_Info.RNO = Result.RNO

--6. Display Rno, Name, Branch and SPI of all students.
SELECT Stu_Info.RNO,Stu_Info.NAME,Stu_Info.BRANCH, Result.SPI
FROM Stu_Info LEFT JOIN RESULT
ON Stu_Info.RNO = Result.RNO

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
SELECT Stu_Info.RNO, Stu_Info.NAME, Stu_Info.BRANCH, Result.SPI
FROM Stu_Info JOIN Result 
ON 
Stu_Info.RNO = Result.RNO
WHERE Stu_Info.BRANCH = 'CE'

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
SELECT Stu_Info.RNO, Stu_Info.NAME, Stu_Info.BRANCH, Result.SPI
FROM Stu_Info LEFT JOIN Result 
ON 
Stu_Info.RNO = Result.RNO
WHERE Stu_Info.BRANCH <> 'CE'

--9. Display average result of each branch.
SELECT Stu_Info.BRANCH, AVG(Result.SPI) AS AVG_SPI
FROM Stu_Info LEFT JOIN Result 
ON 
Stu_Info.RNO = Result.RNO
GROUP BY Stu_Info.BRANCH

--10. Display average result of CE and ME branch.
SELECT Stu_Info.BRANCH,AVG(Result.SPI)
FROM Stu_Info LEFT JOIN Result 
ON 
Stu_Info.RNO = Result.RNO
GROUP BY Stu_Info.BRANCH
HAVING Stu_Info.BRANCH IN ('CE','ME')


--Part – B:
--1. Display average result of each branch and sort them in ascending order by SPI.
SELECT Stu_Info.BRANCH, AVG(Result.SPI) AS AVG_SPI
FROM Stu_Info LEFT JOIN Result 
ON 
Stu_Info.RNO = Result.RNO
GROUP BY Stu_Info.BRANCH
ORDER BY AVG(Result.SPI)

--2. Display highest SPI from each branch and sort them in descending order.
SELECT Stu_Info.BRANCH, MAX(Result.SPI) 
FROM Stu_Info LEFT JOIN Result 
ON 
Stu_Info.RNO = Result.RNO
GROUP BY Stu_Info.BRANCH
ORDER BY AVG(Result.SPI) DESC

--Part – C:
--1. Retrieve the names of employee along with their manager’s name from the Employee table.
SELECT a.name as Employee,b.name as Manager
from EMPLOYEE_MASTER a , EMPLOYEE_MASTER b
where a.ManagerNo = b.EmployeeNo
