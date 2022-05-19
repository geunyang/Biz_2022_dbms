-- ����� user2 ����ȭ��
SELECT * FROM tbl_student;

-- ���� ���̺� �缳��
-- ���� ���� ���̺� ����
-- DROP TABLE tbl_score;

-- �缳��� ���� ���̺� ����
CREATE TABLE tbl_score (
sc_stnum	VARCHAR2(5)	NOT NULL,	
sc_subject	nVARCHAR2(15)	NOT NULL,	
sc_score	NUMBER,		
sc_seq	NUMBER		PRIMARY KEY
);
-- ������ table ���� Ȯ��
DESC tbl_score;

-- ������ import

-- import �Ŀ� ������ ������ ī��Ʈ�Ͽ� import ��� Ȯ��
SELECT COUNT(*) FROM tbl_score;

/*
tbl_score ���̺��� ��1 ����ȭ�� �Ϸ�Ǿ� �缳��ǰ�
�����͸� import �� ���°� �Ǿ���
*/

-- �л�(�й�)���� ��ü ������ ����� ���غ���
-- DB �հ�� ����� ����ϴ� �Լ�
-- SUM(����Į��), AVG(����Į��)
-- ROUND(��, �ڸ���): �Ҽ��� ���� �����ϴ� �Լ�
-- ROUND(AVG(sc_score,1))
-- AVG() �Լ��� ���� ����� �Ҽ��� 2��°���� �ݿø� �Ͽ� ù��° �ڸ������� ǥ��

SELECT sc_stnum, SUM(sc_score) AS ����, ROUND(AVG(sc_score),1) AS ���
FROM tbl_score
GROUP BY sc_stnum;

-- ROUND(AVG(sc_score)) = ROUND(AVG(sc_score),0)  
-- �Ҽ� �κп��� �ݿø� �Ͽ� ������ ǥ��
SELECT sc_stnum, SUM(sc_score) AS ����, ROUND(AVG(sc_score)) AS ���
FROM tbl_score
GROUP BY sc_stnum;

-- ��ü �л��� ���� ������ ����� ���ϱ�
-- �����(sc_subject Į��)���� �׷��� ����
-- �׷쳻���� ������ ����� ����϶�
SELECT sc_subject, SUM(sc_score) AS ����, ROUND(AVG(sc_score)) AS  ���
FROM tbl_score
GROUP BY sc_subject;
/*
�л���(group by) ������ ����� ���ϰ�
��� ������ ���� �������� ���� ���� ������ ���̱�
*/

SELECT sc_stnum, SUM(sc_score) AS ����, ROUND(AVG(sc_score),1) AS ���
FROM tbl_score
GROUP BY sc_stnum
ORDER BY ROUND(AVG(sc_score),1) DESC;


/*
��ü �л��� ���� ������ ����� ���ϰ�
����� ������ ���� �������� ���� ���� ������ ���̱�
*/
SELECT sc_subject, SUM(sc_score) AS ����, ROUND(AVG(sc_score),1) AS ���
FROM tbl_score
GROUP BY sc_subject
ORDER BY ROUND(AVG(sc_score),1);

/*
DBMS �� ǥ�� ����Լ�
GROUPBY�� �����׸��� ���� �����׸� ������
����(count), �հ�(sum), ���(avg), �ִ밪(max), �ּҰ�(min) ���� ����ϴ� �Լ�
����Լ��� ���� ���� Į���� �ݵ�� Group BY �� ����ؾ��Ѵ�
*/

-- ���� ������ ����� ����ϰ�
-- ����� 76�� �̻��� ���� ���̱�
-- ����Լ��� ���� ����� ���� ���Ǻο�
SELECT sc_subject, SUM(sc_score) AS ����, ROUND(AVG(sc_score),2) AS ���
FROM tbl_score
GROUP BY sc_subject
HAVING ROUND(AVG(sc_score),2) > 75;

-- ����, ���� ������ ������ ��հ��

SELECT sc_subject, SUM(sc_score) AS ����, ROUND(AVG(sc_score),2) AS ���
FROM tbl_score
GROUP BY sc_subject
HAVING sc_subject = '����' OR sc_subject = '����';


SELECT sc_subject, SUM(sc_score) AS ����, ROUND(AVG(sc_score),2) AS ���
FROM tbl_score
GROUP BY sc_subject
HAVING sc_subject IN('����', '����');

// ��ü ���ǿ��� ���ǿ� �´� �ͺ��� ����
SELECT sc_subject, SUM(sc_score) AS ����, ROUND(AVG(sc_score),2) AS ���
FROM tbl_score
WHERE sc_subject IN('����', '����')
GROUP BY sc_subject;

/*
����Լ��� GROUPBY �� ����Ͽ� ��迬���� ������ �� ���ǻ���
��迬�� ����� � ������ �ο��Ͽ� �����͸� ������ �Ҷ��� 
WHERE ���̳� HAVING ���� ������ �ο� �� �� �ִ�.

��� ������ ����� ����� ���Ͽ� ������ �ο��Ҷ��� ��¿�� ���� 
HAVING ���� ������ �ο��ؾ��� ���̴�.

������ ���� ����� �ƴ� � ���ǿ� ��ġ�ϴ� �����͵鿡�Ը�
��迬���� �����ϰ��� �Ҷ��� 
WHERE ���� ������ �ο� �� �� ������ �ݵ�� ����ؾ��Ѵ�.

��� �Լ��� GROUPBY�� ���� ��迬���� 
SQL ��ȸ ��ɿ��� ���� ���� �����̴�
*/