# Relational-Database-Lab
I am studying RD lab during my 1st sem M.Tech in Amity University


List of Experiments


Exp 1. Consider the following schema for a Library Database:

BOOK(Book_id, Title, Publisher_Name, Pub_Year) BOOK_AUTHORS(Book_id, Author_Name) PUBLISHER(Name, Address, Phone) BOOK_COPIES(Book_id, Branch_id, No-of_Copies)
BOOK_LENDING(Book_id, Branch_id, Card_No, Date_Out, Due_Date) LIBRARY_BRANCH(Branch_id, Branch_Name, Address)

Write SQL queries to
1.Retrieve details of all books in the library – id, title, name of publisher, authors, number of copies in each branch, etc.
2.Get the particulars of borrowers who have borrowed more than 3 books, but from Jan 2017 to Jun 2017.
3.Delete a book in BOOK table. Update the contents of other tables to reflect this data manipulation operation.
4.Partition the BOOK table based on year of publication. Demonstrate its working with a simple query.
5.Create a view of all books and its number of copies that are currently available in the Library.


Exp 2. Consider the following schema for Order Database:

SALESMAN(Salesman_id, Name, City, Commission) CUSTOMER(Customer_id, Cust_Name, City, Grade, Salesman_id) ORDERS(Ord_No, Purchase_Amt, Ord_Date, Customer_id, Salesman_id)

Write SQL queries to:

Count the customers with grades above Bangalore’s average.
Find the name and numbers of all salesman who had more than one customer.
List all the salesman and indicate those who have and don’t have customers
in their cities (Use UNION operation.)
Create a view that finds the salesman who has the customer with the highest order of a day.
Demonstrate the DELETE operation by removing salesman with id 1000. All his orders must also be deleted.


Exp 3: Consider the schema for Movie Database:

ACTOR (Act_id, Act_Name, Act_Gender) DIRECTOR (Dir_id, Dir_Name, Dir_Phone)
MOVIES (Mov_id, Mov_Title, Mov_Year, Mov_Lang, Dir_id) MOVIE_CAST (Act_id, Mov_id, Role)
RATING (Mov_id, Rev_Stars) Write SQL queries to
List the titles of all movies directed by ’Hitchcock’.

Find the movie names where one or more actors acted in two or more movies.

List all actors who acted in a movie before 2000 and also in a movie after 2015 (use JOIN operation).

Find the title of movies and number of stars for each movie that has at least one rating and find the highest number of stars that movie received. Sort the result by movie title.
Update rating of all movies directed by ‘Steven Spielberg’ to 5.

EXP 4: Consider the schema for College Database:

STUDENT(USN, SName, Address, Phone, Gender) SEMSEC(SSID, Sem, Sec)
CLASS(USN, SSID)
SUBJECT(Subcode, Title, Sem, Credits)
IAMARKS(USN, Subcode, SSID, Test1, Test2, Test3, FinalIA)

Write SQL queries to
List all the student details studying in fourth semester ‘C’ section.
Compute the total number of male and female students in each semester and in
each section.
Create a view of Test1 marks of student USN ‘1BI15CS101’ in all subjects.
Calculate the FinalIA (average of best two test marks) and update the corresponding table for all students.
Categorize students based on the following criterion:
If FinalIA = 17 to 20 then CAT = ‘Outstanding’ If FinalIA = 12 to 16 then CAT = ‘Average’
If FinalIA< 12 then CAT = ‘Weak’
Give these details only for 8th semester A, B, and C section students.

Exp 5: Consider the schema for Company Database:

EMPLOYEE(SSN, Name, Address, Sex, Salary, SuperSSN, DNo) DEPARTMENT(DNo, DName, MgrSSN, MgrStartDate) DLOCATION(DNo, DLoc)
PROJECT(PNo, PName, PLocation, DNo) WORKS_ON(SSN, PNo, Hours)

Write SQL queries to
Make a list of all project numbers for projects that involve an employee whose last name is ‘Scott’, either as a worker or as a manager of the department that controls the project.
Show the resulting salaries if every employee working on the ‘IoT’ project is
given a 10 percent raise.
Find the sum of the salaries of all employees of the ‘Accounts’ department, as well as the maximum salary, the minimum salary, and the average salary in this department.
Retrieve the name of each employee who works on all the projects controlled by department number 5 (use NOT EXISTS operator).
For each department that has more than five employees, retrieve the department number and the number of its employees who are making more than Rs. 6,00,000.
