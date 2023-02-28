--매장매출은 주문 
--매장매입은 발주

--본사:저번달 전체매장의 총 매출조회 
SELECT nvl(sum(payprice),0) allfrsales
FROM orders
WHERE state='완료'
AND to_char(orderdate, 'YYYY/MM')=to_char(add_months(SYSDATE, -1),'YYYY/MM');
--AND SUBSTR(orderdate, 1, 5)=to_char(add_months(SYSDATE, -1),'YY/MM');


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



