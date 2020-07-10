create table Clients(Id int primary key  identity,FirstName nvarchar(50) not null,LastName nvarchar(50) not null)

select * from Clients

create table AccountTypes(Id int primary key identity,[Name] nvarchar(50) not null)

select * from AccountTypes

create table Accounts(Id int Primary key identity, int foreign key references AccountTypes(Id),
Balance decimal(15,2)not null default(0),ClientId int foreign key references Clients(Id))

select * from Accounts

Insert into Clients(FirstName,LastName) values
('Greta','Andersson'),
('Peter','Petersson'),
('Mel','Gibson'),
('Maria','Danielsson')

Insert into AccountTypes(Name) values
('Checking'),
('Savings')

Insert into Accounts(ClientId,AccountTypeId,Balance) values
(1,1,175),
(2,1,275.56),
(3,1,138.01),
(4,1,40.30),
(4,2,375.50)

create view v_ClientBalance as select(FirstName + '' + LastName) as Name,(AccountTypes.Name) as AccountType,Balance from Clients
join Accounts ON ClientId=Accounts.Id
join AccountTypes on AccountTypes.Id=Accounts.Id;

select * from v_ClientBalance

create function f_CalaculateTotalBalance(@ClientId int)
returns decimal(15,2)
begin
declare @result as decimal(15,2)=(select sum(Balance) from Accounts where ClientId=@ClientId)
return @result
end

select dbo.f_CalaculateTotalBalance(4) as Balance


create proc p_AddAccount @ClientId int,@AccountTypeId int as 
insert into Accounts(ClientId,AccountTypeId)
values(@ClientId,@AccountTypeId)

p_AddAccount 2,2 

select * from Accounts

create proc p_Deposit @AccountId int,@Amount decimal (15,2) as 
update Accounts set Balance+=@Amount
where Id=@AccountId

create proc p_Withdraw @AccountId int,@Amount decimal(15,2) as 
begin
declare @OldBalance decimal(15,2)
select @OldBalance=Balance from Accounts where Id=@AccountId
if(@OldBalance-@Amount >=0)
begin
update Accounts
set Balance-=@Amount
where Id=@AccountId
end
else
begin
Raiserror('Insufficient funds',10,1)
end
end

p_Deposit 1,100.10
p_Withdraw 2,100.00

create table Transactions(
Id int Primary Key identity,
AccountId int foreign key references Accounts(Id),
OldBalance decimal(15,2) not null,
NewBalance decimal(15,2) not null,
Amount as NewBalance-OldBalance,
DateTime DateTime2)

select * from Transactions


create Trigger tr_Transaction on Accounts
After update as
Insert into Transactions (AccountId,OldBalance,NewBalance,DateTime)
select inserted.Id,deleted.Balance,inserted.Balance,GETDATE() from inserted 
JOIN deleted on inserted.Id=deleted.Id

p_deposit 1,25.00

p_deposit 1,40.00

p_withdraw 2,200.00

p_deposit 4,180.00

select * from Transactions