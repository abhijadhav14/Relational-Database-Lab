CREATE DATABASE ORDERS; USE ORDERS;

CREATE TABLE SALESMAN (SALESMAN_ID INT PRIMARY KEY, NAME VARCHAR(20),
CITY VARCHAR(20), COMMISSION VARCHAR(20)); DESC SALESMAN;

CREATE TABLE CUSTOMER( CUSTOMER_ID INT PRIMARY KEY, CUST_NAME VARCHAR(20),
CITY VARCHAR(20), GRADE INT, SALESMAN_ID INT,
FOREIGN KEY (SALESMAN_ID) REFERENCES SALESMAN(SALESMAN_ID) ON DELETE SET NULL);
DESC CUSTOMER;

CREATE TABLE ORDERS( ORDER_NO INT PRIMARY KEY, PURCHASE_AMOUNT INT, ORDER_DATE DATE, CUSTOMER_ID INT, SALESMAN_ID INT,
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID) ON DELETE CASCADE,
FOREIGN KEY (SALESMAN_ID) REFERENCES SALESMAN(SALESMAN_ID) ON DELETE CASCADE);
DESC ORDERS;

INSERT INTO SALESMAN VALUES(1000,"AYUSH","MANGALORE","25%"); 
INSERT INTO SALESMAN VALUES(1001,"KARTHIK","BANGALORE","30%"); 
INSERT INTO SALESMAN VALUES(1002,"RIDHAAN","CHENNAI","15%"); 
INSERT INTO SALESMAN VALUES(1003,"ABHIK","DELHI","10%"); 
INSERT INTO SALESMAN VALUES(1004,"APOORVA","BANGALORE","5%"); SELECT * FROM SALESMAN;

INSERT INTO CUSTOMER VALUES(201,"BHAVANA","BANGALORE",5,1000); 
INSERT INTO CUSTOMER VALUES(202,"ANIL","DELHI",6,1000); 
INSERT INTO CUSTOMER VALUES(203,"MEGHANA","BANGALORE",2,1001); 
INSERT INTO CUSTOMER VALUES(204,"ASHWIN","CHENNAI",4,1001);
INSERT INTO CUSTOMER VALUES(205,"PRIYANKA","MANGALORE",7,1002); 
INSERT INTO CUSTOMER VALUES(206,"ABHEESH","BANGALORE",9,1002); 
INSERT INTO CUSTOMER VALUES(207,"DEEKSHA","UDUPI",8,1003); 
INSERT INTO CUSTOMER VALUES(208,"AVYAAN","BANGALORE",3,1003); 
INSERT INTO CUSTOMER VALUES(209,"AADYA","MUMBAI",6,1004); 
INSERT INTO CUSTOMER VALUES(210,"ESHAAN","BANGALORE",7,1004); SELECT * FROM CUSTOMER;

INSERT INTO ORDERS VALUES(301,25000,'2021-09-15',201,1000); 
INSERT INTO ORDERS VALUES(302,17000,'2021-09-15',203,1001); 
INSERT INTO ORDERS VALUES(303,8500,'2021-12-22',202,1003); 
INSERT INTO ORDERS VALUES(304,3000,'2021-10-25',204,1000); 
INSERT INTO ORDERS VALUES(305,15000,'2021-12-30',209,1001); 
INSERT INTO ORDERS VALUES(306,10000,'2021-12-30',204,1004); 
INSERT INTO ORDERS VALUES(307,5000,'2021-11-27',210,1002); SELECT * FROM ORDERS;


/*1. Count the customers with grades above Bangalore's average.*/
SELECT AVG(GRADE) FROM CUSTOMER WHERE CITY='BANGALORE'; SELECT GRADE,COUNT(DISTINCT CUSTOMER_ID) FROM CUSTOMER
GROUP BY GRADE HAVING GRADE > (SELECT AVG(GRADE) FROM CUSTOMER WHERE CITY='BANGALORE');

/*2. Find the name and numbers of all salesman who had more than one customer*/

SELECT SALESMAN_ID, NAME FROM SALESMAN S WHERE
(SELECT COUNT(*) FROM CUSTOMER WHERE SALESMAN_ID=S.SALESMAN_ID)>1;

/*3. List all the salesman and indicate those who have and don’t have
customers in their cities (Use UNION operation.)*/

SELECT S.SALESMAN_ID, S.NAME, C.CUST_NAME, S.COMMISSION FROM SALESMAN S, CUSTOMER C WHERE S.CITY=C.CITY AND S.SALESMAN_ID=C.SALESMAN_ID
UNION
SELECT SALESMAN_ID, NAME, 'NO MATCH' ,COMMISSION FROM SALESMAN WHERE NOT CITY = ANY (SELECT CITY FROM CUSTOMER) ORDER BY 2 DESC;

/*4. Create a view that finds the salesman who has the customer with the highest order of a day */

CREATE VIEW HIGH_ORDER_VIEW AS SELECT O.ORDER_DATE, S.SALESMAN_ID, S.NAME
FROM SALESMAN S, ORDERS O WHERE S.SALESMAN_ID=O.SALESMAN_ID AND O.PURCHASE_AMOUNT=(SELECT MAX(PURCHASE_AMOUNT) FROM ORDERS O1 WHERE O1.ORDER_DATE=O.ORDER_DATE);

SELECT * FROM HIGH_ORDER_VIEW;

/*5. Demonstrate the DELETE operation by removing salesman with id 1001. All his orders must also be deleted.*/
DELETE FROM SALESMAN WHERE SALESMAN_ID=1000; SELECT * FROM SALESMAN;

SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER;

/*Query set -2 */

SELECT GRADE,COUNT(DISTINCT CUSTOMER_ID) COUNT
FROM CUSTOMER GROUP BY GRADE HAVING GRADE >(SELECT AVG(GRADE) FROM CUSTOMER WHERE CITY='BANGALORE');


SELECT SALESMAN_ID, NAME FROM SALESMAN WHERE SALESMAN_ID IN (SELECT SALESMAN_ID FROM CUSTOMER GROUP BY SALESMAN_ID HAVING COUNT(*)>1);


(SELECT S.SALESMAN_ID, S.NAME,C.CUST_NAME,S.CITY FROM SALESMAN S, CUSTOMER C
WHERE S.SALESMAN_ID=C.SALESMAN_ID AND S.CITY=C.CITY) UNION
(SELECT S.SALESMAN_ID, S.NAME,C.CUST_NAME,"NO MATCH" FROM SALESMAN S, CUSTOMER C
WHERE S.SALESMAN_ID=C.SALESMAN_ID AND S.CITY<>C.CITY);


CREATE VIEW HOV AS SELECT SALESMAN_ID, NAME, ORDER_DATE FROM SALESMAN NATURAL JOIN ORDERS
WHERE (PURCHASE_AMOUNT, ORDER_DATE) IN
(SELECT MAX(PURCHASE_AMOUNT), ORDER_DATE FROM ORDERS GROUP BY ORDER_DATE);

SELECT * FROM HOV;


DELETE FROM SALESMAN WHERE SALESMAN_ID=1000; SELECT * FROM SALESMAN;
SELECT * FROM CUSTOMER; SELECT * FROM ORDERS;


