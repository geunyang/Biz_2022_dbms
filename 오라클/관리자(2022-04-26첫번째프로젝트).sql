-- C:\oraclexe\data
/*
관리자로 접속하여 할 일
TableSpace 생성
user acc 생성 및 TableSpace 연결
user 권한부여

관리자로 접속하여 '생성' 을 할때는 
CREATE 라는 키워드를 사용한다
'삭제'를 할때는 DROP 이라는 키워드를 사용한다
*/
/*
1. TableSpace 생성
    오라클은 물리적 저장공간을 TableSpace라는 이름으로 관리한다
    오라클 DBMS를 사용하여 데이터를 관리하기 위해서는
    제일 먼저 TableSpace를 생성해야한다
    오라클 DBMS를 설치하면 System 이 관리하는 TableSpace가 기본으로 생성된다
    System TableSpace 에는 중요한 데이터들이 저장되므로 
    가급적 일반적인 대량의 data를 저장하지 않는것이 좋다
    
    때문에 프로젝트별로 TableSpace를 만드는 것이 좋다

*/

CREATE TABLESPACE firstDB
DATAFILE 'C:/oraclexe/data/first.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1k;

-- 기존에 생성한 TABLESPACE를 완전히 삭제하기

DROP TABLESPACE firstdb
INCLUDING CONTENTS and datafiles CASCADE CONSTRAINTS;

/*
2. 사용자 생성과 TABLESPACE 연결
*/
CREATE USER user1 identified by 12341234
default tablespace firstdb;

/*
사용자를 생성하면서 default tablespace 를 연결하지 않았을 경우
생성된 사용자 정보에 tablespace 추가하기
단, 생성된 사용자 권한으로 데이터가 추가된 데이터가 없어야한다
*/
alter user user1 default tablespace firstdb;

-- 사용자 삭제 명령
drop user user1 cascade;

/*
오라클에서 새로운 사용자를 생성하면 생성된 사용자는 아무런 권한이 없다
심지어 dbms에 접속할 권한마저 없다
따라서 생성된 사용자에게는 적절한 수준의 권한을 부여해야한다
GRANT 부여, REVOKE 뺏기
*/

-- 접속(logon) 권한 부여
Grant Create Session to user1;

-- 테이블 생성 권한 부여
GRANT CREATE TABLE to user1;

-- tablespace에 접근 권한 부여
GRANT Unlimited tablespace to user1;

-- 유저권한회수
REVOKE CREATE SESSION FROM user1;

/*
dbms 에서 사용하는 sql(structed Query lang) 명령들

## DDL(Data definition Lang:데이터정의어)
create로 시작하는 명령
    객체의 생성명령들
    Create tablespace
    create user
    create table

drop 으로 시작하는 명령
    객체의 제거명령들


Alter 로 시작하는 명령
    객체의 상태, 구조 등을 변경하는 명령

## DCL(Data Controll Lang:데이터제어어)

GRANT
사용자에게 권한을 부여하는 명령
REVOKE
사용자에게서 권환을 회수하는 명령
COMMIT,ROLLBACK

## DML(Data Manipulation Lang, Data Management Lang : 데이터 조작어, 관리어)
생성된 table 에 대한 데이터 조작
C create : Table 데이터 추가 : INSERT
R read : Table에 저장된 데이터를 읽어오기 : SELECT
U update : Table에 저장된 데이터의 내용을 변경하기 : UPDATE
D delete : Table에 저장된 데이터를 삭제하는 명령 : DELETE
    
*/

/*
개발, 학습자 입장에서 사용자에게 권한 부여하기
사용자에게 부여하는 권한은 하나하나 부여하는 것이 원칙이다
실무에서는 회사의 정책에 따라 적절한 권한을 관리 해야한다
권한이 잘못 부여되면 DB에 저장된 data에 손상을 가할 수 있고
손상된 data는 신뢰성을 잃는다

손상된 data가 저장된 데이터베이스 시스템은 '무결성이 파괴'되었다고 표현한다

여기는 학습의 편의성을 위하여 사용자에게 최고 권한을 부여할것이다
DBA 권한은 sysDBA 보다 약간의 제약이 있는 권한이다
오라클 DBMS의 중요한 정보 접근을 제외하고 모든 것을 다 할 수 있다.
심지어 다른 사용자의 TABLESPACE에도 접근할 수 있다.
*/

Grant DBA to user1;


