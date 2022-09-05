-- root
create database booksdb;
use booksdb;

drop table tbl_author;
create table tbl_author (
au_code	CHAR(5)	PRIMARY KEY,
au_name	VARCHAR(50)	NOT NULL,
au_tel	VARCHAR(20),	
au_addr	VARCHAR(125)	
);

select count(*) from tbl_author;

drop table tbl_company;
create table tbl_company (
comp_code	CHAR(5)		PRIMARY KEY,
comp_name	VARCHAR(50)	NOT NULL,	
comp_ceo	VARCHAR(20)		,
comp_tel	VARCHAR(20)	,	
comp_addr	VARCHAR(125)		
);

select count(*) from tbl_company;

drop table tbl_book;
create table tbl_book (
book_isbn	VARCHAR(13)		PRIMARY KEY,
book_comp	VARCHAR(50)	NOT NULL,	
book_title	VARCHAR(20)		,
book_author	VARCHAR(125)	,	
book_date	VARCHAR(10)		,
book_page	int		,
book_price	int	
);

select count(*) from tbl_book;

select * from tbl_book;
select * from tbl_company;
select * from tbl_author;

select BK.book_isbn as 'ISBN', BK.book_title as '도서명', COMP.comp_name as '출판사명', COMP.comp_ceo as '출판사대표', AUT.au_name as '저자',
		AUT.au_tel as '저자연락처'
  from tbl_book BK
	left join tbl_company COMP
		on BK.book_comp = COMP.comp_code
	left join tbl_author as AUT
		on BK.book_author = AUT.au_name;
        
select BK.book_isbn as 'ISBN', BK.book_title as '도서명', COMP.comp_name as '출판사명', COMP.comp_ceo as '출판사대표', AUT.au_name as '저자',
		AUT.au_tel as '저자연락처', BK.book_date as '출판일'
  from tbl_book BK
	left join tbl_company COMP
		on BK.book_comp = COMP.comp_code
	left join tbl_author AUT
		on BK.book_author = AUT.au_name
	where BK.book_date < '2018-12-31'
	order by BK.book_date;

select * from tbl_book
order by book_date;

select book_comp as 출판사, count(book_comp) as 출간수량
from tbl_book
group by book_comp;


select book_comp as 출판사, avg(book_price) as 평균 
from tbl_book
group by book_comp;


select * from tbl_book
where book_price >= 20000;

select * from tbl_author
where au_code='A0010'
;

select BK.book_isbn, BK.book_title, COMP.comp_code, COMP.comp_ceo, AUT.au_name,
		AUT.au_tel, BK.book_date, BK.book_price, BK.book_page
  from tbl_book BK
	left join tbl_company COMP
		on BK.book_comp = COMP.comp_code
	left join tbl_author as AUT
		on BK.book_author = AUT.au_name;

