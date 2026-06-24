CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    AccountType VARCHAR2(20),
    Balance NUMBER(10,2)
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(100),
    Department VARCHAR2(50),
    Salary NUMBER(10,2)
);

INSERT INTO Accounts VALUES (101,'Ravi','Savings',10000);
INSERT INTO Accounts VALUES (102,'Priya','Savings',15000);
INSERT INTO Accounts VALUES (103,'Suresh','Current',20000);

INSERT INTO Employees VALUES (1,'Anil','IT',50000);
INSERT INTO Employees VALUES (2,'Meena','HR',45000);
INSERT INTO Employees VALUES (3,'Kiran','IT',60000);

COMMIT;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;
END;
/
BEGIN
    ProcessMonthlyInterest;
END;
/

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_Department IN VARCHAR2,
    p_BonusPercent IN NUMBER
)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_BonusPercent / 100)
    WHERE Department = p_Department;

    COMMIT;
END;
/
BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_FromAccount IN NUMBER,
    p_ToAccount IN NUMBER,
    p_Amount IN NUMBER
)
AS
    v_Balance NUMBER;
BEGIN
    SELECT Balance
    INTO v_Balance
    FROM Accounts
    WHERE AccountID = p_FromAccount;

    IF v_Balance >= p_Amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_Amount
        WHERE AccountID = p_FromAccount;

        UPDATE Accounts
        SET Balance = Balance + p_Amount
        WHERE AccountID = p_ToAccount;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;
END;
/
SET SERVEROUTPUT ON;

BEGIN
    TransferFunds(101,102,2000);
END;
/
SELECT * FROM Accounts;

SELECT * FROM Employees;
