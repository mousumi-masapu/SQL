create database CarRental

create table Categories(
Id int Primary Key Identity,
CategoryName nvarchar(50) not null,
DailyRate decimal(6,2) not null,
WeeklyRate decimal(6,2) not null,
MonthlyRate decimal(6,2) not null,
WeekendRate decimal(6,2) not null)

create table Cars(
Id int Primary Key Identity,
PlateNumber nvarchar(20)not null unique,
Manufacturer nvarchar(30) not null,
Model nvarchar(30) not null,
CarYear int not null,
CategoryId int foreign key references Categories(Id),
Doors int,
Picture Varbinary(max),
Condition nvarchar(50),
Available bit not null)

Create table Employees(
Id int Primary Key Identity,
FirstName nvarchar(30) not null,
LastName nvarchar(30) not null,
Title nvarchar(30),
Notes nvarchar(100))

Create table Customers(
Id int Primary Key Identity,
DriverLicenseNumber nvarchar(20) not null unique,
FullName nvarchar(50) not null,
Address nvarchar(100) not null,
City nvarchar(20)not null,
ZipCode nvarchar(10),
Notes nvarchar(1000))


Create table RentalOrders(
Id int Primary Key Identity,
EmployeeId int foreign key references Employees(Id),
CustomerId int foreign key references Customers(Id),
CardId int foreign key references Cars(Id),
TankLevel int not null,
KilometrageStart int not null,
KilometrageEnd int not null,
TotalKilometrage as KilometrageEnd- KilometrageStart,
StartDate date not null,
EndDate date not null,
TotalDays as DATEDIFF(DAY, StartDate, EndDate),
RateApplied int not null,
TaxRate as  RateApplied * 0.2,
OrderStatus nvarchar(10) not null,
Notes nvarchar(1000))


insert into Categories(CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) values
('SUV',4545.45,4657.89,2321.67,1235.65),
('Sedan',2545.45,8657.89,1321.67,4235.65),
('HatchBack',3545.45,5657.89,1321.67,5235.65)

insert into Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available) values
('M6574MS', 'Toyota', 'A6', 2001, 1, 4, NULL, 'Good', 1),
('C6594MO', 'Volkswagen', 'A7', 2000, 3, 4, NULL, 'Good', 1),
('T7504MS', 'Hyundai', 'A8', 2000, 2, 4, NULL, 'Good', 1)

insert into Employees(FirstName, LastName, Title, Notes) values
('Mousumi','Masapu','sdjha','Employee1'),
('James','Cord','sdjha','Employee2'),
('Sammy','Micthel','sdjha','Employee3')

insert into Customers(DriverLicenseNumber, FullName, Address, City, ZIPCode, Notes) values
('BT18765P1', 'Mousumi Masapu', 'Sollentuna', 'Stockholm',53453,'gfdgf'),
('AH18865P2', 'Army Thomas', 'Solna', 'Stockholm',453435,'fgdf'),
('BT68765P3', 'John Bolt', 'Kista', 'Stockholm',8776867,'fdgdfgd')

insert into RentalOrders(EmployeeId, CustomerId, CardId, TankLevel, KilometrageStart, KilometrageEnd, StartDate, EndDate, RateApplied,OrderStatus, Notes) values
(1, 2, 8, 55, 13025, 29805, '2019-08-18', '2019-09-18', 250, 'Available','gdjsahakj')

insert into RentalOrders(EmployeeId, CustomerId, CardId, TankLevel, KilometrageStart, KilometrageEnd, StartDate, EndDate, RateApplied,OrderStatus, Notes) values
(2, 1, 9, 55, 13125, 39805, '2019-10-08', '2019-10-18', 150, 'Available','gdjsahakj'),
(3, 3, 10, 55, 23025, 49805, '2019-08-26', '2019-09-18', 200, 'Available','gdjsahakj')


Delete from Cars where id in(5,6,7)

select * from Cars

select * from RentalOrders

