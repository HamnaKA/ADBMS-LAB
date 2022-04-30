
create table book (book_id int primary key, title varchar(20),publisher_name varchar(20),year varchar(5));
drop table book;
create table author(book_id int,author_name varchar(20),foreign key(book_id) references book(book_id) on delete cascade);
drop table author;
create table publisher(name varchar(20),adress varchar(20),phone varchar(20));
create table book_lending(book_id int,branch_id int primary key,card_no int,date_out date,due_date date,foreign key(book_id) references book(book_id) on delete cascade);
drop table book_lending;
create table copies(book_id int, branch_id int,no_of_copies varchar(20), foreign key(book_id) references book(book_id) on delete cascade,foreign key(branch_id) references book_lending(branch_id) on delete cascade);
create table library(branch_id int,branch_name varchar(20),adress varchar(20),foreign key(branch_id)references copies(branch_id) on delete cascade);
drop table library;
drop database library;
create database library;
use library;

describe book;
describe author;
describe publisher;
describe book_lending;
describe copies;
describe library; 

insert into book values(101,"harry","hamna",2020),(102,"live me","henna",1957),(103,"elon musk","nihal",2013);
select * from book;

insert into author values(101,"sam"),(102,"rahul"),(103,"jay");
select * from author;

insert into publisher values("hamna","123x",9567),("henna","456x",8593),("nihal","789x",8492);
select * from publisher;

insert into book_lending values(101,501,601,"2017-02-11","2017-03-12"),(102,502,602,"2017-01-01","2017-02-17"),(103,503,603,"2022-08-10","2022-08-11");
select * from book_lending;

insert into copies values(101,501,6),(102,502,7),(103,503,8);
select * from copies;

insert into library values(501,"marampally","xx2"),(502,"aluva","xx3"),(503,"TKM","xx4");
select * from library;


select book.book_id,book.title,book.publisher_name,author.author_name,copies.branch_id,copies.no_of_copies from book,author,copies
where book.book_id=author.book_id and book.book_id=copies.book_id;

select * from book_lending where date_out between "2017-01-01" and "2017-06-01" group by card_no having count(*)>3;

delete from book where book_id="101";

select * , avg(year) over(partition by year) from book;

create view books as select book.title,copies.no_of_copies from book,copies where book.book_id=copies.book_id group by title;
 
select * from books;
drop view books;

