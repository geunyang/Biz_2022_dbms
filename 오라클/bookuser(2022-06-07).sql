SELECT
    * FROM tbl_books;

INSERT INTO tbl_books(isbn, title, author, publisher)
VALUES ('0001','자바','홍길동','아버지출판사');
INSERT INTO tbl_books(isbn, title, author, publisher)
VALUES ('0002','오라클','변사또','남원출판사');    
INSERT INTO tbl_books(isbn, title, author, publisher, price)
VALUES ('0003','MySQL','이몽룡','남원출판사','9000');

INSERT INTO tbl_books(isbn, title, author, publisher, price)
VALUES ('0004','MySQL','이몽룡','남원출판사','');

/*
SQL developer 에서 insert, update, delete 수행하였으나
다른 프로젝트에서 데이터 반영이 안되는 경우
명령 끝에 반드시 COMMIT 을 수행한다

insert, update, delete 를 수행한 결과는
아직 메모리 버퍼에 머물러 있고
실제 물리적 저장소에 저장이 안된 상태이다
이 상태에서 다른 프로젝트에서 데이터를 조회하면
데이터가 보이지 않는다
commit 을 할때까지
*/
commit;