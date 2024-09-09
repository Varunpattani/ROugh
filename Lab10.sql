create table Student_info(
	RNo int,
	Name Varchar(25),
	Branch Varchar(25),
	Spi decimal(8,2),
	bklog int
);

insert into Student_info values 
(101,'Raju','CE',8.80,0),
(102,'Amit','CE',2.20,3),
(103,'Sanjay','ME',1.50,6),
(104,'Neha','EC',7.65,1),
(105,'Meera','EE',5.52,2),
(106,'Mahesh','EC',4.50,3)

 
--Part – A:
--1. Create a view Personal with all columns.
CREATE VIEW PERSONAL 
AS
SELECT * FROM Student_info 

--2. Create a view Student_Details having columns Name, Branch & SPI.
CREATE VIEW STUDENT_DETAILS 
AS
SELECT NAME,BRANCH,SPI 
FROM Student_info

--3. Create a view AcademicData having columns RNo, Name, Branch.
CREATE VIEW ACADEMIC_DATA 
AS 
SELECT RNO,NAME,BRANCH
FROM Student_info

--4. Create a view Student_ bklog having all columns but students whose bklog more than 2.
CREATE VIEW STUDENT_BKLOG 
AS 
SELECT * FROM Student_info
WHERE BKLOG>2

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four letters.
CREATE VIEW STUDENT_PATTERN 
AS 
SELECT RNO,NAME,BRANCH 
FROM Student_info
WHERE NAME LIKE '____'

--6. Insert a new record to AcademicData view. (107, Meet, ME)
INSERT INTO ACADEMIC_DATA 
VALUES (107,'Meet','ME')

--7. Update the branch of Amit from CE to ME in Student_Details view.
UPDATE STUDENT_DETAILS 
SET Branch = 'ME' 
WHERE NAME = 'AMIT'

--8. Delete a student whose roll number is 104 from AcademicData view.
DELETE FROM ACADEMIC_DATA WHERE RNO = 104

--Part – B:
--1. Create a view that displays information of all students whose SPI is above 8.5
CREATE VIEW SP
AS
SELECT * FROM Student_info
WHERE SPI>8.5

--2. Create a view that displays 0 backlog students.
CREATE VIEW BKG
AS
SELECT * FROM Student_info
WHERE bklog = 0

--3. Create a view Computerview that displays CE branch data only.
CREATE VIEW COMPUTER_VIEW
AS
SELECT * FROM Student_info
WHERE BRANCH = 'CE'


--Part – C:
--1. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.
CREATE VIEW RESULT_EC
AS 
SELECT NAME,SPI 
FROM Student_info
WHERE BRANCH = 'EC' AND SPI<5

--2. Update the result of student MAHESH to 4.90 in Result_EC view.
UPDATE RESULT_EC SET SPI = 4.90 WHERE NAME = 'Mahesh'
--3. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having
--bklogs more than 5.
CREATE VIEW STU_BKLOG 
AS
SELECT RNO,NAME,BKLOG
FROM Student_info
WHERE NAME LIKE 'M%' AND bklog>5

--4. Drop Computerview form the database.
DROP VIEW COMPUTER_VIEW
