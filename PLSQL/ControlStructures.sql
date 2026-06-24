/*customer table*/
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Age NUMBER,
    Balance NUMBER,
    IsVIP VARCHAR2(5)
);

/*loan table*/
CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    InterestRate NUMBER(5,2),
    DueDate DATE,
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

/*inserting the data*/
INSERT INTO Customers VALUES (1,'Ravi',65,15000,'FALSE');
INSERT INTO Customers VALUES (2,'Priya',45,8000,'FALSE');
INSERT INTO Customers VALUES (3,'Suresh',70,20000,'FALSE');

INSERT INTO Loans VALUES (101,1,8.5,SYSDATE+20);
INSERT INTO Loans VALUES (102,2,9.0,SYSDATE+40);
INSERT INTO Loans VALUES (103,3,7.5,SYSDATE+10);

COMMIT;

/*Starting the server*/
SET SERVEROUTPUT ON;

DECLARE
BEGIN
   FOR cust IN (
      SELECT CustomerID
      FROM Customers
      WHERE Age > 60
   )
   LOOP
      UPDATE Loans
      SET InterestRate = InterestRate - 1
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE(
         'Discount Applied for Customer: '
         || cust.CustomerID
      );
   END LOOP;

   COMMIT;
END;
/

SELECT * FROM Loans;

SET SERVEROUTPUT ON;

DECLARE
BEGIN
   FOR cust IN (
      SELECT CustomerID
      FROM Customers
      WHERE Balance > 10000
   )
   LOOP
      UPDATE Customers
      SET IsVIP = 'TRUE'
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE(
         'VIP Customer: '
         || cust.CustomerID
      );
   END LOOP;

   COMMIT;
END;
/

SELECT * FROM Customers;

SET SERVEROUTPUT ON;

DECLARE
BEGIN
   FOR loan_rec IN (
      SELECT c.Name,
             l.LoanID,
             l.DueDate
      FROM Customers c
      JOIN Loans l
      ON c.CustomerID = l.CustomerID
      WHERE l.DueDate BETWEEN SYSDATE
                         AND SYSDATE + 30
   )
   LOOP
      DBMS_OUTPUT.PUT_LINE(
         'Reminder: Dear '
         || loan_rec.Name
         || ', Loan '
         || loan_rec.LoanID
         || ' is due on '
         || TO_CHAR(
               loan_rec.DueDate,
               'DD-MON-YYYY'
            )
      );
   END LOOP;
END;
/

