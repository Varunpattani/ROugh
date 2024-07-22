create database cse_3A_254
USE CSE_3A_254

create table deposit(
   actno int,
   cname varchar(50),
   bname varchar(50),
   amount decimaL(8,2),
   adate datetime 

);

insert into deposit(ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (101,'ANIL','VRCE',1000,'1995-3-1')
insert into deposit(ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (102,'SUNIL','AJNI',5000,'1946-1-4')
insert into deposit(ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (103,'MEHUL','KAROLBAGH',3500,'1995-11-17')
insert into deposit(ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (104,'MADHURI','CHANDI',1200,'1995-12-17')
insert into deposit(ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (105,'PRMOD','M.G.ROAD',3000,'1996-3-27')
insert into deposit(ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (106,'SANDIP','ANDHERI',2000,'1996-3-31')
insert into deposit(ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (107,'SHIVANI','VIRAR',1000,'1995-9-5')
insert into deposit(ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (108,'KRANTI','NEHRU PLACE',5000,'1995-7-2')
insert into deposit(ACTNO,CNAME,BNAME,AMOUNT,ADATE) VALUES (109,'MINU','POWAI',7000,'1995-8-10')





create table BRANCH (
  BNAME VARCHAR(50),
  CITY VARCHAR(50)
);

INSERT INTO BRANCH VALUES ('VRCE','NAGPUR')
INSERT INTO BRANCH VALUES ('AJNI','NAGPUR')
INSERT INTO BRANCH VALUES ('KAROLBAGH','DELHI')
INSERT INTO BRANCH VALUES ('CHANDI','DELHI')
INSERT INTO BRANCH VALUES ('DHARAMPETH','NAGPUR')
INSERT INTO BRANCH VALUES ('M.G.ROAD','BANGLORE')
INSERT INTO BRANCH VALUES ('ANDHERI','BOMBAY')
INSERT INTO BRANCH VALUES ('VIRAR','BOMBAY')
INSERT INTO BRANCH VALUES ('NEHRU PLACE','DELHI')
INSERT INTO BRANCH VALUES ('POWAI','BOMBAY')


CREATE TABLE CUSTOMERS(
	CNAME VARCHAR(50),
	CITY VARCHAR(50)
);


	INSERT INTO CUSTOMERS VALUES ('ANIL','CALCUTTA')
	INSERT INTO CUSTOMERS VALUES ('SUNIL','DELHI')
	INSERT INTO CUSTOMERS VALUES ('MEHUL','BARODA')
	INSERT INTO CUSTOMERS VALUES ('MANDAR','PATNA')
	INSERT INTO CUSTOMERS VALUES ('MADHURI','NAGPUR')
	INSERT INTO CUSTOMERS VALUES ('PRAMOD','NAGPUR')
	INSERT INTO CUSTOMERS VALUES ('SANDIP','SURAT')
	INSERT INTO CUSTOMERS VALUES ('SHIVANI','BOMBAY')
	INSERT INTO CUSTOMERS VALUES ('KRANTI','BOMBAY')
	INSERT INTO CUSTOMERS VALUES ('NAREN','BOMBAY')

	CREATE TABLE BORROW(
	LOANNO INT,
	CNAME VARCHAR(50),
	BNAME VARCHAR(50),
	AMOUNT DECIMAL(8,2)
);
INSERT INTO BORROW VALUES (201,'ANIL','VRCE',1000)
INSERT INTO BORROW VALUES (206,'MEHUL','AJNI',5000)
INSERT INTO BORROW VALUES (311,'SUNIL','DHARAMPETH',3000)
INSERT INTO BORROW VALUES (321,'MADHURI','ANDHERI',2000)
INSERT INTO BORROW VALUES (375,'PARMOD','VIRAR',8000)
INSERT INTO BORROW VALUES (481,'KRANTI','NEHRU PLACE',3000)

--Part – A:	
--1. Retrieve all data from table DEPOSIT.
SELECT * FROM DEPOSIT
--2. Retrieve all data from table BORROW.
SELECT * FROM BORROW
--3. Retrieve all data from table CUSTOMERS.
SELECT * FROM CUSTOMERS
--4. Display Account No, Customer Name & Amount from DEPOSIT.
SELECT ACTNO,CNAME,AMOUNT FROM DEPOSIT
--5. Display Loan No, Amount from BORROW.
SELECT LOANNO,AMOUNT FROM BORROW
--6. Display loan details of all customers who belongs to ‘ANDHERI’ branch from borrow table.
SELECT * FROM BORROW WHERE BNAME='ANDHERI'
--7. Give account no and amount of depositor, whose account no is equals to 106 from deposit table.
SELECT ACTNO,AMOUNT FROM DEPOSIT WHERE ACTNO=106
--8. Give name of borrowers having amount greater than 5000 from borrow table.
SELECT CNAME FROM BORROW WHERE AMOUNT>5000
--9. Give name of customers who opened account after date '1-12-96' from deposit table.
SELECT CNAME FROM DEPOSIT WHERE ADATE>'1996-12-1'
--10. Display name of customers whose account no is less than 105 from deposit table.
SELECT CNAME FROM DEPOSIT WHERE ACTNO<105 
--11. Display name of customer who belongs to either ‘NAGPUR’ or ‘DELHI’ from customer table. (OR & IN)
SELECT CNAME FROM CUSTOMERS WHERE CITY='NAGPUR' OR CITY='DELHI'
SELECT CNAME FROM CUSTOMERS WHERE CITY IN ('NAGPUR','DELHI')
--12. Display name of customers with branch whose amount is greater than 4000 and account no is less than 105 from deposit table.
SELECT CNAME,BNAME FROM DEPOSIT WHERE AMOUNT>4000 AND ACTNO<105
--13. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow table. (AND & BETWEEN)
SELECT * FROM BORROW WHERE AMOUNT>=3000 AND AMOUNT<=8000
SELECT * FROM BORROW WHERE AMOUNT BETWEEN 3000 AND 8000
--14. Find all depositors who do not belongs to ‘ANDHERI’ branch from deposit table.
SELECT * FROM DEPOSIT WHERE NOT BNAME='ANDHERI'
--15. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ Or ‘M.G.ROAD’ and Account No is less than 104 from deposit table.SELECT ACTNO,CNAME,AMOUNT FROM DEPOSIT WHERE BNAME IN('AJNI','KAROLBAGH','M.G.ROAD') AND ACTNO<104 	


--Part – B:
--1. Display all the details of first five customers from deposit table.
SELECT TOP 5* FROM DEPOSIT
--2. Display all the details of first three depositors whose amount is greater than 1000.
SELECT TOP 3* FROM DEPOSIT WHERE AMOUNT>1000
--3. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to ‘ANDHERI’ from borrow table.
SELECT TOP 5 LOANNO,CNAME FROM BORROW WHERE BNAME!='ANDHERI'
--4. Retrieve all unique cities using DISTINCT. (Use Customers Table)
SELECT DISTINCT CITY FROM CUSTOMERS
--5. Retrieve all unique branches using DISTINCT. (Use Branch Table)
SELECT DISTINCT BNAME FROM BRANCH

