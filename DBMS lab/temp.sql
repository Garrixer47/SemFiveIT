create database temp;
use temp;

create table Customer(
id int primary key,
cname varchar(255),
Address varchar(255),
Gender char(2),
Pincode int);

INSERT INTO Customer(id,cname,Address,Gender,Pincode)
VALUES 
(1,'Aadi','Goa','M',416100),
(2,'Modi','Delhi','F',459267),
(3,'Aakash','Mumbai','M',841578), 
(4,'Rupesh','Pune','M',263626),
(5,'Mr. Mulla','Sangli','M',213652),
(6,'Himanshi','Wardha','F',268236),
(7,'Rajani','Hubli','F',963552);

-- ADD COLUMN 
ALTER TABLE Customer CHANGE POINTER CGPA FLOAT NOT NULL DEFAULT 0;
 




CREATE TABLE OrderDetails(
ORDER_ID integer PRIMARY KEY,
DELIVERY_DATE DATE,
CUST_ID INT,
FOREIGN KEY(CUST_ID) REFERENCES Customer(id)
);

SELECT * FROM Customer;


CREATE TABLE ACCOUNT(
ID INT NOT NULL,
NAME VARCHAR(255),
BALANCE INT NOT NULL,
PRIMARY KEY(ID)
);

-- ADD NEW COLUMN
ALTER TABLE ACCOUNT ADD INTEREST FLOAT NOT NULL DEFAULT 0;

-- MODIFY DATA TYPE
ALTER TABLE ACCOUNT MODIFY INTEREST DOUBLE NOT NULL;

-- RENAME/CHANGE COLUMN
ALTER TABLE ACCOUNT CHANGE COLUMN INTEREST SAVING_INTEREST FLOAT NOT NULL;


-- DROP COLUMN
ALTER TABLE ACCOUNT DROP COLUMN SAVING_INTEREST;

-- RENAME THE TABLE
ALTER TABLE ACCOUNT RENAME TO ACCOUNT_DETAILS;






SELECT * FROM ACCOUNT;