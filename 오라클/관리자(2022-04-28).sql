-- ����� ������ ȭ��
-- C:\oraclexe\data

/*
����Ŭ DBMS�� �����͸� �����ϰ� �����ϱ� ���� ����

������ �����Ͽ�
1. TableSpace ����
2. ����� ���� �� TableSpace ����
3. ����ڿ��� ���� �ο�
*/

CREATE TABLESPACE school
DATAFILE 'C:/oraclexe/data/school.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER user2 IDENTIFIED BY 12341234
DEFAULT TABLESPACE school;

GRANT DBA TO user2;


