create database LA;

use LA;

CREATE TABLE customer (
  custname VARCHAR(255) NOT NULL,
  custstreet VARCHAR(255) NOT NULL,
  custcity VARCHAR(255) NOT NULL
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
VALUES ('John Doe', '123 Main Street', 'Anytown');

INSERT INTO account (branchname, balance)
VALUES ('Sangli', 10000);

INSERT INTO loan (branchname, amount)
VALUES ('Sangli', 20000);

INSERT INTO borrower (custname, loanno)
VALUES ('John Doe', 1);

INSERT INTO branch (branchname, branchcity, asset)
VALUES ('Sangli', 'Sangli', 1000000);


CREATE TRIGGER branch_summary_trigger
AFTER INSERT ON account
FOR EACH ROW
BEGIN
  UPDATE branch_summary
  SET total_balance = total_balance + NEW.balance
  WHERE branchname = NEW.branchname
END; 

SELECT custcity
FROM customer
INNER JOIN borrower
ON customer.custname = borrower.custname
GROUP BY custcity
HAVING COUNT(*) >= 2;

SELECT loanno
FROM loan
WHERE amount BETWEEN 1000 AND 2000;


SELECT custname
FROM borrower
INNER JOIN customer
ON borrower.custname = customer.custname
WHERE branchname = 'Sangli'
ORDER BY custname ASC;

SELECT branchname, AVG(balance) AS avg_balance
FROM account
GROUP BY branchname
ORDER BY avg_balance DESC;

SELECT custname
FROM customer
LEFT JOIN borrower
ON customer.custname = borrower.custname
WHERE borrower.loanno IS NULL;

SELECT branchname, AVG(balance) AS avg_balance
FROM account
GROUP BY branchname
HAVING AVG(balance) > 1000
ORDER BY avg_balance DESC;

