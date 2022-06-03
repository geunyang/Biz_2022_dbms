create user bookuser IDENTIFIED by 12341234;
drop user bookuser CASCADE;
grant DBA to bookuser;

CREATE TABLESPACE naverDB
DATAFILE 'C:/oraclexe/data/naverDB.dbf'
size 1M REUSE
AUTOEXTEND ON NEXT 1K;