use hellodb;

select * from tbl_book;
select * from tbl_publisher;
select * from TBL_author;

select BK.isbn, BK.name, PUB.pub_name, PUB.pub_ceo, AUT.au_author,
		AUT.au_tel, BK.date, BK.price, BK.page
  from tbl_book BK
	left join tbl_publisher PUB
		on BK.publisher = PUB.pub_code
	left join tbl_author as AUT
		on BK.author = AUT.au_code;

CREATE TABLE TBL_PUBLISHER
(	pub_code VARCHAR(40) PRIMARY KEY,
	pub_name VARCHAR(40) NOT NULL,
	pub_rep VARCHAR(40) NOT NULL,
	pub_tel VARCHAR(40) NOT NULL,
	pub_addr VARCHAR(40) NOT NULL);


INSERT INTO `hellodb`.`tbl_book`
(`ISBN`,
`name`,
`publisher`,
`author`,
`date`,
`date_char`,
`page`,
`price`)
VALUES
('111111',
 111111,
 111111,
111111,
111111,
 111111,
111111 ,
 111111);

    
INSERT INTO `hellodb`.`tbl_publisher`
(`pub_code`,
`pub_name`,
`pub_rep`,
`pub_tel`,
`pub_addr`)
VALUES
(
'111111',
'pub001',
'pub001',
'pub001',
'pub001'
);

INSERT INTO `hellodb`.`tbl_publisher`
(`pub_code`,
`pub_name`,
`pub_rep`,
`pub_tel`,
`pub_addr`)
VALUES
(
'222222',
'pub002',
'pub002',
'pub002',
'pub002'
);
INSERT INTO `hellodb`.`tbl_publisher`
(`pub_code`,
`pub_name`,
`pub_rep`,
`pub_tel`,
`pub_addr`)
VALUES
(
'333333',
'pub003',
'pub003',
'pub003',
'pub003'
);
INSERT INTO `hellodb`.`tbl_publisher`
(`pub_code`,
`pub_name`,
`pub_rep`,
`pub_tel`,
`pub_addr`)
VALUES
(
'444444',
'pub004',
'pub004',
'pub004',
'pub004'
);
INSERT INTO `hellodb`.`tbl_publisher`
(`pub_code`,
`pub_name`,
`pub_rep`,
`pub_tel`,
`pub_addr`)
VALUES
(
'555555',
'pub005',
'pub005',
'pub005',
'pub005'
);
INSERT INTO `hellodb`.`tbl_publisher`
(`pub_code`,
`pub_name`,
`pub_rep`,
`pub_tel`,
`pub_addr`)
VALUES
(
'666666',
'pub006',
'pub006',
'pub006',
'pub006'
);
INSERT INTO `hellodb`.`tbl_publisher`
(`pub_code`,
`pub_name`,
`pub_rep`,
`pub_tel`,
`pub_addr`)
VALUES
(
'777777',
'pub007',
'pub007',
'pub007',
'pub007'
);
INSERT INTO `hellodb`.`tbl_publisher`
(`pub_code`,
`pub_name`,
`pub_rep`,
`pub_tel`,
`pub_addr`)
VALUES
(
'888888',
'pub008',
'pub008',
'pub008',
'pub008'
);
INSERT INTO `hellodb`.`tbl_publisher`
(`pub_code`,
`pub_name`,
`pub_rep`,
`pub_tel`,
`pub_addr`)
VALUES
(
'999999',
'pub009',
'pub009',
'pub009',
'pub009'
);
INSERT INTO `hellodb`.`tbl_publisher`
(`pub_code`,
`pub_name`,
`pub_rep`,
`pub_tel`,
`pub_addr`)
VALUES
(
'101010',
'pub010',
'pub010',
'pub010',
'pub010'
);



INSERT INTO `hellodb`.`tbl_author`
(`AU_CODE`,
`AU_AUTHOR`,
`AU_TEL`,
`AU_ADDR`)
VALUES
(
'111111',
'작가 이름',
'010-1111-1111',
'AUTHOR ADDRESS'
);

INSERT INTO `hellodb`.`tbl_author`
(`AU_CODE`,
`AU_AUTHOR`,
`AU_TEL`,
`AU_ADDR`)
VALUES
(
'222222',
'작가 이름',
'010-1111-1111',
'AUTHOR ADDRESS'
);

INSERT INTO `hellodb`.`tbl_author`
(`AU_CODE`,
`AU_AUTHOR`,
`AU_TEL`,
`AU_ADDR`)
VALUES
(
'333333',
'작가 이름',
'010-1111-1111',
'AUTHOR ADDRESS'
);

INSERT INTO `hellodb`.`tbl_author`
(`AU_CODE`,
`AU_AUTHOR`,
`AU_TEL`,
`AU_ADDR`)
VALUES
(
'444444',
'작가 이름',
'010-1111-1111',
'AUTHOR ADDRESS'
);

INSERT INTO `hellodb`.`tbl_author`
(`AU_CODE`,
`AU_AUTHOR`,
`AU_TEL`,
`AU_ADDR`)
VALUES
(
'555555',
'작가 이름',
'010-1111-1111',
'AUTHOR ADDRESS'
);

INSERT INTO `hellodb`.`tbl_author`
(`AU_CODE`,
`AU_AUTHOR`,
`AU_TEL`,
`AU_ADDR`)
VALUES
(
'666666',
'작가 이름',
'010-1111-1111',
'AUTHOR ADDRESS'
);

INSERT INTO `hellodb`.`tbl_author`
(`AU_CODE`,
`AU_AUTHOR`,
`AU_TEL`,
`AU_ADDR`)
VALUES
(
'777777',
'작가 이름',
'010-1111-1111',
'AUTHOR ADDRESS'
);

INSERT INTO `hellodb`.`tbl_author`
(`AU_CODE`,
`AU_AUTHOR`,
`AU_TEL`,
`AU_ADDR`)
VALUES
(
'888888',
'작가 이름',
'010-1111-1111',
'AUTHOR ADDRESS'
);

INSERT INTO `hellodb`.`tbl_author`
(`AU_CODE`,
`AU_AUTHOR`,
`AU_TEL`,
`AU_ADDR`)
VALUES
(
'999999',
'작가 이름',
'010-1111-1111',
'AUTHOR ADDRESS'
);

INSERT INTO `hellodb`.`tbl_author`
(`AU_CODE`,
`AU_AUTHOR`,
`AU_TEL`,
`AU_ADDR`)
VALUES
(
'101010',
'작가 이름',
'010-1111-1111',
'AUTHOR ADDRESS'
);