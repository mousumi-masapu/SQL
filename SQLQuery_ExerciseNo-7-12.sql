create table People (
Id int primary key identity,
Name nvarchar(200) not null ,
Picture varbinary(max) check (datalength(picture)>1024*1024*2) ,
Height decimal(5,2),
Weight decimal(5,2),
Gender varchar(1) not null check(Gender in('m','f')),
BirthDate date not null,
Biography nvarchar(max))

select * from People

insert into People(Name,Picture,Height,Weight,Gender,BirthDate,Biography) values
('Mousumi',NULL,2.25,56.20,'f','29-JUN-04','Software Developer')

insert into People(Name,Picture,Height,Weight,Gender,BirthDate,Biography) values
('Masapu',NULL,3.25,58.20,'f','01-JUL-06','Software Programmer'),
('Jim',NULL,4.15,70.10,'m','25-AUG-02','Tester'),
('Tom',NULL,2.15,71.30,'m','15-SEP-05','Frontend Developer'),
('Mary',NULL,3.05,55.10,'f','30-AUG-02','Backend Developer')

create table Users (
Id int not null unique identity,
Username varchar(30)unique not null ,
Password varchar(26) not null ,
ProfilePicture varbinary(max) check (datalength(ProfilePicture)<900*1024) ,
LastLoginTime datetime,
IsDeleted bit,
)

insert into Users(Username,Password,ProfilePicture,LastLoginTime,IsDeleted) values
('Mousumi','123456',null,null,1),
('Masapu','abcdef',null,null,0),
('Ronald','qrstuv',null,null,0),
('Jane','564321',null,null,1),
('Jimmy','uvwxyz',null,null,1)

select * from Users

select * from Users

alter table Users add Primary Key (Id)

ALTER TABLE Users
DROP constraint PK__Users__3214EC0791CB845B

Alter Table Users
Add Constraint PK_Users Primary Key (Id,Username)



ALTER TABLE Users 
ADD CONSTRAINT Users_Password_CK CHECK (LEN(Password)<=5)

ALTER TABLE Users
DROP constraint Users_Password_CK

ALTER TABLE Users
DROP constraint df_LastLoginTime

Alter Table Users
add default GetDate() for LastLoginTime

ALTER TABLE Users
ADD CONSTRAINT df_LastLoginTime
DEFAULT 'GetDate()' FOR LastLoginTime;

ALTER TABLE Users
DROP constraint PK__Users__3214EC0791CB845B



create trigger tr_Users on Users 
after insert
as
begin
update Users set LastLoginTime = GetDate() where LastLoginTime is null
end

insert into Users(Username,Password,ProfilePicture,LastLoginTime,IsDeleted) values
('John','189456',null,null,0)

select * from Users

update Users set Username='MMM' where Id=1
update Users set Username='AAA' where Id=2
update Users set Username='SSS' where Id=3
update Users set Username='JJJ' where Id=4
update Users set Username='YYY' where Id=5


update Users set Password='fgfdfdddddddgdfg' where Id=5


ALTER TABLE Users

drop constraint PK_Users

alter table Users
add constraint PK_Id
primary key (Id)

alter table Users
add constraint uq_Username
unique(Username)

ALTER TABLE Users
ADD CONSTRAINT CK_Username CHECK (LEN(Username) <= 3)

update Users set Username='MMMMMM' where Id=1

insert into Users(Username,Password,ProfilePicture,LastLoginTime,IsDeleted) values
('Mousumi',NULL,3.25,58.20,'f','01-JUL-06','Software Programmer'),
('Jim',NULL,4.15,70.10,'m','25-AUG-02','Tester'),
('Tom',NULL,2.15,71.30,'m','15-SEP-05','Frontend Developer'),
('Mary',NULL,3.05,55.10,'f','30-AUG-02','Backend Developer')


