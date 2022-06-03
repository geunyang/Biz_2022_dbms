-- bookuser
create table tbl_books(
isbn VARCHAR2(13) primary key,
title NVARCHAR2(50) NOT NULL,
author NVARCHAR2(50) NOT NULL,
publisher NVARCHAR2(50) NOT NULL,
price NUMBER,
discount NUMBER,
description NVARCHAR2(2000),
pubdate VARCHAR2(10),
link VARCHAR2(125),
image VARCHAR2(125)
);

select * FROM tbl_books;

commit;