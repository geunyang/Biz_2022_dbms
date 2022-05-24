-- ������ȭ��
-- TableSpace �����ϱ�
-- �̸�: iolist
-- ����������(�����������) C:/oraclexe/data/iolist.dbf
-- �ʱ������ 1mb
-- �뷮�� �����Ұ�� �ڵ����� 1kb
CREATE TABLESPACE iolist
DATAFILE 'C:/oraclexe/data/iolist.dbf'
size 1M REUSE
AUTOEXTEND ON NEXT 1K;

-- tablespace �����ϱ�
-- ��� �������� ���������� �� ���� �������� ����
DROP TABLESPACE iolist
INCLUDING contents And datafiles
cascade CONSTRAINTS;

-- ����� ����
-- username : user3, password:12341234
-- default tablespace : �� ����� �������� �����͸� �߰��ϸ� iolist �� �����϶�
CREATE USER user3 IDENTIFIED by 12341234 default tablespace iolist;

-- ����� ����� ������ �ƹ��� �ϵ� �Ҽ����� ����
-- ����ڿ��� db ����, ��ȸ, �߰�, ����, ���� ���� �Ҽ� �ִ� ���� �ο��ؾ��Ѵ�
-- ��Ģ�� ������ �����ϰ� �ο��Ͽ� ���ʿ��� ������ ���� �ʵ��� �ؾ�������
-- �н��� �������� �־� ���⼭�� DBA ������ �ο��� ���̴�
-- ddl dcl dml ��ó���ʱ�
grant DBA to user3;

-- ����ȸ��
revoke dba to user3;

-- ����ڰ��� ���� �����ϱ�
drop user user3 cascade;