-- ����� user3
INSERT INTO tbl_student(st_num,st_name,st_grade,st_addr,st_tel);
drop table tbl_user;
Create table tbl_user (
    username VARCHAR2(30) primary key,
    password VARCHAR2(128) not null,
    name nVARCHAR2(20),
    email VARCHAR2(125),
    role VARCHAR2(10)
);