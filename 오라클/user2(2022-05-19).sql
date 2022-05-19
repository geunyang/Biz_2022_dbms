--����� user2
SELECT
    * FROM tbl_score
    WHERE sc_subject = '����';

/*
���� �����Ͱ� ����� tbl_score table �� ��������
��������� ��������� �����ϰ� �ʹ�
SQL �� UPDATE ����� �̿��ϸ� ������ �ذ��� �� �ִ�

������ ���� table ���� 100 ���� ���ڵ�(�����͵�)�� ����Ǵ� ������ �߻��Ѵ�
�ѹ��� �ٷ��� ���ڵ��� �����Ͱ� ����Ǵ� ���
������ ���Ἲ, transaction ���� ������ ����ų �� �ִ�

���� �Ͼ�� ��Ȳ�� �ƴ����� �̷��� ��Ȳ�� �߻����� �ʵ���
table ���踦 �ٽ� �����ؾ� �Ѵ�
*/
UPDATE tbl_score
SET sc_subject = '�������'
WHERE sc_subject = '����';

/*
tbl_score ���̺��� �ʱ� ���� ������ ���� ������� �Ϲ� ���ڿ��� ��ϵǾ���
���� ������� �����Ϸ��� ���� �����͸� �����ؾ� �ϰ� ������
������ ����ų���̴�

tbl_score ���̺��� ���踦 �����Ͽ�
�������� ���̺��� �����ϰ�
���������� �����Ͽ� ������� �� �� �ֵ��� �ϰڴ�
*/

-- tbl_score ���� ����� �����ϱ�
-- tbl_score table ���� ������� �ߺ����� �����ϱ�
SELECT sc_subject
FROM tbl_score
GROUP BY sc_subject
ORDER BY sc_subject;

-- tbl_score ���� �й��� �ߺ� ���� �����ϱ�

SELECT sc_stnum
FROM tbl_score
GROUP BY sc_stnum
ORDER BY sc_stnum;

-- ������ ������� ������ �����Ͽ�
-- �����ڵ带 �ο��� �����͸� Ȯ���ߴ�

-- ���������� ������ ���̺� ����

CREATE TABLE tbl_subject (
    sb_code	VARCHAR2(5)	NOT NULL	PRIMARY KEY,
    sb_name	nVARCHAR2(25)	NOT NULL	

);

-- ���̺� import
-- import Ȯ��
SELECT
    * FROM tbl_subject;
    
-- ������ �ý��� ���� �ִٴ� �������� ������

-- tbl_score ���̺��� ���������ϱ�
/* 
SQL DDL (data definition) ���
CREATE(���οü����), DROP(��ü����), ALTER(��ü�Ǳ�������) 
��ü (���̺�) �� ������ �����ϴ� ���� ���� ����� ����� �����Ѵ�
���̺��� ������ �����ϴ°��� �������� ���Ἲ�� �ɰ��ϰ� ������ �� �ִ�

1.tbl_score�� sc_sbcode "Į���� �߰�" �ϱ�


*/

ALTER TABLE tbl_score
ADD sc_sbcode VARCHAR2(5);

DESC tbl_score;

SELECT
    * FROM tbl_score;
-- projection: Į���� ���ϴ°͸� ���ϴ� ������ �����޶�
SELECT sc_seq, sc_stnum, sc_sbcode, sc_subject, sc_score
from tbl_score;

-- sub query
-- query �� �ٸ� query �� ����� �����ϴ� ����
SELECT sc_seq, sc_stnum, 
(
    SELECT sb_code FROM tbl_subject
    WHERE sc_subject = sb_name
) AS sb_code,
sc_subject, sc_score
from tbl_score;

-- 2. subquery �� ����Ͽ�
-- tbl_subject table �� ���� �����ڵ带 �����ͼ�
-- tbl_score ���̺� update �����ϱ�
-- �Ʒ� ����� ��ü �������� sc_sbcode ���� 001 ���ڿ��� ��ü�Ѵ�
-- ���� �����ϰ� �߱�
-- ��� : update �� delete ����� where ���� ������ ���� ���� ����
UPDATE tbl_score
SET sc_sbcode = '001';

UPDATE tbl_score
SET sc_sbcode = 
(
    SELECT sb_code
    FROM tbl_subject
    WHERE sc_subject = sb_name
);

SELECT
    * FROM tbl_score;
-- 3. update �� ������ ����
-- tbl_score �� ������ 
-- tbl_subject �� ������� ��ġ���� �ʾ�
-- update ���� ���� �����Ͱ� �ִ��� Ȯ��


SELECT
    * FROM tbl_score
    WHERE sc_sbcode = '001';

-- Į���� ó�� �߰��� ���¿����� null ���� ��� �����Ƿ�
-- Į���� ���� null �� �����͸� ��ȸ�� ����
-- ����� ������Ѵ�
SELECT
    * FROM tbl_score
WHERE sc_sbcode is NULL;

-- 4. ���� ������ Į���� �������� ����
-- ���� ������ ���� �ڵ�(sc_sbcode) Į���� ���� ����̝��� ����� ��Ȳ�� �߻��� �� �ִ�
-- �й��� ������ �ִµ� �����ڵ尡 ������ ��ȸ�� �����Ϳ� ������ ������ �ִ�
-- ���� ������ �Է����� ���� ������ �����ϰ�
-- �ݺ��Ͽ� ���� ������ �� �ִ�
-- ���� ������ Į���� NOT NULL �� �����Ѵ�
-- NOT NULL ���� ���� :  ���� INSERT �ҋ� �� Į���� ��� ���Ƽ��� �ȵȴ�

ALTER TABLE tbl_score MODIFY (sc_sbcode NOT NULL);

-- ���ĺ��� �����͸� insert �� �� sc_sbcode Į���� �����Ͱ� ������ insert �� �źεȴ�



-- 5. tbl_score ���̺��� sc_subject  Į���� �ʿ䰡 ���� �Ǿ���
-- �����̶� ���� ������ �����ϱ� ���Ͽ� Į���� �����ϱ�

ALTER TABLE tbl_score DROP COLUMN sc_subject;
DESC tbl_score;

-- DBMS ������ ���̰� ���� ���ڿ��� �ε�ȣ �������� ����� ��ȸ�� �� �ִ�
SELECT *
FROM tbl_score
where sc_stnum < 'S0003'
order by sc_stnum;


-- EQ JOIN
-- �������Ἲ : �����Ϳ�����ġ
/*
���� JOIN
main table �� ����(foreign) table ���� 
���� ���� ���Ἲ�� �����Ǵ� ��쿡�� ����� �ŷڼ��� �����ȴ�

���� main table ���� �����Ͱ� �ִµ�
�����ϴ� ���� ���� table �� ���� ���
����� main table �� ����� ��ȸ���� �ʴ´�
*/
SELECT sc_stnum AS �й�, sc_sbcode AS �����ڵ�,
    sb_name as �����, sc_score as ����
FROM tbl_score, tbl_subject
where sc_sbcode = sb_code
order by sb_name;

SELECT
    * FROM tbl_score
    where sc_sbcode = 'SB001';

delete from tbl_subject
where sb_code = 'SB001';

insert into tbl_subject (sb_code, sb_name)
values ('SB001','����');

commit;


-- JOIN �ǽ�


-- EQ JOIN
SELECT sc_stnum AS �й�, sc_sbcode AS �����ڵ�,
       sb_name as �����, sc_score as ����
FROM tbl_score, tbl_subject
where sc_sbcode = sb_code
order by sb_name;

delete from tbl_subject
where sb_code = 'SB001';

-- ���� ���Ἲ�� �������� ���� table ���� join
-- ���� tbl_subject table ���� SB001 �����Ͱ� ������ �����̴�
-- tbl_score ���� SB001 ������ �����͵��� �ִ�
-- �� ���¿����� EQ JOIN ����� �ŷ��� �� ����
-- �̷��� ��쿡�� OUTER JOIN �� ����ؾ��Ѵ�

--tbl_score tbl_subject�� ���� ��ġ�ϴ� �����͸� ã�ƶ� ������ ����� ��� ������ null
-- (OUTER) LEFT JOIN
-- main table �� ���� table ���� ���� ���Ἲ�� �������� �ʴ� ��� ���
-- main table �� ���ǿ� ���� �����͸� ���� �����ϰ�
-- ���� table ���� ON ���ǿ� �´� �����͸� ��ȸ�Ѵ�
-- ���� table �� ON ���ǿ� �´� �����Ͱ� ������ �����͸� ��������
-- ������ null ���� �����´�

-- �������Ἲ�������� FK
SELECT sc_stnum AS �й�, sc_sbcode AS �����ڵ�,
       sb_name as �����, sc_score as ����
FROM tbl_score
    LEFT JOIN tbl_subject
    ON sc_sbcode = sb_code
where sc_stnum <= 's0003'
ORDER BY sc_sbcode;
ROLLBACK;

-- īƼ�� �� : �� table �� ��� �����͸� ���ؼ� ���
-- join �� table �� ��� �����͸� ������ ��ó�� ����Ʈ ���
-- �ټ��� table �� ����� �������� ������ �ѹ��� Ȯ���ϱ�
SELECT count(*) FROM tbl_score, tbl_subject;