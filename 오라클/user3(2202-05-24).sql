-- 여기는 user3 화면
-- 학생 entity 설계를 기준으로 tbl_student table 생성하기
DROP TABLE tbl_student;
CREATE TABLE tbl_student (
    st_num VARCHAR2(8) PRIMARY KEY,
    st_name NVARCHAR2(15) not null,
    st_grade NUMBER(1),
    st_tel VARCHAR2(15),
    st_addr NVARCHAR2(255)
);

INSERT into tbl_student(st_num, st_name)
values('20220001', '홍길동');

-- 학과 테이블
-- 학과 코드는  pk로 선언하고
-- 학과 이름은 null 이거나 중복 되어서는 안된다
CREATE TABLE tbl_dept (
    d_code VARCHAR2(5) PRIMARY KEY,
    d_name NVARCHAR2(20) not null UNIQUE,
    d_pro NVARCHAR2(15),
    d_class VARCHAR2(5)

);

DROP TABLE tbl_dept;

-- 학생의 학과 소속 정보 relation 을 table 로 생성
-- relation 을 table 로 설계할때 가장 유의해야할 부분
-- entity table 의 칼럼과 domain(type 와 길이) 를 반드시 일치시켜야한다

-- 복수의 칼럼이 unique, not null 로 선언되었다
-- 이러한 경우 복수의 칼럼을 묶어 PK로 선언하기도 한다
-- 이 table 에 insert 수행할때는 데이터 검증이 잘 되어
-- 잘못된 데이터가 추가 되는 것을 방지 할 수 있다

-- 하지만 update, delete 수행할때는
-- 복수의 칼럼으로 조건절을 수행해야한다
-- 이때 칼럼을 누락시키거나 잘못된 값으로 조건을 수행하여 
-- 데이터 무결성이 파괴될수 있다

-- 이럴때는 실제 데이터와 관련 없는 단일 칼럼을 추가하고 
-- PK 설정하는 설계를 할 필요가 있다
DROP TABLE tbl_belong;
CREATE TABLE tbl_belong (
    b_seq NUMBER PRIMARY KEY,
    b_stnum VARCHAR2(8) not null,
    b_dcode VARCHAR2(5) not null,
    UNIQUE(b_stnum, b_dcode)
);

select*from tbl_student;

-- 전체 칼럼에 데이터 포함하여 insert 하기
INSERT INTO tbl_dept(d_code, d_name, d_pro, d_class)
values('D0001','컴퓨터공학','홍길동','505');

-- 전체 칼럼에 데이터를 포함한 insert  할때는 칼럼 생략 가능하나
-- 정확히 칼럼에 데이터들이 일치한다는 보장이 없기 때문에 사용하지 않는것이 좋다
INSERT INTO tbl_dept(d_code, d_name, d_pro, d_class)
values('D0002','전자공학','이몽룡','506');

-- 학번 1번 학생의 소속학과를 등록
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode)
VALUES(1,'20220001','D0001');


insert into tbl_student(st_num, st_name) VALUES ('20220001','홍길동');
insert into tbl_belong(b_seq, b_stnum, b_dcode) VALUES (1,'20220001','D0001');
insert into tbl_dept(d_code, d_name) VALUES ('D0001','컴퓨터공학');



SELECT st.st_num, st.st_name, b.b_dcode, st.st_grade
FROM tbl_student ST
    LEFT join tbl_belong B
        on st.st_num = b.b_stnum;
        
SELECT st.st_num, st.st_name, b.b_dcode, d.d_name, d.d_pro, st.st_grade, d.d_class
FROM tbl_student ST
    LEFT join tbl_belong B
        on st.st_num = b.b_stnum
    LEFT JOIN tbl_dept d
        on b.b_dcode = d.d_code;
        
