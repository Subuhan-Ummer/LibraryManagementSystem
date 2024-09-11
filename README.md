# LibraryManagementSystem
Library Management System
This project is a simple Library Management System built using MySQL. It keeps track of all the information about books in the library, including their availability, costs, and status. It also manages information related to library branches, employees, customers, and the process of issuing and returning books.

Database Structure
The database for this project is named library and contains the following tables:

1. Branch
Stores information about the library branches.

Branch_no (Primary Key)
Manager_Id
Branch_address
Contact_no
2. Employee
Stores information about the employees working at different branches.

Emp_Id (Primary Key)
Emp_name
Position
Salary
Branch_no (Foreign Key, references Branch_no in Branch table)
3. Books
Stores details about the books available in the library.

ISBN (Primary Key)
Book_title
Category
Rental_Price
Status (Yes if available, No if not available)
Author
Publisher
4. Customer
Stores information about the customers registered with the library.

Customer_Id (Primary Key)
Customer_name
Customer_address
Reg_date (Registration date)
5. IssueStatus
Keeps track of the books issued to customers.

Issue_Id (Primary Key)
Issued_cust (Foreign Key, references Customer_Id in Customer table)
Issued_book_name
Issue_date
Isbn_book (Foreign Key, references ISBN in Books table)
6. ReturnStatus
Keeps track of the books returned by customers.

Return_Id (Primary Key)
Return_cust
Return_book_name
Return_date
Isbn_book2 (Foreign Key, references ISBN in Books table)
