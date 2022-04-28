-- ����� user2 ȭ��
/*
ó������ �����͸� �����ϱ� ���ؼ� �� ��
1. ��ϵ� ����ڷ� �����ϱ�
2. ���̺� ����
*/

CREATE TABLE tbl_student (
	st_num	    VARCHAR2(5)	    PRIMARY KEY,
	st_name	    nVARCHAR2(20)	NOT NULL,
	st_tel	    VARCHAR2(15)	UNIQUE NOT NULL,
	st_addr	    nVARCHAR2(125)	NULL,
	st_dept	    nVARCHAR2(5)	NULL,
	st_grade	NUMBER(1)	    NULL
);

-- DROP TABLE tbl_student;

-- tbl_student table�� ������ �߰��ϱ�
-- ������ ���̺� �����͸� �߰��ϴ� ������ data Create ��� �Ѵ�
INSERT INTO tbl_student(st_num, st_name, st_tel, st_dept)
VALUES('0001','ȫ�浿','010-1234-1234','�İ���');

INSERT INTO tbl_student(st_num, st_name, st_tel, st_dept)
VALUES('0002','�̸���','010-1234-1235','���ڰ�');

INSERT INTO tbl_student(st_num, st_name, st_tel, st_dept)
VALUES('0003','������','010-1234-1237','�������');

-- ����� �������� ��ȸ(Query), �б�

/*
SELECT * ��� Į���� �� ǥ���� �޶�
SELECT st_num, st_name : ���� Į�� �߿���  st_num, st_name�� ǥ���ش޶�
    projection : ������� Į���� ����
*/
SELECT *
FROM tbl_student;

SELECT st_num, st_name, st_dept
FROM tbl_student;

-- Į���� ǥ�� ������ �����Ͽ� �����޶�
SELECT st_num, st_dept, st_name, st_tel, st_addr, st_grade
FROM tbl_student;

-- tbl_student�� ����� ������ �߿��� �̸��� ȫ�浿�� �����͸� 
-- SELECTION �ش޶� ��ɹ�-��-����
SELECT * 
FROM tbl_student
WHERE st_name = 'ȫ�浿';

/*
SELECT ��� ����
projection : �����͸� ��ȸ�� �� ������ �ϴ� Į���� ǥ���ϴ°�
���� Į������ ���� ���� Į���� �����ش�
selection:�����͸� ��ȸ�ҋ� where �������� �ٿ� �ʿ��� ������ ����Ʈ�� ���°�
���� ������ ����Ʈ ���� ���� ���� ����Ʈ�� �����ش�
*/

-- ��ü �����͸� ���Ǿ��� �����ֵ� �̸�(st_name) ������ ����(sort)�Ͽ� ������
-- �����ټ�(��������) ����
SELECT *
FROM tbl_student
ORDER BY st_name;

-- ��������
SELECT *
FROM tbl_student
ORDER BY st_name DESC;

INSERT INTO tbl_student( st_num, st_name, st_tel, st_dept)
VALUES('0004','�念��','010-1234-1238','�İ���');
INSERT INTO tbl_student( st_num, st_name, st_tel, st_dept)
VALUES('0005','�ּ���','010-1234-1239','�İ���');

-- �а�(st_dept)�� �İ����� �����͸� selection �Ͽ� 
-- �̸�(st_name) ������ �����϶�
SELECT * 
FROM tbl_student
WHERE st_dept = '�İ���'
ORDER BY st_name; 

--�İ��� �л��鸸 �̸��� ���������Ͽ� ������
SELECT
* FROM tbl_student
WHERE st_dept = '�İ���'
ORDER BY st_name DESC;

-- ��ü �����͸� �а��� ������ �����ϰ� 
-- �а����� ���� �����ͳ����� �̸������� �����϶�
SELECT
    * FROM tbl_student
    ORDER BY st_dept, st_name;
    
-- ��ü �������� ������ ��ΰ�
SELECT COUNT(st_dept)
FROM tbl_student; 

-- �а� ���� �л��� ���ϱ�
-- �а� ���� ��� �� �׷��� ������� �����
-- AS ���� Į���� Ű���带 �������� �ٲ㼭 �����޶�
SELECT st_dept, COUNT(st_dept) AS �л��� --3.���� �׷쿡 ���Ե� �����Ͱ� ��ΰ�
FROM tbl_student --1.�����Ͱ�������
GROUP BY st_dept; --2.(st_dept)�а��� ���� �����ͳ��� ����

SELECT COUNT(*) 
FROM tbl_student;

-- ��ü ������ �߿� �İ��� �л��� ����ΰ�
SELECT COUNT(st_dept)
FROM tbl_student
WHERE st_dept = '�İ���';
/*
�������� �����͸� �߰�, ����, ���� ����� ������ ��� 
ORACLE DBMS ���� ��û�� �� ���°� �ȴ�
������ ORACLE DBMS �� ���� ���丮���� DBF ���Ͽ� �������� ���� �����̴�
�� ���¿��� ������ ������ ������ 
ORACLE DBMS �� � ������ �߻��Ͽ� ���� �� ������ �����ϰ� �����͸� ����������.
������ ����Ͽ� ���� �Ͽ��� ���� ������ �����ϱ� ���� �ݵ�� COMMIT�� ���־���Ѵ�.
*/
COMMIT;

SELECT * FROM tbl_student;

INSERT INTO tbl_student (st_num, st_name, st_tel)
VALUES('00006','��â��','010-1234-1222');
/*
TRANSACTION
�����͸� �߰�, ����, �����ϰ� ���� COMMIT ���� ���� ���¿���
�߰�, ����, ������ ����ϴ� ���
*/
ROLLBACK;

DELETE
FROME tbl_student;

/*
DCL(DATA CONTROL LANG.)
����ڿ��� ������ �ο�(GRANT)�ϰų� ȸ��(REVOKE)�ϴ� ����� �ְ�
�����͸� COMMIT, �Ǵ� ROLLBACK �ϴ� ����� �ִ�.
*/
drop table tbl_student;
CREATE TABLE tbl_student (
st_num  	VARCHAR2(5)		PRIMARY KEY,
st_name	    nVARCHAR2(20)	NOT NULL,	
st_dept	    nVARCHAR2(10),		
st_grade	NUMBER(1),		
st_tel	    VARCHAR2(16)	    NOT NULL	UNIQUE,
st_addr 	nVARCHAR2(125)	
);

CREATE TABLE tbl_score (
sc_stnum	VARCHAR2(5)		PRIMARY KEY,
sc_kor	NUMBER,	
sc_eng	NUMBER,	
sc_math	NUMBER,	
sc_his	NUMBER,	
sc_moral	NUMBER,	
sc_sci	NUMBER	
);



SELECT * FROM tbl_student;
SELECT st_dept, COUNT (st_dept)
FROM tbl_student
GROUP BY st_dept;


SELECT st_dept, COUNT(st_dept)
FROM tbl_student
GROUP BY st_dept
ORDER BY COUNT(st_dept) DESC;

SELECT st_dept, COUNT(st_dept) AS �л���
FROM tbl_student
GROUP BY st_dept
ORDER BY �л��� DESC;

SELECT st_dept, COUNT(st_dept) AS �л���
FROM tbl_student
GROUP BY st_dept
ORDER BY �л��� DESC, st_dept;

commit;
