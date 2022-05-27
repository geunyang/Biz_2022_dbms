-- user3 È­¸é
SELECT
    * FROM tbl_user;
    
UPDATE tbl_student
set st_tel = '010-0000-0001'
WHERE st_num = '20220001';
UPDATE tbl_student
set st_tel = '010-0000-0002'
WHERE st_num = '20220002';
UPDATE tbl_student
set st_tel = '010-0000-0003'
WHERE st_num = '20220003';

commit;