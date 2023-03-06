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
SELECT * FROM store;


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


--본사:특정매장 정보 조회
--1
SELECT frname, s.frreginum, TO_char(FROPEN,'YYYY.MM.DD') AS fropen, 
fraddress, frtel, frrepname, ename
FROM store s, emp e
WHERE s.empnum=e.empnum
AND frreginum='1234567891';
--2 매출
SELECT to_char(orderdate,'YYYY.MM') orderdate, sum(payprice) frsales
FROM ORDERS o
where state='완료'
AND frreginum='1234567891'
GROUP BY to_char(orderdate,'YYYY.MM') ;
--2 매입
SELECT orderdate, sum(mcnt*price)
FROM PRODUCT p ,(SELECT PRODUCTNUM, to_char(orderdate, 'YYYY.MM') orderdate, nvl(sum(amount),0) mcnt
				FROM PRODORDER
				WHERE DEMANDER='1234567891'
				AND PAYMENTSTATE='완료'
				GROUP BY PRODUCTNUM, orderdate )po
WHERE p.PRODUCTNUM=po.productnum
GROUP BY orderdate;
--2 완.
SELECT o.orderdate, nvl(frsales,0) frsales, nvl(frpurchase,0) frpurchase,  nvl(frsales-frpurchase,0) profit
FROM (  SELECT orderdate, nvl(sum(mcnt*price),0) frpurchase
		FROM PRODUCT p ,(SELECT to_char(orderdate, 'YYYY.MM') orderdate, PRODUCTNUM, nvl(sum(amount),0) mcnt
						FROM PRODORDER
						WHERE DEMANDER='1234567891'
						AND PAYMENTSTATE='완료'
						GROUP BY PRODUCTNUM, to_char(orderdate, 'YYYY.MM'))po
		WHERE p.PRODUCTNUM=po.productnum
		GROUP BY orderdate ) po,
	(	SELECT to_char(orderdate,'YYYY.MM') orderdate, nvl(sum(payprice),0) frsales
		FROM ORDERS o
		where state='완료'
		AND frreginum='1234567891'
		GROUP BY to_char(orderdate,'YYYY.MM'))o
WHERE po.orderdate(+)=o.orderdate
AND to_date(o.orderdate,'YYYY-MM') BETWEEN to_date('2023-02', 'YYYY-MM') AND to_date('2023/02', 'YYYY-MM')
ORDER BY o.orderdate desc;
--3.메뉴
SELECT MENUNAME, nvl(mcnt,0) mcnt,  nvl(price*mcnt,0) msales 
FROM menu m,(SELECT menunum, sum(amount) mcnt
			FROM orders
			WHERE FRREGINUM='1234567891'
			AND state='완료'
			AND TRUNC(orderdate,'month') BETWEEN to_date('2023-01', 'YYYY-MM') AND to_date('2023/02', 'YYYY-MM')
			group BY menunum) o
WHERE m.MENUNUM=o.MENUNUM(+)
ORDER BY mcnt desc, msales desc;

SELECT * FROM orders;

--
SELECT to_char(orderdate, 'YYYY/MM'), PRODUCTNUM, nvl(sum(amount),0) mcnt
FROM PRODORDER
WHERE DEMANDER='1234567891'
AND PAYMENTSTATE='완료'
GROUP BY PRODUCTNUM, to_char(orderdate, 'YYYY/MM');
--
SELECT od, p.PRODUCTNUM, mcnt*price
FROM PRODUCT p ,(SELECT to_char(orderdate, 'YYYY/MM') od, PRODUCTNUM, nvl(sum(amount),0) mcnt
				FROM PRODORDER
				WHERE DEMANDER='1234567891'
				AND PAYMENTSTATE='완료'
				GROUP BY PRODUCTNUM, to_char(orderdate, 'YYYY/MM'))po
WHERE p.PRODUCTNUM=po.productnum;
--특정매장의 매달 매입액완성
SELECT orderdate, sum(mcnt*price)
FROM PRODUCT p ,(SELECT to_char(orderdate, 'YYYY/MM') orderdate, PRODUCTNUM, nvl(sum(amount),0) mcnt
				FROM PRODORDER
				WHERE DEMANDER='1234567891'
				AND PAYMENTSTATE='완료'
				GROUP BY PRODUCTNUM, to_char(orderdate, 'YYYY/MM'))po
WHERE p.PRODUCTNUM=po.productnum
GROUP BY orderdate;
--정해진 기간동안 어떤메뉴가 얼만큼 많이 팔렸는지.완
SELECT MENUNAME, nvl(mcnt,0) mcnt,  nvl(price*mcnt,0) msales 
FROM menu m, (SELECT menunum, sum(amount) mcnt
			FROM orders
			WHERE FRREGINUM='1234567891'
			AND state='완료'
			AND TRUNC(orderdate,'month') BETWEEN to_date('2023-01', 'YYYY-MM') AND to_date('2023/02', 'YYYY-MM')
			group BY menunum) o,
			(SELECT menunum
			FROM ONSALE
			WHERE FRREGINUM='1234567891') os
WHERE m.menunum=o.menunum(+) AND os.menunum=m.menunum
ORDER BY mcnt desc, msales desc;	

	

SELECT * FROM ONSALE ; --1035
SELECT * FROM MENU m  ;

/*
INSERT INTO ONSALE VALUES ('1021', '1234567891');
INSERT INTO ONSALE VALUES ('1022', '1234567891');
INSERT INTO ONSALE VALUES ('1023', '1234567891');
INSERT INTO ONSALE VALUES ('1024', '1234567891');
INSERT INTO ONSALE VALUES ('1025', '1234567891');
INSERT INTO ONSALE VALUES ('1029', '1234567891');
INSERT INTO ONSALE VALUES ('1030', '1234567891');
INSERT INTO ONSALE VALUES ('1031', '1234567891');
INSERT INTO ONSALE VALUES ('1033', '1234567891');
INSERT INTO ONSALE VALUES ('1034', '1234567891');
*/



--1234567891 frreginum   // gwanghwa
--22051002 empnum   // a1234





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

INSERT INTO PRODORDER values('2302071234567891','PD10001','1234567891','9999999999',to_date('2023-02-07','YYYY-MM-DD'),5,'완료','완료');
INSERT INTO PRODORDER values('2302121234567891','PD10002','1234567891','9999999999',to_date('2023-02-12','YYYY-MM-DD'),7,'완료','완료');
INSERT INTO PRODORDER values('2302131234567891','PD10001','1234567891','9999999999',to_date('2023-02-13','YYYY-MM-DD'),2,'완료','완료');
INSERT INTO PRODORDER values('2302131234567891','PD10002','1234567891','9999999999',to_date('2023-02-13','YYYY-MM-DD'),1,'완료','완료');
INSERT INTO PRODORDER values('2302201234567891','PD10001','1234567891','9999999999',to_date('2023-02-20','YYYY-MM-DD'),4,'완료','완료');
INSERT INTO PRODORDER values('2302201234567891','PD10002','1234567891','9999999999',to_date('2023-02-20','YYYY-MM-DD'),2,'완료','완료');
*/


SELECT * FROM orders; 
SELECT * FROM PRODORDER;
--where SUBSTR(orderdate, 1, 5) BETWEEN '23/01' AND '23/02'; <<절대 BETWEEN '2023/01'형태XXXXX
--AND orderdate BETWEEN to_Date('화면에서 받아오는 시작날짜','YYYY/MM') AND to_Date('화면에서 받아오는 끝날짜','YYYY/MM')

 
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






--매장번호, 조회날짜

--본사:오픈시간매장전체조회
SELECT frname, s.frreginum, substr(fropertime,1,5) fropertime, frtel, frrepname, ename
FROM store s, emp e
WHERE s.empnum=e.empnum
AND FRREGINUM !='9999999999'
ORDER BY frname;


SELECT * FROM EMPCHECKIN;--직원출퇴근시간
SELECT * FROM STORECLERK ;--12345678901006
SELECT * FROM emp;
SELECT * FROM store;
SELECT * FROM product;
SELECT * FROM ORDERS;
SELECT * FROM PRODORDER;

-- frreginum   1234567891
SELECT * FROM storeclerk;

/*

UPDATE storeclerk
SET CLERKNUM ='12345678911001'
WHERE CLERKNAME ='이수민';

INSERT INTO storeclerk values((SELECT DISTINCT frreginum FROM STORECLERK WHERE FRREGINUM = '1234567891')||(SELECT count(*)+1001 FROM STORECLERK WHERE FRREGINUM = '1234567891'),'1234567891','이수민','971031','010-2344-1004','인천광역시',12000,'여');
INSERT INTO storeclerk values((SELECT DISTINCT frreginum FROM STORECLERK WHERE FRREGINUM = '1234567891')||(SELECT count(*)+1001 FROM STORECLERK WHERE FRREGINUM = '1234567891'),'1234567891','유민우','990527','010-7308-4524','인천광역시',9000,'남');
INSERT INTO storeclerk values((SELECT DISTINCT frreginum FROM STORECLERK WHERE FRREGINUM = '1234567891')||(SELECT count(*)+1001 FROM STORECLERK WHERE FRREGINUM = '1234567891'),'1234567891','한정우','990126','010-3689-6578','경기도 일산시',8500,'남');
INSERT INTO storeclerk values((SELECT DISTINCT frreginum FROM STORECLERK WHERE FRREGINUM = '1234567891')||(SELECT count(*)+1001 FROM STORECLERK WHERE FRREGINUM = '1234567891'),'1234567891','김은빈','981211','010-5410-0438','서울 강북구',15000,'여');
INSERT INTO storeclerk values((SELECT DISTINCT frreginum FROM STORECLERK WHERE FRREGINUM = '1234567891')||(SELECT count(*)+1001 FROM STORECLERK WHERE FRREGINUM = '1234567891'),'1234567891','이윤아','970220','010-1004-9437','서울 강서구',12000,'여');

*/




