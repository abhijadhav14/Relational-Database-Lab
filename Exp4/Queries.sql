
CREATE TABLE STUDENT (
    USN VARCHAR(10) PRIMARY KEY,
    SName VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    Phone VARCHAR(15),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F'))
);

CREATE TABLE SEMSEC (
    SSID INT PRIMARY KEY AUTO_INCREMENT,
    Sem INT NOT NULL CHECK (Sem BETWEEN 1 AND 8),
    Sec CHAR(1) NOT NULL
);

CREATE TABLE CLASS (
    USN VARCHAR(10),
    SSID INT,
    PRIMARY KEY (USN, SSID),
    FOREIGN KEY (USN) REFERENCES STUDENT(USN) ON DELETE CASCADE,
    FOREIGN KEY (SSID) REFERENCES SEMSEC(SSID) ON DELETE CASCADE
);

CREATE TABLE SUBJECT (
    Subcode VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Sem INT NOT NULL CHECK (Sem BETWEEN 1 AND 8),
    Credits INT CHECK (Credits > 0)
);

CREATE TABLE IAMARKS (
    USN VARCHAR(10),
    Subcode VARCHAR(10),
    SSID INT,
    Test1 INT CHECK (Test1 BETWEEN 0 AND 50),
    Test2 INT CHECK (Test2 BETWEEN 0 AND 50),
    Test3 INT CHECK (Test3 BETWEEN 0 AND 50),
    FinalIA INT CHECK (FinalIA BETWEEN 0 AND 100),
    PRIMARY KEY (USN, Subcode, SSID),
    FOREIGN KEY (USN) REFERENCES STUDENT(USN) ON DELETE CASCADE,
    FOREIGN KEY (Subcode) REFERENCES SUBJECT(Subcode) ON DELETE CASCADE,
    FOREIGN KEY (SSID) REFERENCES SEMSEC(SSID) ON DELETE CASCADE
);


INSERT INTO STUDENT (USN, SName, Address, Phone, Gender) VALUES
('1RV21CS001', 'John Doe', '123 Elm St', '9876543210', 'M'),
('1RV21CS002', 'Jane Smith', '456 Pine Ave', '8765432109', 'F'),
('1RV21CS003', 'Alice Johnson', '789 Oak Blvd', '7654321098', 'F'),
('1RV21CS004', 'Bob Brown', '101 Maple Rd', '6543210987', 'M'),
('1RV21CS005', 'Charlie White', '202 Cedar Ln', '5432109876', 'M');


INSERT INTO SEMSEC (Sem, Sec) VALUES
(5, 'A'),
(5, 'B'),
(6, 'A'),
(6, 'B'),
(3, 'A');


INSERT INTO CLASS (USN, SSID) VALUES
('1RV21CS001', 1), 
('1RV21CS002', 1), 
('1RV21CS003', 2), 
('1RV21CS004', 3), 
('1RV21CS005', 4); 


INSERT INTO SUBJECT (Subcode, Title, Sem, Credits) VALUES
('CS101', 'Database Systems', 5, 4),
('CS102', 'Data Structures', 5, 3),
('CS201', 'Operating Systems', 6, 4),
('CS202', 'Computer Networks', 6, 3),
('CS301', 'Artificial Intelligence', 3, 4);


INSERT INTO IAMARKS (USN, Subcode, SSID, Test1, Test2, Test3, FinalIA) VALUES
('1RV21CS001', 'CS101', 1, 45, 42, 48, 88), 
('1RV21CS002', 'CS101', 1, 40, 38, 44, 82), 
('1RV21CS003', 'CS102', 2, 35, 40, 45, 85), 
('1RV21CS004', 'CS201', 3, 50, 48, 50, 95), 
('1RV21CS005', 'CS202', 4, 25, 30, 40, 65); 



-- Select all columns and rows from the STUDENT table
SELECT * FROM STUDENT;

-- Retrieve the names and phone numbers of students where the gender is Female
SELECT SName, Phone 
FROM STUDENT 
WHERE Gender = 'F';

-- Retrieve details of students who are in a specific semester and section
SELECT S.USN, S.SName, S.Address, S.Phone, S.Gender 
FROM STUDENT S 
JOIN CLASS C ON S.USN = C.USN  
JOIN SEMSEC SS ON C.SSID = SS.SSID  
WHERE SS.Sem = 5 AND SS.Sec = 'A'; 

-- Retrieve the subject code, title, and credits for subjects in a specific semester
SELECT Subcode, Title, Credits 
FROM SUBJECT 
WHERE Sem = 3;

-- Calculate the average Final IA marks for a specific subject
SELECT AVG(FinalIA) AS AverageMarks 
FROM IAMARKS 
WHERE Subcode = 'CS101';

-- Retrieve details of students who scored more than 40 marks in Test1 for a specific subject
SELECT S.USN, S.SName, I.Test1 
FROM STUDENT S 
JOIN IAMARKS I ON S.USN = I.USN  
WHERE I.Test1 > 40 AND I.Subcode = 'CS101'; 


-- Retrieve student details along with their semester and section
SELECT S.USN, S.SName, SS.Sem, SS.Sec 
FROM STUDENT S 
JOIN CLASS C ON S.USN = C.USN  
JOIN SEMSEC SS ON C.SSID = SS.SSID; 


-- Retrieve subject titles and credits sorted by credits in descending order
SELECT Title, Credits 
FROM SUBJECT 
ORDER BY Credits DESC;

-- Count the number of students in a specific semester and section
SELECT COUNT(S.USN) AS TotalStudents 
FROM STUDENT S 
JOIN CLASS C ON S.USN = C.USN  
JOIN SEMSEC SS ON C.SSID = SS.SSID  
WHERE SS.Sem = 6 AND SS.Sec = 'B'; 

-- Find the highest Final IA marks for each subject
SELECT I.Subcode, MAX(I.FinalIA) AS HighestMarks 
FROM IAMARKS I 
GROUP BY I.Subcode; 


-- Calculate the total marks for all subjects for each student
SELECT S.USN, S.SName, SUM(I.FinalIA) AS TotalMarks 
FROM STUDENT S 
JOIN IAMARKS I ON S.USN = I.USN  
GROUP BY S.USN, S.SName; 


-- Retrieve details of students who scored less than 40 in Final IA marks
SELECT S.USN, S.SName, I.Subcode, I.FinalIA 
FROM STUDENT S 
JOIN IAMARKS I ON S.USN = I.USN 
WHERE I.FinalIA < 40; 


-- Count the number of distinct sections in each semester
SELECT Sem, COUNT(DISTINCT Sec) AS TotalSections 
FROM SEMSEC 
GROUP BY Sem; 
