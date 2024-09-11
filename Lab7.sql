create table EMP(
   EID INT,
   ENAME VARCHAR(25),
   DEPARTMENT VARCHAR(50),
   SALARY INT,
   JoiningDate DATE,
   City varchar(25)
);
insert into EMP (EID,ENAME,DEPARTMENT,SALARY,JoiningDate,CITY) VALUES
(101,'Rahul','admin',56000,'1990-jan-1','Rajkot'), 
(102,'Hardik','it',18000,'1990-sep-25','Ahmedabad'),
(103,'Bhavin','hr',25000,'1991-may-14','Baroda'),
(104,'Bhoomi','admin',39000,'1991-feb-8','Rajkot'),
(105,'Rohit','it',17000,'1990-jul-23','Jamnagar'),
(106,'Priya','it',9000,'1990-oct-18','Ahmedabad'),
(107,'Bhoomi','hr',34000,'1991-dec-25','Rajkot')

--Part – A:
--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
select MAX(SALARY) AS MAXIMUM,MIN(SALARY) AS MINIMUM FROM EMP
--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively.
SELECT SUM(SALARY) AS TOTAL_SAL,AVG(SALARY) AS AVERAGE_SAL FROM EMP
--3. Find total number of employees of EMPLOYEE table.
SELECT COUNT(EID) AS TOTAL_EMP FROM EMP
--4. Find highest salary from Rajkot city.
SELECT MAX(SALARY) FROM EMP WHERE CITY = 'RAJKOT'
--5. Give maximum salary from IT department.
SELECT MAX(SALARY) FROM EMP WHERE DEPARTMENT = 'IT'
--6. Count employee whose joining date is after 8-feb-91.
SELECT COUNT(EID) FROM EMP WHERE JoiningDate > '1991-FEB-8'
--7. Display average salary of Admin department.
SELECT AVG(SALARY) FROM EMP WHERE DEPARTMENT = 'ADMIN'
--8. Display total salary of HR department.
SELECT SUM(SALARY) FROM EMP WHERE DEPARTMENT = 'HR'
--9. Count total number of cities of employee without duplication.
SELECT COUNT(DISTINCT CITY) FROM EMP
--10. Count unique departments.
SELECT COUNT(DISTINCT DEPARTMENT) FROM EMP
--11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(SALARY) FROM EMP WHERE CITY = 'AHMEDABAD'
--12. Find city wise highest salary.
SELECT CITY,MAX(SALARY) FROM EMP GROUP BY CITY
--13. Find department wise lowest salary.
SELECT DEPARTMENT,MIN(SALARY) FROM EMP GROUP BY DEPARTMENT
--14. Display city with the total number of employees belonging to each city.
SELECT CITY,COUNT(EID) FROM EMP GROUP BY CITY
--15. Give total salary of each department of EMP table.
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SAL FROM EMP GROUP BY DEPARTMENT
--16. Give average salary of each department of EMP table without displaying the respective department name.
SELECT AVG(SALARY) AS AVG_SAL FROM EMP GROUP BY DEPARTMENT

--Part – B:
--1. Count the number of employees living in Rajkot.
SELECT COUNT(EID) FROM EMP WHERE CITY = 'RAJKOT'
--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(SALARY)-MIN(SALARY) AS DIFFERENCE FROM EMP 
--3. Display the total number of employees hired before 1st January, 1991.
SELECT COUNT(EID) FROM EMP WHERE JoiningDate > '1991-JAN-1'

--Part – C:
--1. Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(EID) FROM EMP WHERE CITY = 'RAJKOT' OR CITY = 'BARODA'
--2. Display the total number of employees hired before 1st January, 1991 in IT department.
SELECT COUNT(EID) FROM EMP WHERE JoiningDate<'1991-JAN-1' AND DEPARTMENT = 'IT'
--3. Find the Joining Date wise Total Salaries.
SELECT  JoiningDate,SUM(SALARY) FROM EMP GROUP BY JoiningDate
--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT DEPARTMENT,CITY,MAX(SALARY) FROM EMP WHERE CITY LIKE 'R%' GROUP BY DEPARTMENT,CITY
