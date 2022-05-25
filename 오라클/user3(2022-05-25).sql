-- user3 ȭ��
DROP TABLE tbl_student;
DROP TABLE tbl_dept;
DROP TABLE tbl_belong;

-- �л� ���� ���̺�
CREATE TABLE tbl_student (
ST_NUM	VARCHAR2(8)	PRIMARY KEY,
ST_NAME	NVARCHAR2(15)	NOT NULL,
ST_GRADE	NUMBER(1,0),
ST_TEL	VARCHAR2(15),
ST_ADDR	NVARCHAR2(255)
);

-- �а� ���� ���̺�
CREATE TABLE tbl_dept (
D_CODE	VARCHAR2(5)	PRIMARY KEY,
D_NAME	NVARCHAR2(20) not null,
D_PRO	NVARCHAR2(15),
D_CLASS	VARCHAR2(5)
);

-- �Ҽ� ���� ���̺�
CREATE TABLE tbl_belong (
B_SEQ	NUMBER	PRIMARY KEY,
B_STNUM	VARCHAR2(8) not null,
B_DCODE	VARCHAR2(5)	Not null,
UNIQUE(b_stnum, b_dcode)
);

-- �л� ���� ���� ������ �߰�
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220001','ȫ�浿',1);
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220002','�̸���',3);
INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220003','������',2);

-- �а� ���� ���� ������ �߰�
INSERT INTO tbl_dept(d_code,d_name, d_pro, d_class) VALUES('D0001','��ǻ�Ͱ���','�念��','505');
INSERT INTO tbl_dept(d_code,d_name, d_pro, d_class) VALUES('D0002','ü����','�Ӳ���','506');
INSERT INTO tbl_dept(d_code,d_name, d_pro, d_class) VALUES('D0003','���а�','�念��','507');

-- �Ҽ� ���� ���� ������ �߰�
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(1, '20220001', 'D0001');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(2, '20220002', 'D0001');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(3, '20220002', 'D0002');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(4, '20220003', 'D0001');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(5, '20220003', 'D0002');
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode) VALUES(6, '20220003', 'D0003');

/*

���̺� �Ϸù�ȣ Į���� ���� ���
�ߺ����� ���� �Ϸ� ��ȣ�� ����Ͽ� PK�� �����Ѵ�
����Ŭ �̿��� �ٸ� DBMS ������ AUTO INCREAMENT ��� �Ӽ��� ����Ͽ�
�����͸� insert �� �� �ڵ����� Į�� �����͸� �߰��Ѵ�
������ ����Ŭ�� �׷��� �Ӽ��� ���� ����� ����

����Ŭ������ SEQUENCE ��� �ϴ� Ư���� ��ü�� �־
�� ��ü�� ����� ���� ȿ���� �����Ѵ�
�Ǵ� ��쿡 ���� PK �� �ش��ϴ� Į���� ���ڿ� 32byte ũ��� �����ϰ�
UUID �� ����ϱ⵵ �Ѵ�
���α׷��� ���(Java, c, python : ȣ��Ʈ ���)�� �Բ�
������Ʈ�� �Ҷ��� UUID �� ����Ѵ�

*/
-- seq_belong �̶�� SEQUENCE ��ü�� �����ϰ�
-- ���۰��� 1�� �ڵ� ���� �ɼ��� 1�� ����
CREATE SEQUENCE seq_belong
INCREMENT by 1 start with 1;

-- seq_belong SEQUENCE �� NEXTVAL ���� ��ȸ(select) �϶�
-- NEXTVAL ���� ȣ��(select ��) �Ҷ����� �׻� 1 ������ ���� �����ش�
SELECT seq_belong.nextval FROM dual;

-- ǥ�� SQL���� ������ ��Ģ������ �����ϴ� ���
-- ����Ŭ������ SELECT ��ɹ��� FROM ���� ���� �����ϴ� ���� �Ұ����ϴ�
-- �׷��� �ǹ� ����(DUMY) table �� dual table �� ����Ͽ� FROM ���� �ٿ��ش�
SELECT 10 + 20 FROM dual;
SELECT 100 * 100 FROM dual;
SELECT 100 - 10 FROM dual;
SELECT 50 / 20 FROM dual;

-- SEQUENCE �� ����Ͽ� �ڵ� �����ϴ� SEQ�� ����� INSERT ���� ����ϱ�
INSERT INTO tbl_belong (b_seq, b_stnum, b_dcode)
VALUES (SEQ_BELONG.nextval, '20220003', 'D0004');
INSERT INTO tbl_belong (b_seq, b_stnum, b_dcode)
VALUES (SEQ_BELONG.nextval, '20220003', 'D0005');

SELECT * FROM tbl_belong;

-- tbl_student, tbl_dept, tbl_belong 3���� table Left join �Ͽ�
-- �й�, �̸�, �а��ڵ�, �а���, �г��� ǥ���ϴ� select �� �ۼ�

SELECT st.st_num, st.st_name, b.b_dcode, d.d_name, st.st_grade
FROM tbl_student st
LEFT JOIN tbl_belong b
    ON st.st_num = b.b_stnum
LEFT JOIN tbl_dept d
    ON b.b_dcode = d.d_code
ORDER BY st_num;

-- �л��� ���� �˰�;�
SELECT st_num, st_name, st_grade
FROM tbl_student;

-- 20220001 �л��� � �а� �Ҽ����� �˰�ʹ�
SELECT
    * FROM tbl_belong
    WHERE b_stnum = '20220001';

-- 20220001 �л��� �Ҽӵ� �а��� D0001 �ΰ��� Ȯ�� D0001 �а� �̸��� �������� �˰�ʹ�
SELECT
    * FROM tbl_dept
    WHERE d_code = 'D0001';

-- null ���� ���� ��Ҵ� ��µ��� �ʴ� �ҿ����Ѱ��
SELECT st.st_num, st.st_name, b.b_dcode, d.d_name, st.st_grade
FROM tbl_student st, tbl_belong b,tbl_dept d
    WHERE st.st_num = b.b_stnum AND b.b_dcode = d.d_code;

-- �л�, �а�, �Ҽ� ���̺� ���� FK �����ϱ�
-- 1. FK������ �ռ� ���� ���Ἲ ���踦 ��ȸ�ϱ�
-- ������ SQL ����� �������� �ʾƾ� ���� ���Ἲ ���谡 �����ȴ�

SELECT st.st_num, st.st_name, b.b_seq, b.b_dcode, d.d_name, st.st_grade
FROM tbl_student st
LEFT JOIN tbl_belong b
    ON st.st_num = b.b_stnum
LEFT JOIN tbl_dept d
    ON b.b_dcode = d.d_code
WHERE st_num is NULL OR d_name is NULL;

-- ���� SQL ��� ���� ���Ἲ�� �������� �ʴ� �����͵��� 
-- 8,7 �� seq ���� ������ �ִ�
-- 2. ���� ���Ἲ�� �������� ���� �����͸� �����Ѵ�
DELETE FROM tbl_belong WHERE b_seq in (7,8);

SELECT b_seq, b_stnum, b_dcode, st_num, d_name
FROM tbl_belong
    LEFT JOIN tbl_student
        ON b_stnum = st_num
    LEFT JOIN tbl_dept
        ON b_dcode = d_code
WHERE st_num is null or d_name is null;
-- 3. ���̺��� ���� ���Ἲ ���������� �ο��Ѵ�
-- �������Ἲ ���������� ���̺� �߰��ϴµ�
-- �̶��� Relation ���̺� �߰��Ѵ�

-- ���̺� FK�� �߰��Ͽ� �������Ἲ ���� ������ �ο��Ѵ�
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
20220001	ȫ�浿	1		
20220002	�̸���	3		
20220003	������	2		
*/
SELECT
    * FROM tbl_dept;
/*
D0001	��ǻ�Ͱ���	�念��	505
D0002	ü����	�Ӳ���	506
D0003	���а�	�念��	507
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

-- tbl_student �� ���� �߰����� ���� �й��� belong table �� �߰��ϱ�
-- tbl_student �� ���� 20220004 �й��� �߰��Ϸ� �ϴ�]
-- parent key not Found ���� �߻�
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode)
VALUES(SEQ_BELONG.nextval, '20220004', 'D0003');

-- ���� tbl_student�� �ش� �й��� �л� ������ �߰��� �ξ�� �Ѵ�
-- tbl_student �� �Ʒ� �����͸� �߰��� �� �ٽ� ���� SQL �� �����ϸ� ���� �߰���

INSERT INTO tbl_student(st_num, st_name, st_grade) VALUES ('20220004', '�庸��', 2);

-- tbl_belong �� ��ϵ� �й��� ������ tbl_student ���� �����Ϸ��� �Ѵ�
-- �̹� tbl_belong �� ��ϵ� �й��̹Ƿ� �й��� ������ ������ �� ����
-- child recode found
-- FK �� �����Ҷ�
-- parent table �� �����͸� �����Ϸ��� �Ҷ� child table �� �����Ͱ� ������
-- ���� ���� ����
-- parent table �� �����͸� �����Ϸ��� �Ҷ� child table �� ������ ������
-- ���� ���� ����

-- PK �ɼ��� �����Ͽ� parent �� ������ �����Ǹ� child �����͸� ��� �����ϰų�
-- parent �� �����Ͱ� ����Ǹ� child �����͸� ���� �ϵ��� ������ �� �ִ�
DELETE FROM tbl_student WHERE st_num = '20220004';

-- ���� parent table �� �����͸� �ϰ� ���� �ϰų�, table �� ������ ���� �Ϸ��� �ϸ�
-- FK �� ���� �����ϰ� ������ �ؾ��Ѵ�

ALTER TABLE tbl_belong
DROP CONSTRAINT FK_tbl_student CASCADE;
