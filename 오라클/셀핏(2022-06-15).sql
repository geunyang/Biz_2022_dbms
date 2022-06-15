-- selfit 사용자로 접속한 화면
SELECT sc_num, sc_label, sc_division, sc_day, sc_part
FROM tbl_sch;

-- projection
-- tbl_sch 테이블에 있는 모든 데이터중에서 sc_num, sc_label, sc_division 칼럼만 
-- 나열하여 보고싶다
-- 일부 칼럼만 한정하여 데이터를 보고자 할때 
SELECT sc_num, sc_label, sc_division
FROM tbl_sch;

-- SELECTION
-- where 조건을 부여하여
-- 튜플(출력되는 데이터) 의 개수를 제한하기
-- 카디날리티????
SELECT sc_num, sc_label, sc_division
FROM tbl_sch
WHERE sc_num = '01-001';


-- SELECT, projection 을 수행할텐데
-- sc_num, sc_label, sc_division 칼럼의 데이터들을 중복 없이 확인하고 싶다
-- sc_num 칼럼을 기준으로 오름차순 정렬
SELECT sc_num, sc_label, sc_division
FROM tbl_sch
Group by sc_num, sc_label, sc_division
ORDER BY sc_num;

-- SUBSTR(sc_num,1,2) : sc_num 데이터 중에서 첫번째 글자부터 두번째 글자까지
SELECT sc_num, sc_label, sc_division
FROM tbl_sch
WHERE SUBSTR(sc_num,1,2) = '03'
Group by sc_num, sc_label, sc_division
ORDER BY sc_num;

SELECT
    * FROM view_workout
WHERE SL_SCID = 'D040';