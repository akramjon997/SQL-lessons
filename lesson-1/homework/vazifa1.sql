data is a raw information which is not processed or organised yet. It could be a sybols, words, pictures or anything else.
database is electronic storage of organised or related data or collection of it
relational database - data stored in tables  that are interconnected by common fields
table is a collection of related date arranged in rows and collumns.

  5 key feature of Sql Server
  1. Database engine- The core service for storing, processing and securing data.
  2. SQL Server management studio (SSMS) a powerful graphical tool for managing databases, writing queries, backing up/restoring, and monitoring performance.
  3. Security  Features- includes authentication, authorization, encryption and row-level security to protect data from unauthorized access.
  4. High availability and Disaster Recovery- Features like Always on availability groups, failover clustering, 
  database mirroring ensure databases remain available  dur ing failures 
  5. Business Intelligence (BI) and Analytics- Integreated tools such as Sql Server Reporting services (SSRS), 
  integration Services (SSIS), and Analysis Services (SSAS) support data analysis, etl, and report generation.
1. Authentication modes: Windows authentication mode  and SQL server authentication mode
  
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
