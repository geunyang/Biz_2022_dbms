-- ����� user2

SELECT * FROM tbl_score;

/*

tbl_score  �����ʹ� �� �л��� ���������� ���� ���ڵ庰�� ����Ǿ� �ִ�
������� �þ�� �й�, �����, ���� �������� ��� �������ָ� �ȴ�

���� �ʿ��� �����ʹ� �й�, �����, ���� Į���ε� PK �� �����ϱ� ���� SEQ ���
Į���� �߰��� ���´�

SEQ Į���� ���� PK �� �����Ϸ��� �й� + ����� ���� �ΰ��� Į���� ���
PK�� �ؾ��Ѵ�
�ټ��� Į���� �������� PK�� �����ϴ� ���� Super Key  ��� �θ���
�ʿ信 ���� Super key �� PK �� ���� �ϱ⵵ ������ SuperKey ��
�߸� ����ϸ� ������ ���Ἲ�� ��ĥ�� �ִ�

UPDATE tbl_student SET sc_score = 90
WHERE sc_num = '1111' AND sc_subject = '����'

DELETE tbl_student
WHERE sc_num = '1111' AND sc_subject = '����'

*/

-- �й� S0044�� �л��� �̼������� 50 ������ 80 ������ �ٲٰ� �ʹ�
-- Update Delete �����Ҷ� ������(WHERE) �� ������ Į�� ������ �ο��ϴ� ���� ���� �ʴ�
UPDATE tbl_score SET sc_score = 80
WHERE sc_stnum = 'S0044' AND sc_subject = '�̼�';


-- 1. �����ϰ��� �ϴ� ������ �����͸� ���� ��ȸ
SELECT * FROM tbl_score
WHERE sc_stnum = 'S0044' AND sc_subject = '�̼�';

-- 2. �����ϰ��� �ϴ� �����Ͱ� ��ȸ�Ǹ� PK �� �������� Ȯ���Ѵ�
-- pk :308

-- 3. PK�� �������� �ϴ� Update ����� �����Ѵ�
UPDATE tbl_score SET sc_score = 80
WHERE sc_seq = 308;

-- 4. ���� �� ��Ȯ�� ���ϴ� ������ ���� �Ǿ����� Ȯ��

SELECT * FROM tbl_score WHERE sc_seq = 308;

-- �л����� ���� ������ �������
SELECT sc_stnum, Sum(sc_score)
FROM tbl_score
GROUP BY sc_stnum;

-- ����ȭ ���� �ʰ� �� ���񺰷� Į���� �ִ� table

SELECT sc_kor + sc_eng + sc_math FROM tbl_score;
    
-- �л����� ���� ������ ����ϰ�
--  �й� ������ ����

SELECT sc_stnum, SUM(sc_score)
FROM tbl_score
GROUP BY sc_stnum
ORDER BY sc_stnum;

-- ���� ��ȸ�� �Ͽ��µ� �й��� ������ ��Ÿ�� �̸��� �˼��� ����
-- �ΰ� �̻��� ���̺��� ���� �����Ͽ� �����͸� Ȯ���ϱ�
-- join �Ͽ� ������ �˻�
-- 1. tbl_score table �����͸� ���� ��ġ��
-- 2. sc_stnum  Į���� sc_score Į�� �����͸� �����ָ鼭
-- 3. tbl_score, sc_stnum �����͸� ������ tbl_student.st_num �� SELECT �� ��
-- 4. ��ġ�ϴ� �����Ͱ� ������ st_name Į���� �����ͼ� �Բ� ������

SELECT sc_stnum, st_name, sc_score
FROM tbl_score, tbl_student
WHERE sc_stnum = st_num
ORDER BY sc_stnum;