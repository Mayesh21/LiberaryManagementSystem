drop table fine;
drop table mem_book;
drop table librarian;
drop table member_login;
drop table books;
/*drop table category;

create table category(cat_id integer primary key, cat_name varchar(20));
\d category;
insert into category values(11,'fiction');
*/
create table books(book_id SERIAL primary key, name varchar(50),img varchar(1024),author varchar(20),quantity integer,cat_name varchar(20));
\d books;
insert into books values(0,'Harry Potter','13.jpg','J.K Rowling',2,'Fiction');
insert into books values(DEFAULT,'The Accidental Prime Minister','1.jpg','Sanjay Baru',4,'Non-Fiction');
insert into books values(DEFAULT,'Tender is the Night','2.jpg','Scott Fitzgerald',6,'Fiction');
insert into books values(DEFAULT,'A brief  history of time','3.jpg','Stephen Hawking',4,'Fiction');
insert into books values(DEFAULT,'The Notebook','4.jpg','Nicholas Sparks',3,'Fiction');
insert into books values(DEFAULT,'The Last song','5.jpg','Nicholas Sparks',4,'Fiction');
insert into books values(DEFAULT,'A walk to remember','6.png','Nicholas Sparks',2,'Fiction');
insert into books values(DEFAULT,'Where Rainbows end','7.jpg','Cecilia Ahern',4,'Fiction');
insert into books values(DEFAULT,'P.S. I love you','8.jpg','Cecilia Ahern',2,'Fiction');
insert into books values(DEFAULT,'Thanks for the meories','9.jpg','Cecilia Ahern',3,'Fiction');
insert into books values(DEFAULT,'Diary of a Young girl','10.jpg','Anne Frank',4,'Non-Fiction');
insert into books values(DEFAULT,'Between The World and me','11.jpg','Nehisi Coates',2,'Non-Fiction');
insert into books values(DEFAULT,'Black Boy','12.jpg','Richard Wright',4,'Non-Fiction');
insert into books values(DEFAULT,'Encyclopedia Britannica','14.jpg','Britannica',6,'Encyclopedia');
insert into books values(DEFAULT,'The Marvel Encyclopedia','15.jpg','Marvel',4,'Encyclopedia');
insert into books values(DEFAULT,'Chambers Encyclopedia','16.jpg','Chambers',2,'Encyclopeida');


create table member_login(mname varchar(20), u_name varchar(20) primary key, pwd varchar(20),pno varchar(10), address varchar(40));
\d member_login;
insert into member_login values('abc','abc123','abc123',123456,'pune');



create table librarian(lib_id varchar primary key, lib_name varchar(20),password varchar(20));
\d librarian;
insert into librarian values('fc','fergusson','1234');


create table mem_book(u_name varchar(20) references member_login(u_name) on delete cascade on update set null, book_id integer references books(book_id) on delete cascade on update set null,datee varchar(20));
\d mem_book;
insert into mem_book values('abc123',1,'01-30-1998');
insert into mem_book values('abc123',2,'05-30-1998');
insert into mem_book values('abc123',3,'08-30-1998');

create table fine(u_name varchar(20) references member_login(u_name) on delete cascade on update set null, finee integer);
\d fine;
