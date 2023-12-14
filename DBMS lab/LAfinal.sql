create database LA1;

use LA1;

CREATE TABLE customer (
  custname VARCHAR(255) NOT NULL,
  custstreet VARCHAR(255) NOT NULL,
  custcity VARCHAR(255) NOT NULL,
  primary key (custname)
);

CREATE TABLE account (
  accnum INT NOT NULL AUTO_INCREMENT,
  branchname VARCHAR(255) NOT NULL,
  balance DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (accnum)	
);

CREATE TABLE loan (
  loanno INT NOT NULL AUTO_INCREMENT,
  branchname VARCHAR(255) NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (loanno)
);

CREATE TABLE borrower (
  custname VARCHAR(255) NOT NULL,
  loanno INT NOT NULL,
  FOREIGN KEY (custname) REFERENCES customer(custname),
  FOREIGN KEY (loanno) REFERENCES loan(loanno)
);

CREATE TABLE branch (
  branchname VARCHAR(255) NOT NULL,
  branchcity VARCHAR(255) NOT NULL,
  asset DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (branchname)
);

CREATE TABLE branch_summary (
  branchname VARCHAR(255) NOT NULL,
  total_balance DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (branchname)
);

INSERT INTO customer (custname, custstreet, custcity)
VALUES ('John Doe', '123 Main Street', 'Anytown'),
('Mr. Mulla', 'Baba Nagar', 'Sangli'),
('Md.Saad Patil', 'Vijay Nagar', 'Miraj'),
('Xavier Pepe', 'Kuwait Street', 'Kupwad');

INSERT INTO account (branchname, balance)
VALUES ('Sangli', 10000),
('Miraj', 1000),
('Goa', 9652),
('Sangli', 2000);

INSERT INTO loan (branchname, amount)
VALUES ('Sangli', 20000),
('Goa', 800),
('Miraj', 5600),
('Sangli', 10000);

INSERT INTO borrower (custname, loanno)
VALUES ('John Doe', 1),
('Mr. Mulla', 2),
('Md.Saad Patil', 3),
('Xavier Pepe', 4);

INSERT INTO branch (branchname, branchcity, asset)
VALUES ('Sangli', 'Sangli', 1000000);

-- 1

-- 2
SELECT custcity
FROM customer
INNER JOIN borrower
ON customer.custname = borrower.custname
GROUP BY custcity
HAVING COUNT(*) >= 2;

-- 3
SELECT loanno
FROM loan
WHERE amount BETWEEN 1000 AND 20000;

-- 4
SELECT c.custname
FROM Customer c
INNER JOIN Borrower b ON c.custname = b.custname
INNER JOIN Loan l ON b.loanno = l.loanno
INNER JOIN Branch br ON l.branchname = br.branchname
WHERE br.branchcity = 'Sangli' order by c.custname asc;

-- 5
SELECT branchname, AVG(balance) AS avg_balance
FROM account
GROUP BY branchname
ORDER BY avg_balance DESC;

-- 6
SELECT c.custname
FROM customer c
LEFT JOIN borrower b
ON c.custname = b.custname
WHERE b.loanno IS NULL;

-- 7
SELECT branchname, AVG(balance) AS avg_balance
FROM account
GROUP BY branchname
HAVING AVG(balance) > 1000
ORDER BY avg_balance DESC;

 
 -- showing data from all the tables
select * from customer;
select * from account;
select * from loan;
select * from borrower;
select * from branch;

