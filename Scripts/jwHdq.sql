--매장매출은 주문 
--매장매입은 발주

--본사:저번달 전체매장의 총 매출조회 
SELECT nvl(sum(payprice),0) allfrsales
FROM orders
WHERE state='완료'
AND to_char(orderdate, 'YYYY/MM')=to_char(add_months(SYSDATE, -1),'YYYY/MM');
--AND SUBSTR(orderdate, 1, 5)=to_char(add_months(SYSDATE, -1),'YY/MM');

/*
--본사:전체매장의 개별매출조회(사용자지정 기간-月기준)
SELECT frname, s.frreginum, frtel, frrepname, ename, nvl(frsales, 0) frsales
FROM store s, emp e, (  SELECT frreginum, sum(payprice) frsales
						FROM orders
						WHERE state='완료'
						AND to_char(orderdate,'YYYY/MM') BETWEEN '2023/01' AND '2023/02'
						GROUP BY frreginum ) ord
WHERE ord.frreginum(+)=s.frreginum AND s.empnum=e.empnum
AND frname LIKE '%'||''||'%'
AND frrepname LIKE '%'||''||'%'
AND ename LIKE '%'||''||'%'
ORDER BY frname;

SELECT frname, s.frreginum, frtel, frRepname, ename, nvl(frsalesum, 0) frsales
FROM store s, emp e, (  SELECT frreginum, sum(payprice) frsalesum
						FROM orders
						WHERE state='완료'
						AND TRUNC(orderdate,'month') BETWEEN to_date('2023-01', 'YYYY-MM') AND to_date('2023/01', 'YYYY-MM')
						GROUP BY frreginum ) ord
WHERE ord.frreginum(+)=s.frreginum AND s.empnum=e.empnum
AND frname LIKE '%'||''||'%'
AND frRepname LIKE '%'||''||'%'
AND ename LIKE '%'||''||'%'
ORDER BY frname;

--본사:전체매장의 개별매입조회
SELECT DEMANDER, sum(mcnt*price) mtotal
FROM PRODUCT prd, ( SELECT DEMANDER, PRODUCTNUM,  sum(amount) mcnt
					FROM PRODORDER d
					WHERE PAYMENTSTATE='완료'
					AND TRUNC(orderdate,'month') BETWEEN to_date('2023-01', 'YYYY-MM') AND to_date('2023/01', 'YYYY-MM')
					GROUP BY PRODUCTNUM, DEMANDER) prdord 
WHERE prd.PRODUCTNUM=prdord.PRODUCTNUM
GROUP BY DEMANDER;
*/
SELECT * FROM store WHERE FRREGINUM!='9999999999';


----본사:전체매장의 개별매매액조회(매출,매입 모두 출력)
SELECT frname, s.frreginum, frtel, frRepname, ename, nvl(frsalesum, 0) frsales, nvl(mtotal, 0) frpurchase
FROM store s, emp e, 
	( SELECT frreginum, sum(payprice) frsalesum
	  FROM orders
	  WHERE state='완료'
	  AND TRUNC(orderdate,'month') BETWEEN to_date('2023-01', 'YYYY-MM') AND to_date('2023/01', 'YYYY-MM')
	  GROUP BY frreginum ) ord,
	( SELECT DEMANDER, sum(mcnt*price) mtotal
	  FROM PRODUCT prd, (SELECT DEMANDER, PRODUCTNUM,  sum(amount) mcnt
						FROM PRODORDER d
					  	WHERE PAYMENTSTATE='완료'
						AND TRUNC(orderdate,'month') BETWEEN to_date('2023-01', 'YYYY-MM') AND to_date('2023/01', 'YYYY-MM')
						GROUP BY PRODUCTNUM, DEMANDER) prdord 
	  WHERE prd.PRODUCTNUM=prdord.PRODUCTNUM
	  GROUP BY DEMANDER) fprdord   
WHERE ord.frreginum(+)=s.frreginum AND s.empnum=e.empnum AND s.frreginum=fprdord.DEMANDER(+)
AND frname LIKE '%'||''||'%'
AND frRepname LIKE '%'||''||'%'
AND ename LIKE '%'||''||'%'
ORDER BY frname;



--본사:특정매장의 매입액조회
SELECT sum(price*mcnt) AS mtotal
FROM product prd, (SELECT PRODUCTNUM, sum(amount) mcnt
					FROM PRODORDER
					WHERE DEMANDER='1234567891'
					AND PAYMENTSTATE='완료'
					AND TRUNC(orderdate,'month') BETWEEN to_date('2023-01', 'YYYY-MM') AND to_date('2023/01', 'YYYY-MM')
					GROUP BY PRODUCTNUM ) ord
WHERE prd.PRODUCTNUM = ord.PRODUCTNUM;

SELECT PRODUCTNUM, sum(amount) 
FROM PRODORDER
WHERE DEMANDER='1234567891' --querystring으로 받아서
AND PAYMENTSTATE='완료'
AND TRUNC(orderdate,'month') BETWEEN to_date('2023-01', 'YYYY-MM') AND to_date('2023/01', 'YYYY-MM') --querystring으로 받아서
GROUP BY PRODUCTNUM ;



SELECT * FROM store;
SELECT * FROM product;
SELECT * FROM PRODORDER;

--INSERT INTO PRODORDER values((SELECT TO_CHAR(SYSDATE,'YYYYMM')||'1234567892' FROM dual),'PD10002','1234567892','9999999999',to_date('2023-02-25','YYYY-MM-DD'),1,'정산전','완료');
/*
INSERT INTO PRODORDER values('2301121234567892','PD10001','1234567892','9999999999',to_date('2023-01-12','YYYY-MM-DD'),1,'완료','완료');
INSERT INTO PRODORDER values('2301121234567892','PD10002','1234567892','9999999999',to_date('2023-01-12','YYYY-MM-DD'),2,'완료','완료');
INSERT INTO PRODORDER values('2301131234567892','PD10001','1234567892','9999999999',to_date('2023-01-13','YYYY-MM-DD'),2,'완료','완료');
INSERT INTO PRODORDER values('2301131234567892','PD10002','1234567892','9999999999',to_date('2023-01-13','YYYY-MM-DD'),1,'완료','완료');

INSERT INTO PRODORDER values('2301121234567891','PD10001','1234567891','9999999999',to_date('2023-01-12','YYYY-MM-DD'),1,'완료','완료');
INSERT INTO PRODORDER values('2301121234567891','PD10002','1234567891','9999999999',to_date('2023-01-12','YYYY-MM-DD'),2,'완료','완료');
INSERT INTO PRODORDER values('2301131234567891','PD10001','1234567891','9999999999',to_date('2023-01-13','YYYY-MM-DD'),2,'완료','완료');
INSERT INTO PRODORDER values('2301131234567891','PD10002','1234567891','9999999999',to_date('2023-01-13','YYYY-MM-DD'),1,'완료','완료');
INSERT INTO PRODORDER values('2301201234567891','PD10001','1234567891','9999999999',to_date('2023-01-20','YYYY-MM-DD'),4,'완료','완료');
INSERT INTO PRODORDER values('2301201234567891','PD10002','1234567891','9999999999',to_date('2023-01-20','YYYY-MM-DD'),2,'완료','완료');
*/


SELECT * FROM PRODORDER;


SELECT * FROM store;
SELECT * FROM emp;


SELECT * FROM orders; 
SELECT * FROM PRODORDER;
--where SUBSTR(orderdate, 1, 5) BETWEEN '23/01' AND '23/02'; <<절대 BETWEEN '2023/01'형태XXXXX
--AND orderdate BETWEEN to_Date('화면에서 받아오는 시작날짜','YYYY/MM') AND to_Date('화면에서 받아오는 끝날짜','YYYY/MM')


--본사:특정매장의 매출조회(사용자지정기간-月기준)


 
SELECT * FROM store; -- frreginum 1234567891   1234567892
-- to_date('08:00','HH24:MI')
--INSERT INTO store VALUES('123456791', '22051002','투썸 광화문점', to_date('2017-01-15','YYYY-MM-DD'), '07:00-23:00','월', '김사희', '02-724-2368', '서울 종로구 새문안로85', 'gwanghwa' );
--INSERT INTO store VALUES('123456792', '22051002','투썸 홍대입구역점', to_date('2010-03-05','YYYY-MM-DD'), '07:00-00:00','화', '이종혁', '02-3142-7955', '서울 마포구 월드컵북록2길57', 'hongdae');
SELECT * FROM emp; --epnum 22051002
--INSERT INTO emp VALUES ('22051002', 'a1234', '이성미', '관리부');
SELECT * FROM menu;
SELECT * FROM orders;
--ordernum orderdate menunum frreginum state amount payprice orderoption 
/*
--2023년1월 1234567891
INSERT INTO orders VALUES ('23010412345678911001', to_Date('2023/01/04','YY/MM/DD'),'1021','1234567891','완료',1,4600, '');
INSERT INTO orders VALUES ('23010412345678911002', to_Date('2023/01/04','YY/MM/DD'),'1021','1234567891','완료',2,9200, '');
INSERT INTO orders VALUES ('23010412345678911003', to_Date('2023/01/04','YY/MM/DD'),'1022','1234567891','완료',1,5900, '');
INSERT INTO orders VALUES ('23010412345678911004', to_Date('2023/01/04','YY/MM/DD'),'1022','1234567891','완료',2,11800, '');
INSERT INTO orders VALUES ('23010512345678911001', to_Date('2023/01/05','YY/MM/DD'),'1022','1234567891','취소',2,11800, '');
INSERT INTO orders VALUES ('23010512345678911002', to_Date('2023/01/05','YY/MM/DD'),'1022','1234567891','완료',2,11800, '');
INSERT INTO orders VALUES ('23011212345678911001', to_Date('2023/01/12','YY/MM/DD'),'1021','1234567891','완료',2,9200, '');
INSERT INTO orders VALUES ('23011212345678911002', to_Date('2023/01/12','YY/MM/DD'),'1022','1234567891','완료',2,11800, '');

INSERT INTO orders VALUES ('23020412345678911001', to_Date('2022/02/04','YY/MM/DD'),'1021','1234567891','완료',1,4600, '');
INSERT INTO orders VALUES ('23020412345678911002', to_Date('2023/02/04','YY/MM/DD'),'1021','1234567891','완료',2,9200, '');
INSERT INTO orders VALUES ('23020412345678911003', to_Date('2023/02/04','YY/MM/DD'),'1022','1234567891','완료',1,5900, '');
INSERT INTO orders VALUES ('23020412345678911004', to_Date('2023/02/04','YY/MM/DD'),'1022','1234567891','완료',2,11800, '');

--2023년1월 1234567892
INSERT INTO orders VALUES ('23010412345678921001', to_Date('2023/01/04','YY/MM/DD'),'1021','1234567892','완료',1,4600, '');
INSERT INTO orders VALUES ('23010412345678921002', to_Date('2023/01/04','YY/MM/DD'),'1021','1234567892','완료',2,9200, '');
INSERT INTO orders VALUES ('23010412345678921003', to_Date('2023/01/04','YY/MM/DD'),'1022','1234567892','취소',1,5900, '');
INSERT INTO orders VALUES ('23010412345678921004', to_Date('2023/01/04','YY/MM/DD'),'1022','1234567892','완료',2,11800, '');
INSERT INTO orders VALUES ('23010512345678921001', to_Date('2023/01/05','YY/MM/DD'),'1022','1234567892','취소',2,11800, '');
INSERT INTO orders VALUES ('23010512345678921002', to_Date('2023/01/05','YY/MM/DD'),'1022','1234567892','완료',2,11800, '');
INSERT INTO orders VALUES ('23011212345678921001', to_Date('2023/01/12','YY/MM/DD'),'1021','1234567892','완료',2,9200, '');
INSERT INTO orders VALUES ('23011212345678921002', to_Date('2023/01/12','YY/MM/DD'),'1022','1234567892','완료',2,11800, '');
INSERT INTO orders VALUES ('23011212345678921003', to_Date('2023/01/12','YY/MM/DD'),'1022','1234567892','완료',2,11800, '');

INSERT INTO orders VALUES ('23020412345678921001', to_Date('2023/02/04','YY/MM/DD'),'1021','1234567891','완료',1,4600, '');
INSERT INTO orders VALUES ('23020412345678921002', to_Date('2023/02/04','YY/MM/DD'),'1021','1234567891','완료',2,9200, '');
INSERT INTO orders VALUES ('23020412345678921003', to_Date('2023/02/04','YY/MM/DD'),'1022','1234567891','취소',1,5900, '');
INSERT INTO orders VALUES ('23020412345678921004', to_Date('2023/02/04','YY/MM/DD'),'1022','1234567891','완료',2,11800, '');
*/

SELECT * FROM STORECLERK s ;
SELECT * FROM emp;
SELECT * FROM store;

--본사:전매장오픈시간조회
SELECT frreginum, frname, SUBSTR(fropertime,1, 5) fropertime, frtel, frrepname, ename
FROM store s, emp e
WHERE s.empnum=e.EMPNUM
AND frreginum!='9999999999';

--본사:특정매장오픈시간상세조회
SELECT frname, fropertime, frrepname, ename, SUBSTR(fropertime,1, 5) opentime
FROM store s, emp e
WHERE s.empnum=e.EMPNUM
AND frreginum='1234567891';
--본사:특정매장오픈시간캘린더
SELECT to_char(onTime, 'YYYY/MM/DD') wday, MIN(onTime) firstworkt
FROM EMPCHECKIN 
WHERE FRREGINUM='1234567890' 
GROUP BY to_char(onTime, 'YYYY/MM/DD');



SELECT *  --FRCLOSEDDTE 휴무일 
FROM store ;
--GROUP BY TRUNC(onTime, DATE);

SELECT frname, fropertime, frrepname, ename
		FROM store s, emp e
		WHERE s.empnum=e.EMPNUM;



