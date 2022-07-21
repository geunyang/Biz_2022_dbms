-- gaeballza
use schoolDB;
drop table tbl_student;
create table tbl_student (
st_num	VARCHAR(5)	PRIMARY KEY,
st_name	VARCHAR(20)	NOT NULL,
st_dept	VARCHAR(20),
st_grade	INT,	
st_tel	VARCHAR(16)	NOT NULL,
st_addr	VARCHAR(125)
);

select count(*) from tbl_student;

create table tbl_subject (
sb_code	VARCHAR(5)	NOT NULL	PRIMARY KEY,
sb_name	VARCHAR(25)	NOT NULL	
);

-- mySQL 의 다중 insert 
insert into tbl_subject(sb_code,sb_name)
values
('SB001','국어'),
('SB002','데이터베이스'),
('SB003','미술'),
('SB004','소프트웨어공학'),
('SB005','수학'),
('SB006','영어영문'),
('SB007','음악');

select * from tbl_subject;

-- 성적이 저장될 table
-- 학생 정보와 과목 정보가 함께 연동되어 점수관리
-- sc_seq 임의 칼럼을 만들어 PK 로 지정
-- 한개의 학번에 과목 코드가 중복되지 않도록 unique(sc_stnum, sc_sbcode) 설정

create table tbl_score(
sc_seq	BIGINT	PRIMARY KEY auto_increment,
sc_stnum	VARCHAR(5)	NOT NULL,	
sc_sbcode	VARCHAR(5)	NOT NULL,	
sc_score	INT,
unique(sc_stnum, sc_sbcode)
);

select count(*) from tbl_score;

-- tbl_score 데이터에서 점수가 70점 이하 데이터 추출
-- 학번 순으로 리스트 나열
-- selection 조건절(where)을 추가하여 조건에 맞는 데이터만 추출

select * from tbl_score
where sc_score <= 70
order by sc_stnum;

-- tbl_score 데이터에서 과목 코드와 점수 칼럼만 추출
-- table 많은 칼럼(속성 attribute, 필드 field) 이 있을 경우
-- 필요한 칼럼만 나열하여 리스트를 보고자 할때
select sc_sbcode as 과목코드, sc_score as 점수
from tbl_score;

-- tbl_score 데이터에서 점수가 50 이상 70 이하인 데이터
-- 과목코드와 점수만 보이도록

select sc_sbcode as 과목코드, sc_score as 점수
from tbl_score
where sc_score >= 50
and sc_score <= 70;

-- 범위를 지정할 때 이상 and 이하일 경우 between 사용 가능
select sc_sbcode as 과목코드, sc_score as 점수
from tbl_score
where sc_score between 50 and 70;

-- 점수가 50 이상 70 이하인 데이터
-- tbl_subject table 과 연결하여
-- 과목코드, 과목명, 점수 칼럼이 보이도록

-- eq join
select sc_sbcode, sc_score
from tbl_score, tbl_subject
where sc_sbcode = sb_code and sc_score between 50 and 70;

-- tbl_table 에서 where 조건에맞는 데이터를 모두 selection 하고
-- tbl_subject 테이블에서 on 조건에 맞는 데이터만 section 하여 같이 표시


select SC.sc_sbcode, SB.sb_name, SC.sc_score
from tbl_score SC
left join tbl_subject SB
on SC.sc_sbcode = SB.sb_code
where sc_score between 50 and 70;


-- 점수가 50~70 인 데이터를 selection
-- 과목코드, 과목명, 점수표현
-- tbl_student table 을 join 하고
-- 학번, 학생이름, 과목코드, 과목명, 점수를 projection
-- 학번 순으로 정렬

select SC.sc_stnum as 학번,
	ST.st_name as 이름,
    SC.sc_sbcode as 과목코드, 
    SB.sb_name as 과목명,
    SC.sc_score as 점수
from tbl_score SC
left join tbl_subject SB
on SC.sc_sbcode = SB.sb_code
left join tbl_student ST
on SC.sc_stnum = ST.st_num
where sc_score between 50 and 70;

-- tbl_score table 의 데이터를 참조하여
-- 과목별 전체 총점 구하기

select sc_sbcode, sum(sc_score)
from tbl_score
group by sc_sbcode;

-- tbl_score 테이블에서 과목별 총점 구하기
-- groupby sum, avg 등 통계함수를 사용하여 selection
select sc_sbcode as 과목코드, sum(sc_score) as 총점, avg(sc_score) as 평균
from tbl_score
group by sc_sbcode;


-- 과목명을 함께 projection
select SC.sc_sbcode as 과목코드, 
	SB.sb_name as 과목명, 
	sum(sc_score) as 총점, 
	avg(sc_score) as 평균
from tbl_score SC
	left join tbl_subject SB
		on SC.sc_sbcode = SB.sb_code
group by SC.sc_sbcode, SB.sb_name
order by SC.sc_sbcode;


-- 학생별로 총점과 평균 구하기
-- 학번, 이름, 총점, 평균 projection
-- 학번순으로 정렬

select
	SC.sc_stnum as 학번,
    ST.st_name as 이름,
	sum(sc_score) as 총점, 
	avg(sc_score) as 평균
from tbl_score SC
	left join tbl_student ST
		on SC.sc_stnum = ST.st_num
group by SC.sc_stnum
order by SC.sc_stnum;


select st_num, st_name, sc_sbcode, sc_score
from tbl_student ST
	left join tbl_score SC
		on ST.st_num = SC.sc_stnum;

-- tbl_score 테이블에서 각 학생들의 S002(데이터베이스) 과목 점수만
-- 학번 데이터베이스점수(SB0002) 출력

select st_num, st_name, sc_sbcode, sc_score
from tbl_student ST
	left join tbl_score SC
		on ST.st_num = SC.sc_stnum
where sc_sbcode = 'SB002';


-- 학번으로 그룹을 묶고 코드를 기준으로 일치하는 과목은 점수를 표시하고 나머지는 0 으로
-- if 문을 사용한 피벗테이블 생성
select sc_stnum, st_name,
sum(if(sc_sbcode = 'SB001', sc_score, 0)) as 국어,
sum(if(sc_sbcode = 'SB002', sc_score, 0)) as 데이터베이스,
sum(if(sc_sbcode = 'SB003', sc_score, 0)) as 미술,
sum(if(sc_sbcode = 'SB004', sc_score, 0)) as 소프트웨어공학,
sum(if(sc_sbcode = 'SB005', sc_score, 0)) as 수학,
sum(if(sc_sbcode = 'SB006', sc_score, 0)) as 영어영문,
sum(if(sc_sbcode = 'SB007', sc_score, 0)) as 음악
from tbl_score
	left join tbl_student
		on sc_stnum = st_num
group by sc_stnum, st_name;


-- case 명령문 사용한 피벗 테이블 생성

select sc_stnum, st_name,
sum(case when sc_sbcode = 'SB001' then sc_score else 0 end) as 국어,
sum(case when sc_sbcode = 'SB002' then sc_score else 0 end) as 데이터베이스,
sum(case when sc_sbcode = 'SB003' then sc_score else 0 end) as 미술,
sum(case when sc_sbcode = 'SB004' then sc_score else 0 end) as 소프트웨어공학,
sum(case when sc_sbcode = 'SB005' then sc_score else 0 end) as 수학,
sum(case when sc_sbcode = 'SB006' then sc_score else 0 end) as 영어영문,
sum(case when sc_sbcode = 'SB007' then sc_score else 0 end) as 음악
from tbl_score
	left join tbl_student
		on sc_stnum = st_num
group by sc_stnum, st_name;

/* 
제2정규화가 되어있는 데이터를 view 할때는 pivot 으로 데이터를 펼쳐 보는것이 편리할때가 많다
제2정규화가 된 데이터는 기준이 되는 키 값을 중심으로 Row 방향으로 데이터가 저정되어 있다
이 데이터를 쉽게 보고서 등으로 만들때는 pivot을 하여 column 방향으로 펼쳐 보는것이 편리하다
*/

