create database Movies

create table Directors (
Id int not null Primary Key Identity,
DirectorName nvarchar(50),
Notes nvarchar(max))

create table Genres (
Id int not null Primary Key Identity,
CategoryName nvarchar(50) not null,
Notes nvarchar(max))

ALTER TABLE Genres
DROP COLUMN CategoryName

ALTER TABLE Genres
ADD GenreName  nvarchar(50)

create table Categories (
Id int not null Primary Key Identity,
CategoryName nvarchar(80) not null,
Notes nvarchar(max))

create table Movies (
Id int not null Primary Key Identity,
DirectorId int foreign key references Directors(Id),
CopyrightYear int,
Length time,
GenreId int foreign key references Genres(Id),
CategoryId int foreign key references Categories(Id),
Rating decimal(2,1),
Notes nvarchar(max)
)
ALTER TABLE Movies
ADD Title  nvarchar(50)

insert into Directors (DirectorName,Notes) values
(' Steven Spielberg','Producer'),
(' James Cameron','  Writer'),
(' Martin Scorsese',' Director'),
(' Quentin Tarantino',' Writer'),
(' Christopher Nolan',' Writer')

select * from Directors

insert into Genres (GenreName,Notes) values
(' Action','Snow White and Seven Dwarfs'),
(' Adventure','A Space Oddyssey'),
(' Drama','Vertigo'),
(' Horror',' Lawrence of Arabia'),
(' War',' Mr. Bean')

select * from Genres

insert into Categories(CategoryName,Notes) values
(' Animated','Snow White and Seven Dwarfs'),
(' Science Fiction','A Space Oddyssey'),
(' Mystery','Vertigo'),
(' Epic',' Lawrence of Arabia'),
(' Comedy',' Mr. Bean')


select * from Categories

insert into Movies(DirectorId,CopyrightYear,Length,GenreId,CategoryId,Rating,Notes,Title) VALUES

(1, 2003,'1:30:00', 1, 5, 9.5, 'Animated','Finding Nemo'),

( 2, 2013, '1:00:00', 2, 4, 9.0, 'Kids','Frozen'),

( 2, 1995, '1:35:40', 3, 3, 9.0, 'Animated','Toy Story'),

( 5, 1991, '2:20:00', 4, 2, 8.8, 'Kids','Beauty and the Beast'),

( 4, 2010,'1:30:00', 5, 1, 8.9, 'Comedy','Despicable Me') 

select * from Movies