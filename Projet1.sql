create database Library;
use Library;

create table Books(
ID int identity(1,1) primary key not null,
Name varchar(100) not null,
PageCount varchar (10) not null

);
select * from Books;
insert into Books (Name, PageCount)
values
('Serq ekspresinde qetl', '10'),
('Manqurt', '9'),
('Cinayet ve ceza', '5'),
('Sefiller', '8'),
('Anna Karenina', '10');

--Authors (Id, Name, Surname)

create table Authors(
ID int identity(1,1) primary key,
Name varchar(100),
Surname varchar(100)
);

select * from Authors

insert into Authors (Name, Surname)
values
('Cingiz', 'Aytmatov'),
('Cingiz', 'Abdullayev'),
('Lev', 'Tolstoy'),
('Celil', 'Memmedquluzade'),
('Aqshin', 'Yenisey');

create table BooksAndAuthors(
ID int identity(1,1) primary key,
BookID int foreign key references Books(ID),
AuthorID int foreign key references Authors(ID)
)
select * from BooksAndAuthors

create view v_BooksAndAuthors
as select BooksAndAuthors.ID, Books.Name, Books.PageCount, Authors.Name as a_name, Authors.Surname
from BooksAndAuthors
inner join Books on Books.ID=BooksAndAuthors.BookID
inner join Authors on Authors.ID=BooksAndAuthors.AuthorID;

insert into BooksAndAuthors
values
(3,5),
(1,2),
(1,3),
(4,5);

select *from v_BooksAndAuthors

create procedure SelectBooksAsAuthors
as
select BooksAndAuthors.ID, Books.Name, Books.PageCount, Authors.Name as a_name , Authors.Surname
from BooksAndAuthors
inner join Books on Books.ID=BooksAndAuthors.BookID
inner join Authors on Authors.ID=BooksAndAuthors.AuthorID
where Authors.Name ='Lev';

exec SelectBooksAsAuthors;

create procedure authors_insert (@Name nvarchar(100), @Surname nvarchar(100))
as
insert into Authors
values
(@Name, @Surname);

exec authors_insert 'Niqu', 'Huseyn'
select * from Authors;

create procedure authors_delete @Name nvarchar(100)
as
delete from Authors
where Name = @Name

exec authors_delete 'F';

create procedure authors_update @ID int 
as
update Authors
set Name ='Yequ', Surname ='Mirdamat qizi'
where ID=@ID

exec authors_update 1




