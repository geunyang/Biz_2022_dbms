-- 여기는 root 화면
-- root 는 oracle 의 sys 와 같은 역할
/*
mySQL 사용자와 DB(data저장소) 의 관계가 연결되어 있지 않다
오라클에서는 사용자에게 defalt table space 지정하여
login(접속)을 하면 자동으로 기본 DB 가 연결된다
사용자는 단순히 DB 서버에 접속하는 권한을 부여 받을 뿐이고
어떤 DB를 사용할것인지 처음 시작할때 연결을 해주어야한다
*/
-- DB 저장소 생성

create database myDB;

-- 일반 사용자 생성
-- MySQL 은 전통적으로 root 사용자로 접속하여 DB관리한다
-- 최근 추세는 root 사용자는 DB, USER 생성만을 담당하고
-- DB 관리는 일반 사용자 등을 생성하여 실행하도록 권장한다
-- MySQL 은 사용자를 생성할 때 어떤 방법으로 접속 할 것인지 명시해야한다

-- ballza 사용자는 localhost 에서만 mySQL 서버에 접속 할 수 있다
drop user 'ballza'@'localhost';

create user 'ballza'@'localhost' identified by '!Korea8080';
/*
mySQL 은 사용자를 등록하면
그 사용자는 기본적으로 DBA 권한을 갖는다
MySQL 은 실무에서 가장 많이 사용하는 버전이 5.7.X이다
5.7 버전은 사용자 등록과 동시에 DB 관련 명령을 대부분 사용할 수 있다
8.x 버전은 사용자 권한이 좀 더 엄격해졌다

새로 등록한 사용자에게 DB에 접근할 수 있는 권한을 부여하기
callor@localhost 사용자에게 mydb Schema 에 접근하여
모든 DML 명령을 수행할 수 있는 권한을 부여하겠다
*/

grant all privileges on mydb.* to 'ballza'@'localhost';

create user 'user1'@'127.0.0.1' identified by '!Korea8080';
-- user1에 모든 db schema 접근 권한 부여(실무사용금지)
grant all privileges on *.* to 'user1'@'127.0.0.1';


-- 어디에서나 접속 할 수 있도록 범위를 지정하지 않는 사용자 등록
create user 'user2'@'*' identified by '!Korea8080';