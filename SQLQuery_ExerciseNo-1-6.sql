Create Database Minions

Create Table Minions(
Id int not null Primary Key Identity,
Name nvarchar(50) not null,
Age int not null)

Create Table Towns(
Id int not null Primary Key Identity,
Name nvarchar(50) not null)


Alter Table Minions add TownId int not null


Alter Table Minions add constraint Minions_TownId_FK
Foreign Key (TownId) references Towns(Id)



Insert into Minions(Name,Age) values
('Kevin', 22),
('Bob',15),
('Steward',NULL)

Alter Table Minions 
alter column Age int null 

Alter Table Minions 
alter column TownId int not null 


select * from Minions

Alter Table Minions
alter column TownId int not null

Update Minions set 
TownId=1 
where Name='Kevin'

Update Minions set 
TownId=3 
where Name='Bob'

Update Minions set 
TownId=2 
where Name='Steward'

Update Minions set 
TownId=100
where Name='Steward'


Insert into Towns(Name) values
('Sofia'),
('Peter'),
('Victoria')

select * from Towns

truncate table Minions

Drop Table Minions

Drop Table Towns





