-- root

use schooldb;

/*
MySQL 의 BOOLEAN type
실제 테이블상에는 boolean type 이 없고
tinyint type 으로 칼럼이 생성된다
이 값은 0, 1의 값을 가지며 java 에서 select 하면
1은 true 로 0은 false 로 자동 형변환된다
*/

create table tbl_users (
	username varchar(20) primary key,
	password varchar(20) not null,
	
	isEnabled boolean default false,
	isAccountNonExpired boolean default true,
	isAccountNonLocked boolean default true,
	isCredentialsNonExpired  boolean default true,
	
	
	email varchar(30),
	tel varchar(15),
	realname varchar(20),
	nickname varchar(20)
);

/*
sprint security 에서 사용하는 권한 테이블
한 user 에게 여러가지 복합적인 권한을 부여하기 위하여 사용하는 보조테이블
*/
create table tbl_authorities (
	seq bigint auto_increment primary key,
    username varchar(20),
    authority varchar(20)
);

desc tbl_users;

select * from tbl_authorities;
select * from tbl_users;
drop table tbl_users;
