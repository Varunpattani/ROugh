--Select into Operation
--Part – A:

CREATE TABLE CRICKET(
   NAME VARCHAR(50),
   CITY VARCHAR(50),
   AGE INT
   );
   
INSERT INTO CRICKET VALUES ('Sachin Tendulkar ','Mumbai',30)
INSERT INTO CRICKET VALUES ('Rahul Dravid','Bombay',35)
INSERT INTO CRICKET VALUES ('M. S. Dhoni','Jharkhand',31)
INSERT INTO CRICKET VALUES ('Suresh Raina','Gujarat',30)
 
--1. Create table Worldcup from cricket with all the columns and data.
SELECT * INTO WORLDCUP FROM CRICKET

--2. Create table T20 from cricket with first two columns with no data.
SELECT NAME,CITY INTO T20 FROM CRICKET WHERE 0=1

--3. Create table IPL From Cricket with No Data
SELECT * INTO IPL FROM CRICKET WHERE 0=1

--Part – B: 
CREATE TABLE EMPLOYEE(
   NAME VARCHAR(50),
   CITY VARCHAR(50),
   AGE INT
   );

INSERT INTO EMPLOYEE VALUES ('Jay Patel ','Rajkot',30)
INSERT INTO EMPLOYEE VALUES ('Rahul Dave','Baroda',35)
INSERT INTO EMPLOYEE VALUES ('Jeet Patel ','Surat',31)
INSERT INTO EMPLOYEE VALUES ('Vijay Raval','Rajkot',30)



--1. Create table Employee_detail from Employee with all the columns and data.
SELECT * INTO EMPLOYEES_DETAIL FROM EMPLOYEE
--2. Create table Employee_data from Employee with first two columns with no data.
--3. Create table Employee_info from Employee with no Data


--Update Operation
--Part – A: 

--1. Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table)
UPDATE DEPOSIT SET AMOUNT=5000 WHERE AMOUNT=3000
--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)
UPDATE BORROW SET BNAME='C.G.ROAD' WHERE CNAME='ANIL'
--3. Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table)
UPDATE DEPOSIT SET ACTNO=111,AMOUNT=5000 WHERE CNAME='SANDIP'
--4. Update amount of KRANTI to 7000. (Use Deposit Table)
UPDATE DEPOSIT SET AMOUNT=7000 WHERE CNAME='KRANTI'
--5. Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table)
UPDATE BRANCH SET BNAME='ANDHERI WEST' WHERE BNAME='ANDHERI'
--6. Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table)
UPDATE DEPOSIT SET BNAME='NEHRU PALACE' WHERE BNAME='MEHUL'
--7. Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit Table)
UPDATE DEPOSIT SET AMOUNT=5000 WHERE ACTNO>103 AND ACTNO<107
--8. Update ADATE of ANIL to 1-4-95. (Use Deposit Table)
UPDATE DEPOSIT SET  ADATE='1-4-95' WHERE CNAME='ANIL'
--9. Update the amount of MINU to 10000. (Use Deposit Table)
UPDATE DEPOSIT SET  AMOUNT=10000 WHERE CNAME='MINU'
--10. Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table)
UPDATE DEPOSIT SET AMOUNT=5000,ADATE='1-4-96' WHERE CNAME='PRMOD'
