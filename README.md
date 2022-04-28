# DBMS 쿼리 폴더

## 오라클 DB 시작

## ERD(Entity-Relaltion Diagram)
* 물리적인 데이터 저장소인 Table 을 생성하기 앞서 어떤 데이터를 저장할 것인가 설계하는 것
### Entity 
* Table을 논리적으로 부르는 이름
### Relation
* Table 과 Table 이 서로 연동되어 만들어지는 관계
* Entity 를 그냥 Relation 이라고 하기도 한다.

### E-RD 작성하기
* https://erdcloud.com 을 이용하자


## 오라클의 데이터 타입
### 문자열 데이터 타입
* CHAR(길이) : 고정 길이 문자열
* VARCHAR2(길이) : 가변 길이 문자열
* nVARCHAR2(길이) 한글 가변 길이 문자열

### 숫자형 데이터 타입
* NUMBER(길이) : 숫자형 데이터 타입
* 길이를 지정하지 않으면 최대 64자리까지 저장 가능

* 길이지정 도메인설정
* drop 객체 완전히 없어짐 delete 되돌리기 가능?
* 서버db 이중화? 로드밸런싱(부화 나누기) -> 고비용. 클라우드로 대체
* 프로젝션/셀렉션 차이?