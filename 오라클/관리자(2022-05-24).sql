-- 관리자화면
-- TableSpace 생성하기
-- 이름: iolist
-- 데이터파일(물리적저장소) C:/oraclexe/data/iolist.dbf
-- 초기사이즈 1mb
-- 용량이 부족할경우 자동증가 1kb
CREATE TABLESPACE iolist
DATAFILE 'C:/oraclexe/data/iolist.dbf'
size 1M REUSE
AUTOEXTEND ON NEXT 1K;

-- tablespace 삭제하기
-- 모든 컨텐츠와 데이터파일 및 연관 정보까지 삭제
DROP TABLESPACE iolist
INCLUDING contents And datafiles
cascade CONSTRAINTS;

-- 사용자 생성
-- username : user3, password:12341234
-- default tablespace : 이 사용자 계정으로 데이터를 추가하면 iolist 에 저장하라
CREATE USER user3 IDENTIFIED by 12341234 default tablespace iolist;

-- 사용자 등록은 했으나 아무런 일도 할수없는 상태
-- 사용자에게 db 연결, 조회, 추가, 삭제, 변경 등을 할수 있는 권한 부여해야한다
-- 원칙은 권한을 세세하게 부여하여 불필요한 권한을 갖지 않도록 해야하지만
-- 학습상 불편함이 있어 여기서는 DBA 권한을 부여할 것이다
-- ddl dcl dml 정처기필기
grant DBA to user3;

-- 권한회수
revoke dba to user3;

-- 사용자계정 완전 삭제하기
drop user user3 cascade;