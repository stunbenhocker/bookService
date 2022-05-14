drop table book;

create table book(
	num number not null,
	title varchar2(50) not null,
	author varchar2(50) not null,
	company varchar2(50) not null,
	isbn varchar2(50) not null,
	count number default 0,
	primary key(num)
);

create sequence book_num;

select * from book;

insert into book(num, title, author, company, isbn, count)
values(book_num.nextval, '1984','조지오웰','소담', '1111111', 3);
insert into book(num, title, author, company, isbn, count)
values(book_num.nextval, '파리대왕','윌리엄골딩','민음사', '2222222', 3);
insert into book(num, title, author, company, isbn, count)
values(book_num.nextval, '스프링','김민찬','점프', '3333333', 1);
insert into book(num, title, author, company, isbn, count)
values(book_num.nextval, '질서너머','조던피터슨','웅진', '4444444', 1);
insert into book(num, title, author, company, isbn, count)
values(book_num.nextval, '파우스트','괴테','민음사', '5555555', 1);