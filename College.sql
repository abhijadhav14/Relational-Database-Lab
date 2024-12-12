
CREATE TABLE STUDENT(
USN VARCHAR(10) PRIMARY KEY,
SNAME varchar(20) NOT NULL,
ADDRESS VARCHAR(20),
PHONE BIGINT,
GENDER CHAR(1));



CREATE TABLE SEMSEC(
SSID VARCHAR(5) PRIMARY KEY,
SEM INT,
SEC CHAR(1));



CREATE TABLE CLASS(
USN VARCHAR(10) PRIMARY KEY,
SSID VARCHAR(5),
FOREIGN KEY(USN) REFERENCES STUDENT(USN) ON DELETE CASCADE,
FOREIGN KEY(SSID) REFERENCES SEMSEC(SSID) ON DELETE CASCADE);



CREATE TABLE SUBJECT(
SUBCODE VARCHAR(10) PRIMARY KEY,
TITLE VARCHAR(40),
SEM INT,
CREDITS INT);



CREATE TABLE IAMARKS(
USN VARCHAR(10),
SUBCODE VARCHAR(10),
SSID VARCHAR(5),
TEST1 INT,
TEST2 INT,
TEST3 INT,
FINALIA INT,
PRIMARY KEY(USN,SUBCODE,SSID),
FOREIGN KEY(USN) REFERENCES STUDENT(USN) ON DELETE CASCADE ,
FOREIGN KEY(SUBCODE) REFERENCES SUBJECT(SUBCODE) ON DELETE CASCADE,
FOREIGN KEY(SSID) REFERENCES SEMSEC(SSID) ON DELETE CASCADE);


INSERT INTO STUDENT VALUES
('1BI16CS020','ARAVIND','BANGALORE',9964217343,'M');
INSERT INTO STUDENT VALUES
('1BI16CS062','SOUPARNIKA','MANGALORE',9987431213,'F');
INSERT INTO STUDENT VALUES ('1BI15CS101','ABHILASH','MYSORE',9353643567,'M');
INSERT INTO STUDENT VALUES
('1BI16CS036','AKSHAYA','HYDERABAD',9664534432,'F');
INSERT INTO STUDENT VALUES
('1BI14CS010','JENIFER DSOUZA','CHENNAI',9019345456,'F');
INSERT INTO STUDENT VALUES ('1BI14CS032','TEJAS','BANGALORE',8297574532,'M');
INSERT INTO STUDENT VALUES ('1BI15CS025','RAKSHITH','UDUPI',9900235464,'M');
INSERT INTO STUDENT VALUES
('1BI15CS011','ANUPAMA','THRISSUR',8900764343,'F');
INSERT INTO STUDENT VALUES
('1BI15CS029','WALTER','DELHI',6361235653,'M');
INSERT INTO STUDENT VALUES ('1BI16CS045','AADYA','BELLARY',9082865434,'F');
INSERT INTO STUDENT VALUES ('1BI14CS091','ANIKA','BANGALORE',9001235464,'F');
INSERT INTO STUDENT VALUES
('1BI14CS034','BHAVANA','BANGALORE',9046412354,'F');
INSERT INTO STUDENT VALUES
('1BI14CS045','ATHARVA','KALBURGI',9886856453,'M');
INSERT INTO STUDENT VALUES
('1BI14CS088','ALEX CASTELINHO','SHIVAMOGGA',9756234546,'M');
INSERT INTO STUDENT VALUES ('1BI16CS022','SRINIDHI','BOMBAY',9123853333,'F');
INSERT INTO STUDENT VALUES
('1BI16CS024','ABHIK','CHIKAMAGALUR',9453856333,'M');
INSERT INTO STUDENT VALUES
('1BI14CS070','STANNY','MANGALORE',9981234313,'M');
INSERT INTO STUDENT VALUES
('1BI14CS012','TEJASWINI','KANNUR',9740668879,'F');

SELECT * FROM STUDENT;

INSERT INTO SEMSEC VALUES ('CSE1A', 1,'A');
INSERT INTO SEMSEC VALUES ('CSE1B', 1,'B');
INSERT INTO SEMSEC VALUES ('CSE1C', 1,'C');
INSERT INTO SEMSEC VALUES ('CSE2A', 2,'A');
INSERT INTO SEMSEC VALUES ('CSE2B', 2,'B');
INSERT INTO SEMSEC VALUES ('CSE2C', 2,'C');
INSERT INTO SEMSEC VALUES ('CSE3A', 3,'A');
INSERT INTO SEMSEC VALUES ('CSE3B', 3,'B');
INSERT INTO SEMSEC VALUES ('CSE3C', 3,'C');
INSERT INTO SEMSEC VALUES ('CSE4A', 4,'A');
INSERT INTO SEMSEC VALUES ('CSE4B', 4,'B');
INSERT INTO SEMSEC VALUES ('CSE4C', 4,'C');
INSERT INTO SEMSEC VALUES ('CSE5A', 5,'A');
INSERT INTO SEMSEC VALUES ('CSE5B', 5,'B');
INSERT INTO SEMSEC VALUES ('CSE5C', 5,'C');
INSERT INTO SEMSEC VALUES ('CSE6A', 6,'A');
INSERT INTO SEMSEC VALUES ('CSE6B', 6,'B');
INSERT INTO SEMSEC VALUES ('CSE6C', 6,'C');
INSERT INTO SEMSEC VALUES ('CSE7A', 7,'A');
INSERT INTO SEMSEC VALUES ('CSE7B', 7,'B');
INSERT INTO SEMSEC VALUES ('CSE7C', 7,'C');
INSERT INTO SEMSEC VALUES ('CSE8A', 8,'A');
INSERT INTO SEMSEC VALUES ('CSE8B', 8,'B');
INSERT INTO SEMSEC VALUES ('CSE8C', 8,'C');

SELECT * FROM SEMSEC;

INSERT INTO CLASS VALUES ('1BI16CS062','CSE4C');
INSERT INTO CLASS VALUES ('1BI14CS010','CSE8A');
INSERT INTO CLASS VALUES ('1BI14CS032','CSE8B');
INSERT INTO CLASS VALUES ('1BI14CS091','CSE8C');
INSERT INTO CLASS VALUES ('1BI16CS036','CSE4C');
INSERT INTO CLASS VALUES ('1BI14CS034','CSE8A');
INSERT INTO CLASS VALUES ('1BI16CS045','CSE4A');
INSERT INTO CLASS VALUES ('1BI14CS045','CSE8A');
INSERT INTO CLASS VALUES ('1BI15CS101','CSE6A');
INSERT INTO CLASS VALUES ('1BI16CS024','CSE4C');
INSERT INTO CLASS VALUES ('1BI14CS088','CSE8B');
INSERT INTO CLASS VALUES ('1BI16CS020','CSE4C');
INSERT INTO CLASS VALUES ('1BI14CS070','CSE8B');
INSERT INTO CLASS VALUES ('1BI15CS025','CSE6B');
INSERT INTO CLASS VALUES ('1BI16CS022','CSE4C');
INSERT INTO CLASS VALUES ('1BI14CS012','CSE8C');
INSERT INTO CLASS VALUES ('1BI15CS029','CSE6C');
INSERT INTO CLASS VALUES ('1BI15CS011','CSE6C');
SELECT * FROM CLASS;

INSERT INTO SUBJECT VALUES ('15CS41','MATHEMATICS', 4, 4);
INSERT INTO SUBJECT VALUES ('15CS42','MICROCONTROLLERS', 4, 4);
INSERT INTO SUBJECT VALUES ('15CS43','DESIGN OF ALGORITHMS', 4, 4);
INSERT INTO SUBJECT VALUES ('15CS44','OPERATING SYSTEMS', 4, 4);
INSERT INTO SUBJECT VALUES ('15CS45','OBJECT ORIENTED CONCEPTS', 4, 3);
INSERT INTO SUBJECT VALUES ('15CS46','DATA COMMUNICATION', 4, 3);
INSERT INTO SUBJECT VALUES ('15CS61','MACHINE LEARNING', 6, 4);
INSERT INTO SUBJECT VALUES ('15CS62','DIGITAL IMAGE PROCESSING', 6, 4);
INSERT INTO SUBJECT VALUES ('15CS63','JAVA', 6, 4);
INSERT INTO SUBJECT VALUES ('15CS64','NATURAL LANG. PROCESSING', 6, 4);
INSERT INTO SUBJECT VALUES ('15CS65','SW PROJECT MGT', 6, 3);
INSERT INTO SUBJECT VALUES ('15CS66','DATA SCIENCE', 6, 3);
INSERT INTO SUBJECT VALUES ('15CS81','DEEP LEARNING', 8, 4);
INSERT INTO SUBJECT VALUES ('15CS82','SYSTEM MODELLING', 8, 4);
INSERT INTO SUBJECT VALUES ('15CS83','SOFT COMPUTING', 8, 4);
INSERT INTO SUBJECT VALUES ('15CS84','ROBOTIC AUTOMATION', 8, 4);
INSERT INTO SUBJECT VALUES ('15CS85','INFORMATION RETRIEVAL', 8, 4);
select * from SUBJECT;

INSERT INTO IAMARKS VALUES ('1BI15CS101', '15CS61', 'CSE6A', 18, 15, 19, NULL);
INSERT INTO IAMARKS VALUES ('1BI15CS101', '15CS62', 'CSE6A', 17, 15, 20, NULL) ;
INSERT INTO IAMARKS VALUES ('1BI15CS101', '15CS63', 'CSE6A', 12, 15, 19, NULL);
INSERT INTO IAMARKS VALUES ('1BI15CS101', '15CS64', 'CSE6A', 20, 16, 18, NULL);
INSERT INTO IAMARKS VALUES ('1BI15CS101', '15CS65', 'CSE6A', 19, 20, 14, NULL);
INSERT INTO IAMARKS VALUES ('1BI15CS101', '15CS66', 'CSE6A', 17, 15, 20, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS034', '15CS81', 'CSE8A', 18, 17, 20, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS010', '15CS81', 'CSE8A', 8, 12, 16, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS088', '15CS81', 'CSE8B', 15, 10, 15, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS032', '15CS81', 'CSE8B', 13, 16, 19, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS012', '15CS81', 'CSE8C', 9, 10, 7, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS091', '15CS81', 'CSE8C', 12, 15, 20, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS034', '15CS82', 'CSE8A', 19, 17, 20, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS010', '15CS82', 'CSE8A', 9, 13, 14, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS088', '15CS82', 'CSE8B', 13, 20, 18, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS032', '15CS82', 'CSE8B', 8, 10, 20, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS012', '15CS82', 'CSE8C', 7, 9, 18, NULL);
INSERT INTO IAMARKS VALUES ('1BI14CS091', '15CS82', 'CSE8C', 11, 10, 8, NULL);


SELECT * FROM IAMARKS;