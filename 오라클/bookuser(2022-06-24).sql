-- bookuser화면

DROP TABLE tbl_images;
CREATE TABLE tbl_memo (
m_seq	NUMBER  PRIMARY KEY,
m_author	VARCHAR2(25)	NOT NULL,
m_date	VARCHAR2(10)	NOT NULL,
m_time	VARCHAR2(10)	NOT NULL,	
m_memo	nVARCHAR2(400)	NOT NULL,	
m_image	nVARCHAR2(125)	NOT NULL	

);

SELECT
    * FROM tbl_memo;
    
CREATE SEQUENCE m_seq
INCREMENT by 1 START WITH 1;

SELECT
    * FROM m_seq;

commit;