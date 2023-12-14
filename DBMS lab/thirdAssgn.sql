create database three;
use three;

-- Create the "Account" table
CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    AccountHolder VARCHAR(50),
    Balance DECIMAL(10, 2)
);

-- Insert data into the "Account" table
INSERT INTO Account (AccountID, AccountHolder, Balance)
VALUES
    (101, 'John Doe', 5000.00),
    (102, 'Jane Smith', 7500.00),
    (103, 'Alice Johnson', 3200.00),
    (104, 'Bob Williams', 9000.00);

-- Create the "Deposit" table with "AccountID" as a foreign key
CREATE TABLE Deposit (
    DepositID INT PRIMARY KEY,
    AccountID INT,
    DepositAmount DECIMAL(10, 2),
    DepositDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

-- Insert data into the "Deposit" table
INSERT INTO Deposit (DepositID, AccountID, DepositAmount, DepositDate)
VALUES
    (1, 101, 1000.00, '2023-01-15'),
    (2, 102, 500.00, '2023-01-20'),
    (3, 101, 750.00, '2023-02-05'),
    (4, 104, 1200.00, '2023-02-10');
    
    
    -- on
SELECT *
FROM Account
INNER JOIN Deposit ON Account.AccountID = Deposit.AccountID;

-- where
SELECT *
FROM Account, Deposit
WHERE Account.AccountID = Deposit.AccountID;

-- using JOIN
SELECT *
FROM Account
JOIN Deposit ON Account.AccountID = Deposit.AccountID;

-- left join 
SELECT *
FROM Account
LEFT OUTER JOIN Deposit ON Account.AccountID = Deposit.AccountID;

-- right
SELECT *
FROM Account
RIGHT OUTER JOIN Deposit ON Account.AccountID = Deposit.AccountID;

