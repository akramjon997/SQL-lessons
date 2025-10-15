1. Bulk insert is the fastest way to insert data on sql server. It could be imported from external files and servers even transformed from other data types.
2. 1. CSV (.csv)- comma seperated values file
   2. TXT(.txt)- Text file that can use tabs(\t), spaces or custom determiners.
   3.XML (.xml)- Extensive Markup Language file that stores structured, hieratchical data.
   4.Excel(.xls/ .xlsx)- Excel format imported through OPPENROWSET, SSIS or Import Wizard.
3.	Create  table Products( ProductID int primary key, ProductName varchar (50), Price decimal (10,2))
4. insert into Products(ProductId, ProductName, Category, price) values (1, 'TV','Home Appliances', 500) 
	 insert into Products(ProductId, ProductName, Category, price) values (2, 'Bycycle','Toys', 100)
	 insert into Products(ProductId, ProductName, Category, price) values (3, 'Screwdriver','Construction', 10)
5. Null is where data is unavaliable, while not null filters rows with available data on it.
6.Alter table Products
	Add constraint uq_ProductName Unique (ProductName)
7./* Unique Contraint ensures that 2 rows does not have the same name on a given column. For example: IDs,Usernames, emails cannot be the same and duplicate*/
8.Alter table Products
	Add CategoryID int
9.	Create table Categories (CategoryId int Primary key, CategoryName varchar (100) Unique)
10. In Sql Server, an IDENTITY column  is a special type of column that 
automatically generates numeric values for each new row - usually used for unique Ids like primary key.
11. Bulk Insert Products From 'c:\Data\Products.txt' with (Fieldterminator=','Rowterminator='\n', Firstrow=2)
12.Alter table Products 
	Add Constraint FK_Products_Categories
	Foreign key (CategoryID)
	References Categories(CategoryId)
13. Primary key automatically creates clustered index, it cannot be Null or have a duplicate. there can be only 1 Primary key on a table.
On the other hand Unique key creates non-clustered index, it can have one Null value just not duplicates.
There can be 1 to many unique key on a table. For email, 
username, phone number, etc.
14.Alter table Products 
	Add Constraint CK_Price_Positive
	Check (Price>0)
15.ALter table Products 
	Add Stock int not null default 0
16.	Update Products
	Set Price=ISNULL(Price,0)
17.A Foreign Key is a constraint used to link two tables together-it ensures thet the value in one table must exist in another.
It maintains referential integrity between related tables. 
Foreign key Maintains data comsistency and prevents inserting values that don't exist in the parent table.
Foreign key ensures that every child record has avalid parent. It also simplifies updating and deleting related data.
18.CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Email VARCHAR(100),
    CONSTRAINT chk_Customer_Age CHECK (Age >= 18)
19.	 Create table Students( StudentID int primary key identity (100,10), 
	 StudentName varchar (50), 
	 StudentFaculty varchar(50))
20.
