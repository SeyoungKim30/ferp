SELECT * FROM HOemp;
CREATE TABLE HOemp (
	eno	number	NOT NULL,
	pass	varchar2(20)	NULL,
	ename	varchar2(20)	NULL,
	dname	varchar2(30)	NULL
);
INSERT INTO HOemp values(0001,'1234','홍길동','관리');

SELECT  * FROM store;
CREATE TABLE store (
	FrRegiNum	varchar2(50)	NOT NULL,
	eno	number	NOT NULL,
	frName	varchar2(50)	NULL,
	frOpen	varchar2(20)	NULL,
	frOperTime	varchar2(20)	NULL,
	frClosedDte	varchar2(20)	NULL,
	frRepName	varchar2(20)	NULL,
	frTel	varchar2(20)	NULL,
	frAddress	varchar2(100)	NULL,
	frPass	varchar2(20)	NULL
);
INSERT INTO store values('fr01',1,'문벅스','9:00','8:00 ~ 23:00','','김세영','02-0221-0322','홍대입구역','1324');

SELECT * FROM storeclerk
WHERE clerkname LIKE '%'||''||'%';
SELECT COUNT(*)
		FROM storeclerk
		WHERE 1=1
		AND clerkname LIKE '%'||''||'%';
select *
	from (
	select rownum cnt, s.*
		from storeclerk s
		where 1=1
		and clerkname LIKE '%'||''||'%')
where cnt between 1 and 5;
	
CREATE TABLE storeClerk (
	clerkNum	varchar2(50)	NOT NULL,
	FrRegiNum	varchar2(50)	NOT NULL,
	clerkName	varchar2(50)	NULL,
	gender	varchar2(10)	NULL,
	residentNum	varchar2(20)	NULL,
	phoneNum	varchar2(20)	NULL,
	address	varchar2(300)	NULL
);
INSERT INTO storeclerk values('0','123456789','김세영','여','940101','010-1100-0011','서울',12000);
INSERT INTO storeclerk values('1','123456789','김중휘','남','960101','010-1111-1111','구의',9800);
INSERT INTO storeclerk values('2','123456789','신아령','여','950202','010-2222-2222','한국');
INSERT INTO storeclerk values('3','123456789','이지원','여','960303','010-3333-3333','한국');
INSERT INTO storeclerk values('4','123456789','이희준','남','970404','010-4444-4444','한국');
INSERT INTO storeclerk values('5','123456789','허다솜','여','970505','010-5555-5555','한국');
INSERT INTO storeclerk values('6','123456789','김재윤','남','960606','010-1111-4444','한국');
INSERT INTO storeclerk values('7','123456789','김다솜','여','960707','010-2312-1111','한국');
INSERT INTO storeclerk values('8','123456789','이준형','남','970808','010-5252-1324','한국');
INSERT INTO storeclerk values(clerkNum_seq.nextval,'fr01','김석준','남','960909','010-5211-1324','한국');

ALTER TABLE storeclerk ADD hourlyPay NUMBER;

UPDATE storeclerk
SET clerkName = '김준형',
	gender = '남',
	residentNum = '970808',
	phoneNum = '010-5252-1324',
	address = '한국'
WHERE clerkNum = '8';

SELECT * FROM storeclerk;

UPDATE storeclerk
SET hourlyPay = 9100;

DELETE FROM storeclerk WHERE clerknum = '29';

SELECT clerkNum FROM storeclerk;

CREATE SEQUENCE clerkNum_seq
	START WITH 9
	MAXVALUE 9999 ;

SELECT * FROM schedule;
CREATE TABLE schedule (
	onDay	date	NULL,
	offDay	date	NULL,
	clerkNum	varchar2(50)	NOT NULL,
	FrRegiNum	varchar2(50)	NOT NULL
);

SELECT * FROM empcheckininfo;
CREATE TABLE empCheckInInfo (
	FrRegiNum	varchar2(50)	NOT NULL,
	clerkNum	varchar2(50)	NOT NULL,
	onTime	date	NULL,
	offTime	date	NULL
);

SELECT * FROM store;

SELECT * FROM PRODUCT;
INSERT INTO product values('pd-frt-0001','과일','사과','본사',1200,'','1ea');
INSERT INTO product values('pd-frt-0002','과일','망고','본사',6000,'','1ea');
INSERT INTO product values('pd-dai-0001','유제품','우유','본사',2500,'','900ml');
INSERT INTO product values('pd-dai-0002','유제품','크림','본사',12000,'','1kg');
INSERT INTO product values('pd-cfb-0001','커피빈','아라비카','본사',7900,'','200g');
INSERT INTO product values('pd-f-0001','과일','사과','본사',1200,'','');
DELETE FROM PRODUCT p WHERE p.PRODUCTNUM ='pd-f-0001';

SELECT * FROM PRODORDER;
INSERT INTO PRODORDER values('fr01-1','pd-frt-0001','store1','본사',to_date('2023-01-11','YYYY-MM-DD'),30,'결제완료','요청');
INSERT INTO PRODORDER values('fr01-2','pd-frt-0001','store1','본사',to_date('2023-02-11','YYYY-MM-DD'),30,'결제완료','완료');
INSERT INTO PRODORDER values('fr01-3','pd-dai-0001','store1','본사',to_date('2023-02-21','YYYY-MM-DD'),10,'미결제','요청');
INSERT INTO PRODORDER values('fr01-4','pd-dai-0002','store1','본사',to_date('2023-02-01','YYYY-MM-DD'),2,'결제완료','완료');
INSERT INTO PRODORDER values('fr01-5','pd-cfb-0001','store1','본사',to_date('2023-02-21','YYYY-MM-DD'),5,'미결제','요청');

SELECT * FROM STOCK;
INSERT INTO STOCK values('pd-frt-0001','fr01',to_date('2023-02-02','YYYY-MM-DD'),50,100,'');
INSERT INTO STOCK values('pd-frt-0002','fr01',to_date('2023-01-30','YYYY-MM-DD'),10,50,'');
INSERT INTO STOCK values('pd-dai-0001','fr01',to_date('2023-02-11','YYYY-MM-DD'),10,100,'');
INSERT INTO STOCK values('pd-dai-0002','fr01',to_date('2023-01-22','YYYY-MM-DD'),5,40,'');
INSERT INTO STOCK values('pd-cfb-0001','fr01',to_date('2023-02-09','YYYY-MM-DD'),30,150,'');

-- 발주신청에 필요한 데이터 컬럼(가맹점번호, 신청날짜, 거래처, 자재명, 수량)
-- 발주신청에 필요한 데이터 테이블(자재, 발주 신청)
SELECT s.FRREGINUM ,po.ORDERDATE ,p.OPPOSITE ,p.PRODUCTNAME ,po.AMOUNT 
FROM PRODUCT p, PRODORDER po, STOCK s 
WHERE p.PRODUCTNUM = po.PRODUCTNUM 
AND p.PRODUCTNUM = s.PRODUCTNUM;

SELECT po.*, p.img, p.PRODUCTNAME, p.CATEGORY
FROM PRODUCT p, PRODORDER po
WHERE p.PRODUCTNUM = po.PRODUCTNUM
AND p.PRODUCTNAME LIKE '%'||''||'%' 
AND p.CATEGORY LIKE '%'||''||'%' 
AND to_char(to_date(ORDERDATE,'YYYY-MM-DD HH24:MI:SS'),'MONTH') LIKE '%'||''||'%' 
AND DEMANDER = '1234567890'
ORDER BY to_char(orderdate, 'YYMMDD HH24:MI:SS') DESC;

SELECT to_char(to_date('2023-03-01 11:11:11','YYYY-MM-DD HH24:MI:SS'),'MONTH') FROM dual;

SELECT * FROM ORDERS;

ALTER TABLE orders ADD orderOPTION varchar2(500);

ALTER TABLE orders MODIFY orderdate DATE;

DELETE FROM orders WHERE orderdate LIKE '%'||''||'%'; 

SELECT * FROM store;

SELECT to_char(s.STOCKDATE,'YYYY-MM-dd') ,p.PRODUCTNUM ,p.CATEGORY ,p.PRODUCTNAME ,p.OPPOSITE ,p.PRICE ,p2.AMOUNT ,p2.ORDERSTATE ,p.REMARK 
      FROM PRODUCT p , STOCK s , PRODORDER p2 
      WHERE p.PRODUCTNUM = s.PRODUCTNUM 
      AND p.PRODUCTNUM = p2.PRODUCTNUM 
      AND to_char(s.STOCKDATE,'YYYY-MM-dd') = '2023-02-11'
      AND p.productNum LIKE '%'||''||'%'
      AND category LIKE '%'||''||'%'
      AND productName LIKE '%'||''||'%'
      AND opposite LIKE '%'||''||'%'
      AND orderState LIKE '%'||''||'%';