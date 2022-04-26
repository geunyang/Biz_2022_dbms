-- C:\oraclexe\data
/*
�����ڷ� �����Ͽ� �� ��
TableSpace ����
user acc ���� �� TableSpace ����
user ���Ѻο�

�����ڷ� �����Ͽ� '����' �� �Ҷ��� 
CREATE ��� Ű���带 ����Ѵ�
'����'�� �Ҷ��� DROP �̶�� Ű���带 ����Ѵ�
*/
/*
1. TableSpace ����
    ����Ŭ�� ������ ��������� TableSpace��� �̸����� �����Ѵ�
    ����Ŭ DBMS�� ����Ͽ� �����͸� �����ϱ� ���ؼ���
    ���� ���� TableSpace�� �����ؾ��Ѵ�
    ����Ŭ DBMS�� ��ġ�ϸ� System �� �����ϴ� TableSpace�� �⺻���� �����ȴ�
    System TableSpace ���� �߿��� �����͵��� ����ǹǷ� 
    ������ �Ϲ����� �뷮�� data�� �������� �ʴ°��� ����
    
    ������ ������Ʈ���� TableSpace�� ����� ���� ����

*/

CREATE TABLESPACE firstDB
DATAFILE 'C:/oraclexe/data/first.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1k;

-- ������ ������ TABLESPACE�� ������ �����ϱ�

DROP TABLESPACE firstdb
INCLUDING CONTENTS and datafiles CASCADE CONSTRAINTS;

/*
2. ����� ������ TABLESPACE ����
*/
CREATE USER user1 identified by 12341234
default tablespace firstdb;

/*
����ڸ� �����ϸ鼭 default tablespace �� �������� �ʾ��� ���
������ ����� ������ tablespace �߰��ϱ�
��, ������ ����� �������� �����Ͱ� �߰��� �����Ͱ� ������Ѵ�
*/
alter user user1 default tablespace firstdb;

-- ����� ���� ���
drop user user1 cascade;

/*
����Ŭ���� ���ο� ����ڸ� �����ϸ� ������ ����ڴ� �ƹ��� ������ ����
������ dbms�� ������ ���Ѹ��� ����
���� ������ ����ڿ��Դ� ������ ������ ������ �ο��ؾ��Ѵ�
GRANT �ο�, REVOKE ����
*/

-- ����(logon) ���� �ο�
Grant Create Session to user1;

-- ���̺� ���� ���� �ο�
GRANT CREATE TABLE to user1;

-- tablespace�� ���� ���� �ο�
GRANT Unlimited tablespace to user1;

-- ��������ȸ��
REVOKE CREATE SESSION FROM user1;

/*
dbms ���� ����ϴ� sql(structed Query lang) ��ɵ�

## DDL(Data definition Lang:���������Ǿ�)
create�� �����ϴ� ���
    ��ü�� ������ɵ�
    Create tablespace
    create user
    create table

drop ���� �����ϴ� ���
    ��ü�� ���Ÿ�ɵ�


Alter �� �����ϴ� ���
    ��ü�� ����, ���� ���� �����ϴ� ���

## DCL(Data Controll Lang:�����������)

GRANT
����ڿ��� ������ �ο��ϴ� ���
REVOKE
����ڿ��Լ� ��ȯ�� ȸ���ϴ� ���
COMMIT,ROLLBACK

## DML(Data Manipulation Lang, Data Management Lang : ������ ���۾�, ������)
������ table �� ���� ������ ����
C create : Table ������ �߰� : INSERT
R read : Table�� ����� �����͸� �о���� : SELECT
U update : Table�� ����� �������� ������ �����ϱ� : UPDATE
D delete : Table�� ����� �����͸� �����ϴ� ��� : DELETE
    
*/

/*
����, �н��� ���忡�� ����ڿ��� ���� �ο��ϱ�
����ڿ��� �ο��ϴ� ������ �ϳ��ϳ� �ο��ϴ� ���� ��Ģ�̴�
�ǹ������� ȸ���� ��å�� ���� ������ ������ ���� �ؾ��Ѵ�
������ �߸� �ο��Ǹ� DB�� ����� data�� �ջ��� ���� �� �ְ�
�ջ�� data�� �ŷڼ��� �Ҵ´�

�ջ�� data�� ����� �����ͺ��̽� �ý����� '���Ἲ�� �ı�'�Ǿ��ٰ� ǥ���Ѵ�

����� �н��� ���Ǽ��� ���Ͽ� ����ڿ��� �ְ� ������ �ο��Ұ��̴�
DBA ������ sysDBA ���� �ణ�� ������ �ִ� �����̴�
����Ŭ DBMS�� �߿��� ���� ������ �����ϰ� ��� ���� �� �� �� �ִ�.
������ �ٸ� ������� TABLESPACE���� ������ �� �ִ�.
*/

Grant DBA to user1;


