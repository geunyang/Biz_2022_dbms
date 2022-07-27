-- school DB



-- root 에서 DataBase 생성 : schoolDB 생성
create database schoolDB;
use schoolDB;

-- 사용자 등록 localhost 부분을 % 로 지정하면 원격접속 가능하나 보안상 위험도 높아짐
create user gaeballza@'localhost' identified by '!Korea8080';

-- gaeballza 에게 schoolDB 에 접근할 수 있는 권한 부여
grant all privileges on schoolDB.* to gaeballza@'localhost';

-- 권한 부여 후 적용
flush privileges;

-- 현재 root 외 등록된 사용자에게 DB 전체에 대한 권한 부여
grant all privileges on *.* to ballza@'localhost';

-- 권한 부여후 적용
flush privileges;

-- root 에서 학사정보 테이블 명세를 참조하여 tbl_student table 생성

drop table tbl_student;
create table tbl_student (
st_num	VARCHAR(5)	PRIMARY KEY,
st_name	VARCHAR(20)	NOT NULL,
st_dept	VARCHAR(20),
st_grade	INT,	
st_tel	VARCHAR(16)	NOT NULL,
st_addr	VARCHAR(125)
);

drop database schooldb;

-- export 된 database import
-- export 된 database 와 같은 이름으로 database 생성

create database schoolDB;