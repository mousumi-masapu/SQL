create database Hotel

create table Employees(
Id int Primary Key Identity,
FirstName nvarchar(30) not null,
LastName nvarchar(30) not null,
Title nvarchar(30),
Notes nvarchar(1000))

insert into Employees(FirstName, LastName, Title, Notes) values
('Mousumi','Masapu','sdjha','Employee1'),
('James','Cord','sdjha','Employee2'),
('Sammy','Micthel','sdjha','Employee3')

select * from Employees


create table Customers (
AccountNumber int Primary Key Identity,
FirstName nvarchar(30) not null,
LastName nvarchar(30) not null,
PhoneNumber nvarchar(30) not null,
EmergencyName nvarchar(30),
EmergencyNumber nvarchar(30),
Notes nvarchar(100))

insert into Customers(FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes) values
('Gabreil','G','44654654654','Gabriel','5675675677','Customer1'),
('Jammy','Bolt','4323534543','Jammy','23424242344','Customer2'),
('Sam','M','7686786788','Sam','87876868686','Customer3')

create table RoomStatus (
RoomStatus nvarchar(20) primary key not null,
Notes nvarchar(1000))

insert into RoomStatus(RoomStatus, Notes) values
('Available','Available'),
('Occupied','Available'),
('Unavailable','Unavailable')

create table RoomTypes(
RoomTypes nvarchar(50) primary key not null,
Notes nvarchar(1000))

drop table RoomTypes

insert into RoomTypes(RoomTypes, Notes) values
('Single Bedroom','1BHK'),
('Double Bed Room','2BHK'),
('Triple Bed Room','3BHK')


create table BedTypes (
BedType nvarchar(50) primary key not null,
Notes nvarchar(1000))


insert into BedTypes(BedType, Notes) values
('Single Bed','hfgh'),
('Double Bed','2BHghfK'),
('Bunker Bed','3gfhfBHK')

create table Rooms(

	RoomNumber INT PRIMARY KEY NOT NULL,

	RoomType NVARCHAR(50) FOREIGN KEY REFERENCES RoomTypes(RoomTypes) NOT NULL,

	BedType NVARCHAR(50) FOREIGN KEY REFERENCES BedTypes(BedType) NOT NULL,

	Rate DECIMAL(6,2) NOT NULL,

	RoomStatus NVARCHAR(20) NOT NULL,

	Notes NVARCHAR(1000))


select * from Rooms