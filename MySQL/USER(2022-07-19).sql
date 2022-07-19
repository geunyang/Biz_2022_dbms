USE mydb;
SHOW tables;

create table tbl_address(
a_seq bigint auto_increment primary key,
a_name varchar(20) not null,
a_tel varchar(30),
a_address varchar(125)
);

-- data create : 테이블에 데이터를 추가하기
insert into tbl_address(
a_name, a_tel, a_addretbl_addresstbl_addressss)
values('홍길동','010-0009-0001','서울');

-- data 가져오기, 선택하기, fetch 하기
select * from tbl_address;

use mydb;

/*
drop table :  table 삭제하기
delete from [table]: 데이터만 전체 삭제
truncate table [table] : drop 후에 다시 create
*/ 
truncate table tbl_address;
select * from tbl_address;
select count(*) from tbl_address;
-- select * from tbl_address
-- where a_name = '학생이름';

delete from tbl_address
where a_seq = 50;

delete from tbl_address
where a_seq = 189;

-- a_name 칼럼의 데이터가 야유신 인 데이터만 추출 
select * from tbl_address
where a_name = '야유신';

-- 중간문자열 검색
-- a_name 칼럼에 '유' 가 포함된 모든 데이터
select * from tbl_address
where a_name like '%유%';

-- a_name 칼럼의 '유' 로 시작하는 데이터
select * from tbl_address
where a_name like '유%';

--  a_name 칼럼의 '유' 로 끝나는 데이터
select * from tbl_address
where a_name like '%유';

-- like 연산자는 index 적용 불가 full text 검사
-- 전체 데이터를 처음부터 순서대로 비교하여 검색
-- where 절에서 사용하는 연산자 중에 가장 성능 낮음

-- mybatis 의 mapper 에서 사용하는 코드
-- select * from tbl_address
-- where a_name like concat('%',#{a_name},'%')

-- mybatis 의 mapper 에서 사용하는 oracle 코드
-- select * from tbl_address
-- where a_name like '%' || #{a_name} || '%';

-- 데이터의 출력 개수를 제한하는 키워드
select * from tbl_address
limit 10;

-- offset 앞에서부터 건너뛰고 출력하기
select * from tbl_address
limit 10 offset 10;

/*
limit 와 offset 은 select 명령문에서 가장 먼저 실행이 된다
그 이유로 다음 코드는 전체 데이터 중에서 앞에서 10개의 데이터를 추출하고
추출된 데이터 중에서 where 절을 실행하여
조건에 맞는 데이터를 찾는다
*/
select * from tbl_address
where a_name = '%유%'
limit 10;

/*
검색 기능과 pagination 기능을 동시 구현하기 위해서 sub query 를 사용한다
내부의 select 에서 조건에 맞는 데이터를 추출하고
바깥쪽의 select 에서 limit offset 을 설정한다
*/

select * from 
(
select * from tbl_address
where a_name like '%유%'
) as sub
limit 10 offset 10;