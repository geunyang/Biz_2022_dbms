-- 여기는 user2 접속화면
SELECT * FROM tbl_student;

-- 성적 테이블 재설계
-- 기존 성적 테이블 제거
-- DROP TABLE tbl_score;

-- 재설계된 성적 테이블 생성
CREATE TABLE tbl_score (
sc_stnum	VARCHAR2(5)	NOT NULL,	
sc_subject	nVARCHAR2(15)	NOT NULL,	
sc_score	NUMBER,		
sc_seq	NUMBER		PRIMARY KEY
);
-- 생성된 table 구조 확인
DESC tbl_score;

-- 데이터 import

-- import 후에 데이터 수량을 카운트하여 import 결과 확인
SELECT COUNT(*) FROM tbl_score;

/*
tbl_score 테이블은 제1 정규화가 완료되어 재설계되고
데이터를 import 한 상태가 되었다
*/

-- 학생(학번)별로 전체 총점과 평균을 구해보자
-- DB 합계와 평균을 계산하는 함수
-- SUM(숫자칼럼), AVG(숫자칼럼)
-- ROUND(값, 자리수): 소수점 이하 관리하는 함수
-- ROUND(AVG(sc_score,1))
-- AVG() 함수로 구한 결과를 소수점 2번째에서 반올림 하여 첫번째 자리까지만 표현

SELECT sc_stnum, SUM(sc_score) AS 총점, ROUND(AVG(sc_score),1) AS 평균
FROM tbl_score
GROUP BY sc_stnum;

-- ROUND(AVG(sc_score)) = ROUND(AVG(sc_score),0)  
-- 소수 부분에서 반올림 하여 정수만 표현
SELECT sc_stnum, SUM(sc_score) AS 총점, ROUND(AVG(sc_score)) AS 평균
FROM tbl_score
GROUP BY sc_stnum;

-- 전체 학생의 과목별 총점과 평균을 구하기
-- 과목명(sc_subject 칼럼)으로 그룹을 묶고
-- 그룹내에서 총점과 평균을 계산하라
SELECT sc_subject, SUM(sc_score) AS 총점, ROUND(AVG(sc_score)) AS  평균
FROM tbl_score
GROUP BY sc_subject;
/*
학생별(group by) 총점과 평균을 구하고
평균 순으로 높은 점수부터 낮은 점수 순으로 보이기
*/

SELECT sc_stnum, SUM(sc_score) AS 총점, ROUND(AVG(sc_score),1) AS 평균
FROM tbl_score
GROUP BY sc_stnum
ORDER BY ROUND(AVG(sc_score),1) DESC;


/*
전체 학생의 과목별 총점과 평균을 구하고
평균이 순으로 낮은 점수부터 높은 점수 순으로 보이기
*/
SELECT sc_subject, SUM(sc_score) AS 총점, ROUND(AVG(sc_score),1) AS 평균
FROM tbl_score
GROUP BY sc_subject
ORDER BY ROUND(AVG(sc_score),1);

/*
DBMS 의 표준 통계함수
GROUPBY로 공통항목을 묶고 공통항목 내에서
개수(count), 합계(sum), 평균(avg), 최대값(max), 최소값(min) 등을 계산하는 함수
통계함수로 묶지 않은 칼럼은 반드시 Group BY 에 명시해야한다
*/

-- 과목별 총점과 평균을 계산하고
-- 평균이 76점 이상인 과목만 보이기
-- 통계함수로 계산된 결과에 대한 조건부여
SELECT sc_subject, SUM(sc_score) AS 총점, ROUND(AVG(sc_score),2) AS 평균
FROM tbl_score
GROUP BY sc_subject
HAVING ROUND(AVG(sc_score),2) > 75;

-- 음악, 국어 과목의 총점과 평균계산

SELECT sc_subject, SUM(sc_score) AS 총점, ROUND(AVG(sc_score),2) AS 평균
FROM tbl_score
GROUP BY sc_subject
HAVING sc_subject = '음악' OR sc_subject = '국어';


SELECT sc_subject, SUM(sc_score) AS 총점, ROUND(AVG(sc_score),2) AS 평균
FROM tbl_score
GROUP BY sc_subject
HAVING sc_subject IN('음악', '국어');

// 전체 조건에서 조건에 맞는 것부터 추출
SELECT sc_subject, SUM(sc_score) AS 총점, ROUND(AVG(sc_score),2) AS 평균
FROM tbl_score
WHERE sc_subject IN('음악', '국어')
GROUP BY sc_subject;

/*
통계함수와 GROUPBY 를 사용하여 통계연산을 수행할 때 주의사항
통계연산 결과에 어떤 조건을 부여하여 데이터를 보고자 할때는 
WHERE 절이나 HAVING 절에 조건을 부여 할 수 있다.

통계 연산이 수행된 결과에 대하여 조건을 부여할때는 어쩔수 없이 
HAVING 절에 조건을 부여해야할 것이다.

하지만 연산 결과가 아닌 어떤 조건에 일치하는 데이터들에게만
통계연산을 수행하고자 할때는 
WHERE 절에 조건을 부여 할 수 없는지 반드시 고민해야한다.

통계 함수와 GROUPBY를 통한 통계연산은 
SQL 조회 명령에서 많이 느린 연산이다
*/