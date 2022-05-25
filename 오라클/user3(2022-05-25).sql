-- user3 화면
DROP TABLE tbl_student;
DROP TABLE tbl_dept;
DROP TABLE tbl_belong;

-- 학생 정보 테이블
CREATE TABLE tbl_student (
ST_NUM	VARCHAR2(8)	PRIMARY KEY,
ST_NAME	NVARCHAR2(15)	NOT NULL,
ST_GRADE	NUMBER(1,0),
ST_TEL	VARCHAR2(15),
ST_ADDR	NVARCHAR2(255)
);

-- 학과 정보 테이블
CREATE TABLE tbl_dept (
D_CODE	VARCHAR2(5)	PRIMARY KEY,
D_NAME	NVARCHAR2(20) not null,
D_PRO	NVARCHAR2(15),
D_CLASS	VARCHAR2(5)
);

-- 소속 정보 테이블
CREATE TABLE tbl_belong (
B_SEQ	NUMBER	PRIMARY KEY,
B_STNUM	VARCHAR2(8) not null,
B_DCODE	VARCHAR2(5)	Not null,
UNIQUE(b_stnum, b_dcode)
);

-- 학생 정보 샘플 데이터 추가
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220001','홍길동',1);
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220002','이몽룡',3);
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220003','성춘향',2);

-- 학과 정보 샘플 데이터 추가
INSERT INTO tbl_dept(d_code,d_name, d_pro, d_class) VALUES('D0001','컴퓨터공학','장영실','505');
INSERT INTO tbl_dept(d_code,d_name, d_pro, d_class) VALUES('D0002','체육과','임꺽정','506');
INSERT INTO tbl_dept(d_code,d_name, d_pro, d_class) VALUES('D0003','법학과','장영자','507');

-- 소속 정보 샘플 데이터 추가
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(1, '20220001', 'D0001');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(2, '20220002', 'D0001');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(3, '20220002', 'D0002');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(4, '20220003', 'D0001');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(5, '20220003', 'D0002');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(6, '20220003', 'D0003');

/*

테이블에 일련번호 칼럼이 있을 경우
중복되지 않은 일련 번호를 사용하여 PK로 설정한다
오라클 이외의 다른 DBMS 에서는 AUTO INCREAMENT 라는 속성을 사용하여
데이터를 insert 할 때 자동으로 칼럼 데이터를 추가한다
하지만 오라클은 그러한 속성이 없어 상당히 불편

오라클에서는 SEQUENCE 라고 하는 특별한 객체가 있어서
그 객체를 사용해 같은 효과를 발휘한다
또는 경우에 따라 PK 에 해당하는 칼럼을 문자열 32byte 크기로 설정하고
UUID 를 사용하기도 한다
프로그래밍 언어(Java, c, python : 호스트 언어)와 함께
프로젝트를 할때는 UUID 를 사용한다

*/
-- seq_belong 이라는 SEQUENCE 객체를 생성하고
-- 시작값을 1로 자동 증가 옵션을 1로 설정
CREATE SEQUENCE seq_belong
INCREMENT by 1 start with 1;

-- seq_belong SEQUENCE 의 NEXTVAL 값을 조회(select) 하라
-- NEXTVAL 값은 호출(select 등) 할때마다 항상 1 증가된 값을 보여준다
SELECT seq_belong.nextval FROM dual;

-- 표준 SQL에서 간단한 사칙연산을 수행하는 방법
-- 오라클에서는 SELECT 명령문이 FROM 절이 없어 수행하는 것이 불가능하다
-- 그래서 의미 없는(DUMY) table 인 dual table 을 사용하여 FROM 절을 붙여준다
SELECT 10 + 20 FROM dual;
SELECT 100 * 100 FROM dual;
SELECT 100 - 10 FROM dual;
SELECT 50 / 20 FROM dual;

-- SEQUENCE 를 사용하여 자동 증가하는 SEQ를 만들고 INSERT 에서 사용하기
INSERT INTO tbl_belong (b_seq, b_stnum, b_dcode)
VALUES (SEQ_BELONG.nextval, '20220003', 'D0004');
INSERT INTO tbl_belong (b_seq, b_stnum, b_dcode)
VALUES (SEQ_BELONG.nextval, '20220003', 'D0005');

SELECT * FROM tbl_belong;

-- tbl_student, tbl_dept, tbl_belong 3개의 table Left join 하여
-- 학번, 이름, 학과코드, 학과명, 학년을 표시하는 select 문 작성

SELECT st.st_num, st.st_name, b.b_dcode, d.d_name, st.st_grade
FROM tbl_student st
LEFT JOIN tbl_belong b
    ON st.st_num = b.b_stnum
LEFT JOIN tbl_dept d
    ON b.b_dcode = d.d_code
ORDER BY st_num;

-- 학생의 정보 알고싶엉
SELECT st_num, st_name, st_grade
FROM tbl_student;

-- 20220001 학생이 어떤 학과 소속인지 알고싶다
SELECT
    * FROM tbl_belong
    WHERE b_stnum = '20220001';

-- 20220001 학생의 소속된 학과가 D0001 인것은 확인 D0001 학과 이름이 무엇인지 알고싶다
SELECT
    * FROM tbl_dept
    WHERE d_code = 'D0001';

-- null 값을 가진 요소는 출력되지 않는 불완전한결과
SELECT st.st_num, st.st_name, b.b_dcode, d.d_name, st.st_grade
FROM tbl_student st, tbl_belong b,tbl_dept d
    WHERE st.st_num = b.b_stnum AND b.b_dcode = d.d_code;

-- 학생, 학과, 소속 테이블 간에 FK 설정하기
-- 1. FK설정에 앞서 참조 무결성 관계를 조회하기
-- 다음의 SQL 결과가 존재하지 않아야 참조 무결성 관계가 성립된다

SELECT st.st_num, st.st_name, b.b_seq, b.b_dcode, d.d_name, st.st_grade
FROM tbl_student st
LEFT JOIN tbl_belong b
    ON st.st_num = b.b_stnum
LEFT JOIN tbl_dept d
    ON b.b_dcode = d.d_code
WHERE st_num is NULL OR d_name is NULL;

-- 위의 SQL 결과 참조 무결성이 성립되지 않는 데이터들은 
-- 8,7 의 seq 값을 가지고 있다
-- 2. 참조 무결성이 성립되지 않은 데이터를 삭제한다
DELETE FROM tbl_belong WHERE b_seq in (7,8);

SELECT b_seq, b_stnum, b_dcode, st_num, d_name
FROM tbl_belong
    LEFT JOIN tbl_student
        ON b_stnum = st_num
    LEFT JOIN tbl_dept
        ON b_dcode = d_code
WHERE st_num is null or d_name is null;
-- 3. 테이블간의 참조 무결성 제약조건을 부여한다
-- 참조무결성 제약조건을 테이블에 추가하는데
-- 이때는 Relation 테이블에 추가한다

-- 테이블에 FK를 추가하여 참조무결성 제약 조건을 부여한다
ALTER TABLE tbl_belong
ADD CONSTRAINT FK_tbl_student
FOREIGN KEY (b_stnum)
REFERENCES tbl_student (st_num);

ALTER TABLE tbl_belong
ADD CONSTRAINT FK_tbl_dept
FOREIGN KEY (b_dcode)
REFERENCES tbl_dept(d_code);

SELECT
    * FROM tbl_student;
/*
20220001	홍길동	1		
20220002	이몽룡	3		
20220003	성춘향	2		
*/
SELECT
    * FROM tbl_dept;
/*
D0001	컴퓨터공학	장영실	505
D0002	체육과	임꺽정	506
D0003	법학과	장영자	507
*/
SELECT
    * FROM tbl_belong;
/*
1	20220001	D0001
2	20220002	D0001
3	20220002	D0002
4	20220003	D0001
5	20220003	D0002
6	20220003	D0003
*/

-- tbl_student 에 아직 추가되지 않은 학번을 belong table 에 추가하기
-- tbl_student 에 없는 20220004 학번을 추가하려 하니]
-- parent key not Found 오류 발생
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode)
VALUES(SEQ_BELONG.nextval, '20220004', 'D0003');

-- 먼저 tbl_student에 해당 학번의 학생 정보를 추가해 두어야 한다
-- tbl_student 에 아래 데이터를 추가한 후 다시 위의 SQL 을 실행하면 정상 추가됨

INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220004', '장보고', 2);

-- tbl_belong 에 등록된 학번의 정보를 tbl_student 에서 삭제하려고 한다
-- 이미 tbl_belong 에 등록된 학번이므로 학번의 정보를 삭제할 수 없다
-- child recode found
-- FK 를 설정할때
-- parent table 의 데이터를 삭제하려고 할때 child table 에 데이터가 있으면
-- 보통 삭제 금지
-- parent table 의 데이터를 변경하려고 할때 child table 에 데이터 있으면
-- 보통 변경 금지

-- PK 옵션을 지정하여 parent 의 정보가 삭제되면 child 데이터를 모두 삭제하거나
-- parent 의 데이터가 변경되면 child 데이터를 변경 하도록 설정할 수 있다
DELETE FROM tbl_student WHERE st_num = '20220004';

-- 만약 parent table 의 데이터를 일괄 변경 하거나, table 의 구조를 변경 하려고 하면
-- FK 를 먼저 제거하고 실행을 해야한다

ALTER TABLE tbl_belong
DROP CONSTRAINT FK_tbl_student CASCADE;
