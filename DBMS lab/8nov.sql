create database ORG;
use ORG;
create table Worker(
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
DEPT CHAR(25)
);
INSERT INTO Worker
(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,DEPT)
VALUES
(1,'AADITYA','KHOT',15000,'HR'),
(2,'AKASH','GOLU',25000,'ADMIN'),
(3,'RAJAT','MUNAVALLI',10000,'MANAGER'),
(4,'RUPESH','GANGARDE',35000,'ADMIN'),
(5,'SAAD','MULLA',25000,'MANAGER'),
(6,'PARTH','KULKARNI',15000,'ADMIN'),
(7,'HIMU','MUDE',100000,'HR'),
(8,'RIHAN','NARDEKAR',40000,'JOB'),
(9,'KASTUB','SUROSHI',20000,'JOB'),
(10,'ADITYA','KUSHIRE',37000,'ADMIN'),
(11,'SARTHAK','GANJARE',29000,'JOB'),
(12,'ANGELO','MATHEWS',69000,'HR');

CREATE TABLE Bonus(
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE datetime,
foreign key (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
);

INSERT INTO Bonus 
(WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE)
VALUES
(1,5000,'16-12-22 00:00:00'),
(2,2500,'6-12-22 02:30:04'),
(3,3500,'23-12-22 01:20:00'),
(4,5400,'19-12-22 15:25:22'),
(5,1000,'12-12-22 21:00:23'),
(6,800,'08-12-22 12:53:43'),
(7,5900,'04-12-22 14:24:53');


CREATE TABLE Title(
WORKER_REF_ID INT NOT NULL,
WORKER_TITLE VARCHAR(255),
AFFECTED_FROM DATETIME,
FOREIGN KEY(WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
);

INSERT INTO Title
(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM)
VALUES
(1,'Admin','16-02-16 00:00:00'),
(2,'Manager','06-10-22 02:30:04'),
(3,'Dean','23-02-14 01:20:00'),
(4,'HR','19-12-15 15:25:22'),
(5,'Admin','12-11-16 21:00:23'),
(6,'Admin','08-02-15 12:53:43'),
(7,'Admin','04-06-20 14:24:53');

SELECT * FROM Worker WHERE DEPT='HR' OR DEPT='ADMIN' ORDER BY LAST_NAME ASC;
SELECT * FROM Worker WHERE DEPT IN('HR','JOB','ADMIN');
SELECT * FROM Worker WHERE DEPT NOT IN('HR','ADMIN');


-- WILDCARD
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE 'a%a';

-- SORTING
SELECT * FROM Worker ORDER BY SALARY; 

-- DISTINCT KEYWORD
SELECT DISTINCT DEPT FROM Worker;

-- DATA GROUPING
SELECT DEPT, COUNT(DEPT) FROM Worker GROUP BY DEPT;
SELECT DEPT, AVG(SALARY) FROM Worker GROUP BY DEPT;

-- MIN AND MAX SALARY
SELECT DEPT,MAX(SALARY) FROM Worker GROUP BY DEPT;
SELECT DEPT,MIN(SALARY) FROM Worker GROUP BY DEPT;

-- SUM OF SALARIES 
SELECT DEPT, SUM(SALARY) FROM Worker GROUP BY DEPT;

-- SELECT --> WHERE similarly GROUP BY --> HAVING for filtering 
-- HAVING CLAUSE
SELECT DEPT, COUNT(DEPT) FROM Worker GROUP BY DEPT HAVING COUNT(DEPT)>2;




Select * from temp.Customer;

SELECT * FROM Worker;
SELECT * FROM Bonus;
SELECT * FROM Title;