create database Lexicon

create table Towns (

	Id int primary key identity not null,

	Name nvarchar(50) not null

)

 create table Addresses (

	Id int primary key identity not null,

	AddressText nvarchar(100) not null,

	TownId int foreign key references Towns(Id) NOT NULL

)

create table Departments (

	Id int primary key identity not null,

	Name nvarchar(50) not null

)

CREATE TABLE Employees (

	Id int primary key identity not null,

	FirstName nvarchar(50) not null,

	MiddleName nvarchar(50) not null,

	LastName  nvarchar(50) not null,

	JobTitle nvarchar(80) not null,

	DepartmentId int foreign key references Departments(Id) not null,

	HireDate date,

	Salary decimal(7,2),

	AddressId int foreign key references Addresses(Id)

)

alter table Employees

add Name as FirstName +' '+ MiddleName +' ' + Lastname not null

insert into Towns (Name) values
('Sofia'), 
('Plovdiv'), 
('Varna'),
('Burgas')

insert into Departments(Name) values
( 'Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

select * from Departments

insert into Employees(FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary) values
('Mel','Gibson','Gibson','.NET Developer',4,'01/02/2013',3500.00 ),
('Chuck','Norris','Norris','Senior Engineer',1,'02/03/2004 ',4000.00 ),
('Greta','Garbo','Garbo','Intern',5,'08/08/2016',525.25 ),
('Meryl','Strep','Strep','CEO',2,'09/12/2007 ',3000.00 ),
('Peter','Pan','Pan','Intern',3,'08/08/2016',599.88 )


select CONCAT(FirstName , ' ' , MiddleName , ' ' , Lastname) as Name,JobTitle, DepartmentId, HireDate, Salary from Employees

select * from Towns

select * from Departments

select * from Employees

select * from Towns order by Name 

select * from Departments order by Name 


select * from Employees order by Salary desc 

select Name from Towns order by Name 

select Name from Departments order by Name 

select FirstName, LastName, JobTitle, Salary  from Employees



Update Employees 
set Salary=Salary*1.1

select Salary from Employees


BACKUP DATABASE Lexicon
TO DISK = 'D:\SQL Lexicon DB BackUp\LexiconDB.bak'

Drop database Lexicon

Restore Database Lexicon from Disk='D:\SQL Lexicon DB BackUp\LexiconDB.bak'







