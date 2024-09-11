-- creating database named 'Library'.
CREATE DATABASE Library;
USE Library;

-- creating 'Branch' table. 
CREATE TABLE Branch (
	Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255), 
    Contact_no VARCHAR(15)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 Main St', '123-456-7890'),
(2, 102, '456 Elm St', '987-654-3210'),
(3, 103, '789 Oak St', '555-555-5555'),
(4, 104, '101 Walnut St', '111-222-3333'),
(5, 105, '202 Cherry St', '444-555-6666');

-- creating 'Employee' table. 
CREATE TABLE Employee (
	Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT, 
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(101, 'Alice Johnson', 'Manager', 75000, 1),
(102, 'Bob Smith', 'Manager', 72000, 2),
(103, 'Carol White', 'Manager', 68000, 3),
(104, 'David Brown', 'Librarian', 45000, 1),
(105, 'Eve Davis', 'Assistant Librarian', 38000, 2),
(106, 'Frank Black', 'Librarian', 47000, 3),
(107, 'Grace Green', 'Librarian', 48000, 4),
(108, 'Henry Blue', 'Assistant Librarian', 40000, 5),
(109, 'Ivy Yellow', 'Librarian', 52000, 1),
(110, 'Jake Purple', 'Manager', 76000, 5);


-- creating 'Books' table. 
CREATE TABLE Books (
	ISBN VARCHAR(13) PRIMARY KEY, 
    Book_title VARCHAR(255), 
    Category VARCHAR(100), 
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) CHECK (Status IN ('Yes', 'No')),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('9780131103627', 'Introduction to Algorithms', 'Computers', 30.00, 'Yes', 'Cormen', 'MIT Press'),
('9780321573513', 'The Art of Computer Programming', 'Computers', 35.00, 'No', 'Knuth', 'Addison-Wesley'),
('9780596009205', 'Design Patterns', 'Computers', 28.50, 'Yes', 'Gamma', 'O\'Reilly'),
('9780140449266', 'History of the Peloponnesian War', 'History', 15.00, 'Yes', 'Thucydides', 'Penguin'),
('9780679720201', 'Sapiens: A Brief History of Humankind', 'History', 25.00, 'No', 'Harari', 'Harper'),
('9780199535569', 'The Iliad', 'History', 20.00, 'Yes', 'Homer', 'Oxford'),
('9780393347098', 'The Guns of August', 'History', 18.00, 'Yes', 'Tuchman', 'Penguin'),
('9780143105985', 'The Odyssey', 'History', 22.00, 'No', 'Homer', 'Penguin'),
('9780525566154', 'Atomic Habits', 'Self-Help', 15.00, 'Yes', 'James Clear', 'Avery'),
('9781785042457', 'Ikigai', 'Self-Help', 12.00, 'No', 'Hector Garcia', 'Penguin'),
('9780062316110', 'The Power of Habit', 'Self-Help', 14.00, 'Yes', 'Charles Duhigg', 'Random House'),
('9780307476074', 'Outliers', 'Self-Help', 20.00, 'No', 'Malcolm Gladwell', 'Back Bay Books'),
('9780307947307', 'The Tipping Point', 'Self-Help', 22.00, 'Yes', 'Malcolm Gladwell', 'Back Bay Books'),
('9781444789570', '12 Rules for Life', 'Self-Help', 19.00, 'Yes', 'Jordan Peterson', 'Penguin');



-- creating 'Customer' table. 
CREATE TABLE Customer (
	Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100), 
    Customer_address VARCHAR(255),
    Reg_date DATE 
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(201, 'John Doe', '111 Birch St', '2021-05-15'),
(202, 'Jane Roe', '222 Maple St', '2020-10-22'),
(203, 'Michael Fox', '333 Pine St', '2022-03-05'),
(204, 'Alice Wonderland', '444 Oak St', '2023-01-17'),
(205, 'Bob Marley', '555 Cedar St', '2023-03-21'),
(206, 'Clara Oswald', '666 Redwood St', '2021-12-11'),
(207, 'David Tennant', '777 Aspen St', '2019-06-15'),
(208, 'Ella Fitzgerald', '888 Spruce St', '2020-08-05');


-- creating 'IssueStatus' table. 
CREATE TABLE IssueStatus (
	Issue_Id INT PRIMARY KEY,
    Issued_cust INT, 
    Issued_book_name VARCHAR(255), 
    Issue_date DATE, 
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 201, 'Introduction to Algorithms', '2023-06-15', '9780131103627'),
(2, 202, 'The Iliad', '2023-06-17', '9780199535569'),
(3, 203, 'Design Patterns', '2023-05-10', '9780596009205'),
(4, 204, 'Atomic Habits', '2023-06-12', '9780525566154'),
(5, 205, 'The Power of Habit', '2023-06-18', '9780062316110'),
(6, 206, 'The Guns of August', '2022-11-01', '9780393347098'),
(7, 207, 'The Odyssey', '2022-08-20', '9780143105985');


-- creating 'ReturnStatus' table. 
CREATE TABLE ReturnStatus (
	Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 201, 'Introduction to Algorithms', '2023-06-20', '9780131103627'),
(2, 202, 'The Iliad', '2023-06-25', '9780199535569'),
(3, 204, 'Atomic Habits', '2023-06-20', '9780525566154'),
(4, 205, 'The Power of Habit', '2023-06-25', '9780062316110');

-- Retrieving the book title, category and rental price of all available bookes. 
SELECT Book_title, Category, Rental_price FROM Books WHERE Status = 'Yes';

-- employee names and their respective salaries in descending order of salary. 
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- retrieving the book titles and the corresponding customers who have issued those books. 
SELECT Book_title, Customer_name FROM Books 
JOIN IssueStatus  ON ISBN = Isbn_book
JOIN Customer ON Issued_cust = Customer_Id;

-- display the total count of books in each category. 
SELECT Category, COUNT(*) AS TotalBooks FROM Books GROUP BY Category;

-- retrieve the employee names and their positions for employees whose salaries are above Rs.50,000. 
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- list the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT Customer_name FROM Customer 
LEFT JOIN IssueStatus ON Customer_Id = Issued_cust
WHERE Reg_date < '2022-01-01' AND Issued_cust IS NULL;

-- display the branch numbers and the total count of employees in each branch
SELECT Branch_no, COUNT(*) AS EmployeeCount FROM Employee GROUP BY Branch_no;

-- display the names of customers who have issued books in the month of june 2023. 
SELECT Customer_name FROM Customer
JOIN IssueStatus ON Customer_Id = Issued_cust
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;

-- retrieve 'book_title' from 'Books' table containing 'history'. 
SELECT Book_title FROM Books WHERE Book_title LIKE '%history%';

-- retrieve the branch numbers along with the count of employees for branches having more than 5 employees. 
SELECT Branch_no, COUNT(*) AS EmployeeCount FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

-- retrieve the names of employees who manage branches and their respective branch addresses. 
SELECT Emp_name, Branch_address FROM Employee JOIN Branch ON Emp_Id = Manager_Id;




