-- 여기는 셀핏 사용자 화면
create table tbl_sch (
    sc_id	VARCHAR2(4)		PRIMARY KEY,
    sc_num	VARCHAR2(6)	NOT NULL,
    sc_label	nVARCHAR2(10)	NOT NULL,
    sc_division	nVARCHAR2(20)	NOT NULL,	
    sc_day	VARCHAR2(10)	NOT NULL,
    sc_part	nVARCHAR2(30)	NOT NULL	

);

create table tbl_list (
    list_id	VARCHAR2(5)		PRIMARY KEY,
    list_name	nVARCHAR2(125)	NOT NULL	
);
DROP TABLE tbl_sch_list;
create table tbl_sch_list (
    sl_id	VARCHAR2(5)		PRIMARY KEY,
    sl_scid	VARCHAR2(4)	NOT NULL,	
    sl_listid	VARCHAR2(5)	NOT NULL,
    sl_listname	nVARCHAR2(125)	NOT NULL,	
    sl_set	NUMBER	NOT NULL,
    sl_weight	VARCHAR2(10)	NOT NULL,
    sl_rep	VARCHAR2(10)	NOT NULL	

);

select count(*) from tbl_sch;
SELECT COUNT(*) from tbl_list;
SELECT COUNT(*) from tbl_sch_list;

SELECT
    * FROM tbl_sch_list;

-- 대박졸았음VIEW복습꼼꼼히
DROP VIEW view_Workout;
create view view_WorkOut
as(
SELECT sl_id, sl_scid, 
        sc_num, sc_label, sc_division, sc_day, sc_part, 
        sl_listid, list_name,
        sl_set, sl_weight, sl_rep
     FROM tbl_sch_list
    LEFT JOIN tbl_sch
        ON sc_id=sl_scid
    LEFT join tbl_list
        ON list_id = sl_listid
);
SELECT
    * FROM view_workout
ORDER BY sc_num, sc_day;

SELECT sc_num,sc_label
FROM view_workout
GROUP BY sc_num, sc_label
ORDER BY sc_num;

SELECT sc_label
FROM view_workout
GROUP BY sc_label;

SELECT sc_label,sc_part
FROM view_workout
WHERE sc_label = '초급';

-- 운동스케줄 table 에서 등급id + label + division 을 묶어서 한개씩만 보고싶을때

SELECT sc_num, sc_label, sc_division
from tbl_sch
GROUP BY sc_num, sc_label, sc_division
order by sc_num;

SELECT
    * FROM view_workout
    WHERE sl_scid = 'D001';