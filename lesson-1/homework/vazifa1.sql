data is a raw information which is not processed or organised yet. It could be a sybols, words, pictures or anything else.
database is electronic storage of organised or related data or collection of it
relational database - data stored in tables  that are interconnected by common fields
table is a collection of related date arranged in rows and collumns.

Create database SchoolDB
  use SchoolDB
  Create table Students (StudentID INT PRIMARY KEY, Name VARCHAR(50), Age INT)
   Insert into Students (StudentID , Name, Age) values ( 1, 'Adam', 21)
   Insert into Students (StudentID , Name, Age) values(2, 'Noah', 22)
   Insert into Students (StudentID , Name, Age) values(3, 'Akram',21)
  Sql Structured query language  is a language to communicate with databases
  Sql Server is database management system that understands the language
  SSMS is an application to send SQL commands to database


DQL Data Query Language retrieves data - Select
DML Data manipulation language manage table data - Insert, Update, Delete
DDL Data definition language  defines structure - Create, Alter, Drop 
DCL Data control language manages access Grant, Revoke 
TCL Transaction Control Language manages transactions commit, rollback, savepoint. 
