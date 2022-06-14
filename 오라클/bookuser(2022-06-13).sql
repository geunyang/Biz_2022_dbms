--여기는 bookuser

CREATE TABLE tbl_bbs (
			b_seq	NUMBER	PRIMARY KEY,
			b_date	VARCHAR2(10)	NOT NULL,
			b_time	VARCHAR2(10)	NOT NULL,
			b_writer	VARCHAR2(125)	NOT NULL,
			b_subject	nVARCHAR2(125)	NOT NULL,
			b_content	nVARCHAR2(1000)	NOT NULL
);
CREATE sequence seq_bbs
increment by 1 start with 1;
        
select seq_bbs.nextval from DUAL;
insert into tbl_bbs(b_seq,b_date,b_time,b_writer,b_subject,b_content)
values(seq_bbs.nextval, '2022-06-13', '14:23:00', 'callor', '게시판글쓰기', '게시판에 글을 쓰자');

SELECT
    * FROM tbl_bbs;