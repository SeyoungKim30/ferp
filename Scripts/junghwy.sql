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
		and clerkname LIKE '%'||''||'%'
		AND frreginum = '1234567891')
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
INSERT INTO storeclerk values('12345678901004','1234567890','김세영','940101','010-1100-0011','서울',12000,'여');
INSERT INTO storeclerk values('12345678901005','1234567890','김중휘','960101','010-1111-1111','구의',9100,'남');
INSERT INTO storeclerk values('12345678901006','1234567890','신아령','950202','010-2222-2222','한국',9200,'여');
INSERT INTO storeclerk values('12345678901007','1234567890','이지원','960303','010-3333-3333','한국',9300,'여');
INSERT INTO storeclerk values('12345678901008','1234567890','이희준','970404','010-4444-4444','한국',9400,'남');
INSERT INTO storeclerk values('12345678901009','1234567890','허다솜','970505','010-5555-5555','한국',9500,'여');
INSERT INTO storeclerk values('12345678901010','1234567890','김재윤','960606','010-1111-4444','한국',9600,'남');
INSERT INTO storeclerk values('12345678901011','1234567890','김다솜','960707','010-2312-1111','한국',9700,'여');
INSERT INTO storeclerk values('12345678901012','1234567890','이준형','970808','010-5252-1324','한국',9800,'남');
INSERT INTO storeclerk values('12345678901013','1234567890','김석준','960909','010-5211-1324','한국',9000,'남');
INSERT INTO storeclerk values('12345678901013','1234567890','김석준','960909','010-5211-1324','한국',9000,'남');
INSERT INTO storeclerk values((SELECT DISTINCT frreginum FROM STORECLERK WHERE FRREGINUM = '1234567890')||(SELECT count(*)+1001 FROM STORECLERK WHERE FRREGINUM = '1234567890'),'1234567890','김석준','960909','010-5211-1324','한국',9000,'남');
INSERT INTO storeclerk values((SELECT DISTINCT frreginum FROM STORECLERK WHERE FRREGINUM = '1234567892')||(SELECT count(*)+1001 FROM STORECLERK WHERE FRREGINUM = '1234567892'),'1234567892','백승호','910909','010-3151-9102','한국',10000,'남');
select *
	from (
	select rownum cnt, s.*
		from storeclerk s
		where 1=1
		and clerkname LIKE '%'||''||'%'
		AND frreginum = '1234567892')
where cnt between 1 and 5;
SELECT count(*)+1001
FROM STORECLERK
WHERE FRREGINUM = '1234567890'; 

SELECT * FROM STORECLERK s ;

DELETE FROM STORECLERK s WHERE CLERKNUM ='12345678901016';

SELECT DISTINCT frreginum
FROM STORECLERK 
WHERE FRREGINUM = '1234567890';

--사업자번호||count(*)+1001

-- SELECT fr FROM dual;

ALTER TABLE storeclerk ADD hourlyPay NUMBER;
ALTER TABLE storeclerk ADD gender varchar2(10);

UPDATE storeclerk
SET 
	--clerkName = '김준형',
	gender = '여'
	--residentNum = '970808',
	--phoneNum = '010-5252-1324',
	--address = '한국'
WHERE clerkNum = '12345678901003';
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

SELECT p.PRODUCTNUM, CATEGORY , PRODUCTNAME , OPPOSITE , PRICE , IMG , p.REMARK  , frreginum, stockdate, applyamount, remainamount
FROM PRODUCT p, STOCK s 
WHERE p.PRODUCTNUM = s.PRODUCTNUM 
AND PRODUCTNAME LIKE '%'||''||'%';

SELECT p.PRODUCTNUM, CATEGORY , PRODUCTNAME , OPPOSITE , PRICE , IMG , p.REMARK  , frreginum, stockdate, applyamount, remainamount 
FROM STOCK s , PRODUCT p 
WHERE STOCKDATE IN 
	(SELECT max(STOCKDATE) FROM stock GROUP BY PRODUCTNUM)
AND p.PRODUCTNUM = s.PRODUCTNUM 
AND PRODUCTNAME LIKE '%'||''||'%'
AND FRREGINUM = '9999999999';

-- 발주번호, 발주신청일, 자재코드, 공급받는사업자번호, 공급자사업자번호, 자재 수량, 결재 상태, 발주상태
-- (orderNum, orderDate, productNum, demander, supplier, amount, paymentState, orderState)
SELECT * FROM PRODORDER;

--INSERT INTO PRODORDER values(#{orderNum}, #{productNum}, #{demander}, #{supplier}, #{orderDate}, #{amount}, #{paymentState}, #{orderState});
INSERT INTO PRODORDER VALUES
(
	--to_char(sysdate,'yyyymm')||(SELECT DISTINCT demander FROM prodorder WHERE demander = '1234567890'),
	to_char(sysdate,'yymmdd')||(SELECT DISTINCT demander FROM prodorder WHERE demander = '1234567890'), 
	'PD10001',
	'1234567890', 
	'9999999999', 
	sysdate,
	6, 
	'정산전', 
	'요청'
);
DELETE FROM PRODORDER WHERE ORDERNUM = '2023031234567890';
DELETE FROM PRODORDER WHERE ORDERNUM = 'ㅁㄴㅇ';
DELETE FROM PRODORDER WHERE ORDERNUM = '1234567890';
SELECT to_char(sysdate,'yyyymm')||(SELECT DISTINCT demander FROM prodorder WHERE demander = '1234567890') FROM dual;
-- to_char(sysdate,'yyyymmdd')||(SELECT DISTINCT demander FROM prodorder WHERE demander = '1234567890') 발주번호
SELECT to_char(SYSDATE,'yyyymm') FROM dual;
SELECT to_char(to_date('2023-03-02','yyyy-mm-dd'),'yyyymm') FROM dual;
-- to_char(sysdate,'yyyymmdd') 신청날짜

/*
INSERT INTO PRODORDER VALUES
(
	to_char(#{orderDate},'yyyymmdd')||(SELECT DISTINCT demander FROM prodorder WHERE demander = #{demander}), 
	#{productNum},
	#{demander}, 
	#{supplier}, 
	to_char(#{orderDate},'yyyymmdd'), 
	#{amount}, 
	'정산전', 
	'요청'
)
*/

SELECT * FROM PRODORDER WHERE ORDERNUM LIKE '%'||''||'%' AND DEMANDER = '1234567890';

SELECT * FROM product;
SELECT * FROM PRODORDER ;

SELECT po.*, p.img, p.PRODUCTNAME
FROM PRODUCT p, PRODORDER po
WHERE p.PRODUCTNUM = po.PRODUCTNUM
AND ORDERNUM LIKE '%'||''||'%' 
AND DEMANDER = '1234567890'
ORDER BY to_char(orderdate, 'YYMMDD HH24:MI:SS') DESC;

UPDATE (SELECT po.*, p.img, p.PRODUCTNAME
		FROM PRODUCT p, PRODORDER po
		WHERE p.PRODUCTNUM = po.PRODUCTNUM)
	SET amount = 711
WHERE ordernum = '202303021234567890'
AND productnum = 'PD10001'
AND orderdate = to_date('2023-03-02 00:00:00','YYYY-MM-DD HH24:MI:SS');

UPDATE (SELECT po.*, p.img, p.PRODUCTNAME
		FROM PRODUCT p, PRODORDER po
		WHERE p.PRODUCTNUM = po.PRODUCTNUM)
	SET ordernum = '2303021234567890'
WHERE productnum = 'PD10001'
AND ordernum = '202303021234567890'
AND orderdate = to_date('2023-03-02 00:00:00','YYYY-MM-DD HH24:MI:SS');

SELECT to_date('2023-03-02 00:00:00','YYYY-MM-DD HH24:MI:SS') FROM dual;

SELECT * FROM PRODORDER WHERE ORDERNUM LIKE '%'||''||'%' AND DEMANDER = '1234567890';

DELETE FROM PRODORDER
WHERE ordernum = '2303051234567890'
AND productnum = 'PD10001'
AND orderdate = to_date('2023-03-05 22:27:11','YYYY-MM-DD HH24:MI:SS');

-- product(productName, category, img)
-- prodOrder(orderNum, orderDate)
-- defectOrder(method, state, applyDate)
SELECT * FROM defectorder;

SELECT * FROM STORE;