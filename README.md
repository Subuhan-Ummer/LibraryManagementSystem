# Library Management System

This project is a simple Library Management System built using MySQL. It keeps track of all the information about books in the library, including their availability, costs, and status. It also manages information related to library branches, employees, customers, and the process of issuing and returning books.

## Database Structure

The database for this project is named **`library`** and contains the following tables:

### 1. Branch
Stores information about the library branches.
- **Branch_no** (Primary Key)
- **Manager_Id**
- **Branch_address**
- **Contact_no**

### 2. Employee
Stores information about the employees working at different branches.
- **Emp_Id** (Primary Key)
- **Emp_name**
- **Position**
- **Salary**
- **Branch_no** (Foreign Key, references `Branch_no` in `Branch` table)

### 3. Books
Stores details about the books available in the library.
- **ISBN** (Primary Key)
- **Book_title**
- **Category**
- **Rental_Price**
- **Status** (Yes if available, No if not available)
- **Author**
- **Publisher**

### 4. Customer
Stores information about the customers registered with the library.
- **Customer_Id** (Primary Key)
- **Customer_name**
- **Customer_address**
- **Reg_date** (Registration date)

### 5. IssueStatus
Keeps track of the books issued to customers.
- **Issue_Id** (Primary Key)
- **Issued_cust** (Foreign Key, references `Customer_Id` in `Customer` table)
- **Issued_book_name**
- **Issue_date**
- **Isbn_book** (Foreign Key, references `ISBN` in `Books` table)

### 6. ReturnStatus
Keeps track of the books returned by customers.
- **Return_Id** (Primary Key)
- **Return_cust**
- **Return_book_name**
- **Return_date**
- **Isbn_book2** (Foreign Key, references `ISBN` in `Books` table)

## Queries

This project includes various SQL queries to manage the library and retrieve specific information:

1. **Retrieve the book title, category, and rental price of all available books:**
    ```sql
    SELECT Book_title, Category, Rental_Price
    FROM Books
    WHERE Status = 'Yes';
    ```

2. **List the employee names and their respective salaries in descending order of salary:**
    ```sql
    SELECT Emp_name, Salary
    FROM Employee
    ORDER BY Salary DESC;
    ```

3. **Retrieve the book titles and the corresponding customers who have issued those books:**
    ```sql
    SELECT B.Book_title, C.Customer_name
    FROM Books B
    JOIN IssueStatus I ON B.ISBN = I.Isbn_book
    JOIN Customer C ON I.Issued_cust = C.Customer_Id;
    ```

4. **Display the total count of books in each category:**
    ```sql
    SELECT Category, COUNT(*) AS Total_Books
    FROM Books
    GROUP BY Category;
    ```

5. **Retrieve the employee names and their positions for employees whose salaries are above Rs. 50,000:**
    ```sql
    SELECT Emp_name, Position
    FROM Employee
    WHERE Salary > 50000;
    ```

6. **List the customer names who registered before 2022-01-01 and have not issued any books yet:**
    ```sql
    SELECT C.Customer_name
    FROM Customer C
    LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
    WHERE C.Reg_date < '2022-01-01'
    AND I.Issued_cust IS NULL;
    ```

7. **Display the branch numbers and the total count of employees in each branch:**
    ```sql
    SELECT Branch_no, COUNT(*) AS Employee_Count
    FROM Employee
    GROUP BY Branch_no;
    ```

8. **Display the names of customers who have issued books in the month of June 2023:**
    ```sql
    SELECT C.Customer_name
    FROM Customer C
    JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
    WHERE I.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';
    ```

9. **Retrieve book titles containing the word "History":**
    ```sql
    SELECT Book_title
    FROM Books
    WHERE Book_title LIKE '%History%';
    ```

10. **Retrieve branch numbers and employee count for branches with more than 5 employees:**
    ```sql
    SELECT Branch_no, COUNT(*) AS Employee_Count
    FROM Employee
    GROUP BY Branch_no
    HAVING COUNT(*) > 5;
    ```

11. **Retrieve the names of employees who manage branches and their branch addresses:**
    ```sql
    SELECT E.Emp_name, B.Branch_address
    FROM Employee E
    JOIN Branch B ON E.Emp_Id = B.Manager_Id;
    ```

12. **Display the names of customers who have issued books with a rental price higher than Rs. 25:**
    ```sql
    SELECT C.Customer_name
    FROM Customer C
    JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
    JOIN Books B ON I.Isbn_book = B.ISBN
    WHERE B.Rental_Price > 25;
    ```

## How to Use

1. Create the database and tables as per the structure described above.
2. Populate the tables with data (refer to the SQL scripts for inserting sample data).
3. Run the queries provided to retrieve information and manage the library system.

## Conclusion

This Library Management System demonstrates how a simple library can manage its books, employees, and customers using a relational database like MySQL. The project includes table creation, relationships, and various queries to extract meaningful data.
