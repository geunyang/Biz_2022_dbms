--여기는 user2
SELECT
    * FROM tbl_score
    WHERE sc_subject = '영어';

/*
성적 데이터가 저장된 tbl_score table 의 데이터중
영어과목을 영어영문으로 변경하고 싶다
SQL 의 UPDATE 명령을 이용하면 간단히 해결할 수 있다

하지만 현재 table 에서 100 개의 레코드(데이터들)이 변경되는 문제가 발생한다
한번에 다량의 레코드의 데이터가 변경되는 경우
데이터 무결성, transaction 등의 문제를 일으킬 수 있다

자주 일어나는 상황은 아니지만 이러한 상황이 발생하지 않도록
table 설계를 다시 수행해야 한다
*/
UPDATE tbl_score
SET sc_subject = '영어영문과'
WHERE sc_subject = '영어';

/*
tbl_score 테이블의 초기 설계 오류로 인해 과목명이 일반 문자열로 등록되었다
만약 과목명을 변경하려면 많은 데이터를 변경해야 하게 때문에
문제를 일으킬것이다

tbl_score 테이블의 설계를 변경하여
과목정보 테이블을 생성하고
과목정보와 연계하여 과목명을 볼 수 있도록 하겠다
*/

-- tbl_score 에서 과목명만 추출하기
-- tbl_score table 에서 과목명을 중복없이 추출하기
SELECT sc_subject
FROM tbl_score
GROUP BY sc_subject
ORDER BY sc_subject;

-- tbl_score 에서 학번만 중복 없이 추출하기

SELECT sc_stnum
FROM tbl_score
GROUP BY sc_stnum
ORDER BY sc_stnum;

-- 추출한 과목명을 엑셀에 복사하여
-- 과목코드를 부여한 데이터를 확보했다

-- 과목정보를 저장할 테이블 생성

CREATE TABLE tbl_subject (
    sb_code	VARCHAR2(5)	NOT NULL	PRIMARY KEY,
    sb_name	nVARCHAR2(25)	NOT NULL	

);

-- 테이블에 import
-- import 확인
SELECT
    * FROM tbl_subject;
    
-- 고객에게 시스템 정비가 있다는 공지문자 보내기

-- tbl_score 테이블의 구조변경하기
/* 
SQL DDL (data definition) 명령
CREATE(새로운객체생성), DROP(객체제거), ALTER(객체의구조변경) 
객체 (테이블) 의 구조를 변경하는 것은 많은 위험과 비용을 유발한다
테이블의 구조를 변경하는것은 데이터의 무결성을 심각하게 위협할 수 있다

1.tbl_score에 sc_sbcode "칼럼을 추가" 하기


*/

ALTER TABLE tbl_score
ADD sc_sbcode VARCHAR2(5);

DESC tbl_score;

SELECT
    * FROM tbl_score;
-- projection: 칼럼을 원하는것만 원하는 순서로 보여달라
SELECT sc_seq, sc_stnum, sc_sbcode, sc_subject, sc_score
from tbl_score;

-- sub query
-- query 가 다른 query 의 결과를 포함하는 구조
SELECT sc_seq, sc_stnum, 
(
    SELECT sb_code FROM tbl_subject
    WHERE sc_subject = sb_name
) AS sb_code,
sc_subject, sc_score
from tbl_score;

-- 2. subquery 를 사용하여
-- tbl_subject table 로 부터 과목코드를 가져와서
-- tbl_score 테이블에 update 실행하기
-- 아래 명령은 전체 데이터의 sc_sbcode 값을 001 문자열로 대체한다
-- 드디어 일주일간 야근
-- 경고 : update 와 delete 명령은 where 절이 없을때 절대 실행 금지
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
-- 3. update 후 데이터 검증
-- tbl_score 의 과목명과 
-- tbl_subject 의 과목명이 일치하지 않아
-- update 되지 않은 데이터가 있는지 확인


SELECT
    * FROM tbl_score
    WHERE sc_sbcode = '001';

-- 칼럼을 처음 추가한 상태에서는 null 값이 담겨 있으므로
-- 칼럼의 값이 null 인 데이터만 조회해 본다
-- 결과는 없어야한다
SELECT
    * FROM tbl_score
WHERE sc_sbcode is NULL;

-- 4. 새로 생성된 칼럼에 제약조건 설정
-- 새로 생성된 과목 코드(sc_sbcode) 칼럼은 값이 비어이씅면 곤란한 상황이 발생할 수 있다
-- 학번과 점수는 있는데 과목코드가 없으면 조회한 데이터에 문제가 있을수 있다
-- 또한 점수를 입력하지 않은 것으로 생각하고
-- 반복하여 값을 저장할 수 있다
-- 새로 생성한 칼럼을 NOT NULL 로 설정한다
-- NOT NULL 제약 조건 :  값을 INSERT 할떄 이 칼럼은 비워 놓아서는 안된다

ALTER TABLE tbl_score MODIFY (sc_sbcode NOT NULL);

-- 이후부터 데이터를 insert 할 때 sc_sbcode 칼럼의 데이터가 없으면 insert 가 거부된다



-- 5. tbl_score 테이블에서 sc_subject  칼럼은 필요가 없게 되었다
-- 조금이라도 저장 공간을 절약하기 위하여 칼럼을 삭제하기

ALTER TABLE tbl_score DROP COLUMN sc_subject;
DESC tbl_score;

-- DBMS 에서는 길이가 같은 문자열은 부등호 조건으로 결과를 조회할 수 있다
SELECT *
FROM tbl_score
where sc_stnum < 'S0003'
order by sc_stnum;


-- EQ JOIN
-- 참조무결성 : 데이터완전일치
/*
완전 JOIN
main table 과 참조(foreign) table 간에 
완전 참조 무결성이 유지되는 경우에만 결과에 신뢰성이 유지된다

만약 main table 에는 데이터가 있는데
참조하는 값이 참조 table 에 없는 경우
결과는 main table 의 결과가 조회되지 않는다
*/
SELECT sc_stnum AS 학번, sc_sbcode AS 과목코드,
    sb_name as 과목명, sc_score as 점수
FROM tbl_score, tbl_subject
where sc_sbcode = sb_code
order by sb_name;

SELECT
    * FROM tbl_score
    where sc_sbcode = 'SB001';

delete from tbl_subject
where sb_code = 'SB001';

insert into tbl_subject (sb_code, sb_name)
values ('SB001','국어');

commit;


-- JOIN 실습


-- EQ JOIN
SELECT sc_stnum AS 학번, sc_sbcode AS 과목코드,
       sb_name as 과목명, sc_score as 점수
FROM tbl_score, tbl_subject
where sc_sbcode = sb_code
order by sb_name;

delete from tbl_subject
where sb_code = 'SB001';

-- 참조 무결성이 유지되지 않은 table 간의 join
-- 현재 tbl_subject table 에는 SB001 데이터가 삭제된 상태이다
-- tbl_score 에는 SB001 과목의 데이터들이 있다
-- 이 상태에서는 EQ JOIN 결과는 신뢰할 수 없다
-- 이러한 경우에는 OUTER JOIN 을 사용해야한다

--tbl_score tbl_subject에 가서 일치하는 데이터를 찾아라 있으면 과목명 출력 없으면 null
-- (OUTER) LEFT JOIN
-- main table 과 참조 table 간에 참조 무결성이 유지되지 않는 경우 사용
-- main table 은 조건에 따라 데이터를 전부 나열하고
-- 참조 table 에서 ON 조건에 맞는 데이터를 조회한다
-- 참조 table 에 ON 조건에 맞는 데이터가 있으면 데이터를 가져오고
-- 없으면 null 값을 가져온다

-- 참조무결성제약조건 FK
SELECT sc_stnum AS 학번, sc_sbcode AS 과목코드,
       sb_name as 과목명, sc_score as 점수
FROM tbl_score
    LEFT JOIN tbl_subject
    ON sc_sbcode = sb_code
where sc_stnum <= 's0003'
ORDER BY sc_sbcode;
ROLLBACK;

-- 카티션 곱 : 두 table 의 모든 데이터를 곱해서 출력
-- join 된 table 의 모든 데이터를 곱셈한 것처럼 리스트 출력
-- 다수의 table 에 저장된 데이터의 개수를 한번에 확인하기
SELECT count(*) FROM tbl_score, tbl_subject;