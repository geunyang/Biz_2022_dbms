-- ����� user3 ȭ��
-- �л� entity ���踦 �������� tbl_student table �����ϱ�
DROP TABLE tbl_student;
CREATE TABLE tbl_student (
    st_num VARCHAR2(8) PRIMARY KEY,
    st_name NVARCHAR2(15) not null,
    st_grade NUMBER(1),
    st_tel VARCHAR2(15),
    st_addr NVARCHAR2(255)
);

INSERT into tbl_student(st_num, st_name)
values('20220001', 'ȫ�浿');

-- �а� ���̺�
-- �а� �ڵ��  pk�� �����ϰ�
-- �а� �̸��� null �̰ų� �ߺ� �Ǿ�� �ȵȴ�
CREATE TABLE tbl_dept (
    d_code VARCHAR2(5) PRIMARY KEY,
    d_name NVARCHAR2(20) not null UNIQUE,
    d_pro NVARCHAR2(15),
    d_class VARCHAR2(5)

);

DROP TABLE tbl_dept;

-- �л��� �а� �Ҽ� ���� relation �� table �� ����
-- relation �� table �� �����Ҷ� ���� �����ؾ��� �κ�
-- entity table �� Į���� domain(type �� ����) �� �ݵ�� ��ġ���Ѿ��Ѵ�

-- ������ Į���� unique, not null �� ����Ǿ���
-- �̷��� ��� ������ Į���� ���� PK�� �����ϱ⵵ �Ѵ�
-- �� table �� insert �����Ҷ��� ������ ������ �� �Ǿ�
-- �߸��� �����Ͱ� �߰� �Ǵ� ���� ���� �� �� �ִ�

-- ������ update, delete �����Ҷ���
-- ������ Į������ �������� �����ؾ��Ѵ�
-- �̶� Į���� ������Ű�ų� �߸��� ������ ������ �����Ͽ� 
-- ������ ���Ἲ�� �ı��ɼ� �ִ�

-- �̷����� ���� �����Ϳ� ���� ���� ���� Į���� �߰��ϰ� 
-- PK �����ϴ� ���踦 �� �ʿ䰡 �ִ�
DROP TABLE tbl_belong;
CREATE TABLE tbl_belong (
    b_seq NUMBER PRIMARY KEY,
    b_stnum VARCHAR2(8) not null,
    b_dcode VARCHAR2(5) not null,
    UNIQUE(b_stnum, b_dcode)
);

select*from tbl_student;

-- ��ü Į���� ������ �����Ͽ� insert �ϱ�
INSERT INTO tbl_dept(d_code, d_name, d_pro, d_class)
values('D0001','��ǻ�Ͱ���','ȫ�浿','505');

-- ��ü Į���� �����͸� ������ insert  �Ҷ��� Į�� ���� �����ϳ�
-- ��Ȯ�� Į���� �����͵��� ��ġ�Ѵٴ� ������ ���� ������ ������� �ʴ°��� ����
INSERT INTO tbl_dept(d_code, d_name, d_pro, d_class)
values('D0002','���ڰ���','�̸���','506');

-- �й� 1�� �л��� �Ҽ��а��� ���
INSERT INTO tbl_belong(b_seq, b_stnum, b_dcode)
VALUES(1,'20220001','D0001');


insert into tbl_student(st_num, st_name) VALUES ('20220001','ȫ�浿');
insert into tbl_belong(b_seq, b_stnum, b_dcode) VALUES (1,'20220001','D0001');
insert into tbl_dept(d_code, d_name) VALUES ('D0001','��ǻ�Ͱ���');



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
        
