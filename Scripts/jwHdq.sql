--매장매출은 주문 
--매장매입은 발주

--본사:저번달 전체매장의 총 매출조회 
SELECT nvl(sum(payprice),0) allfrsales
FROM orders
WHERE state='완료'
AND to_char(orderdate, 'YYYY/MM')=to_char(add_months(SYSDATE, -1),'YYYY/MM');
--AND SUBSTR(orderdate, 1, 5)=to_char(add_months(SYSDATE, -1),'YY/MM');


--본사:전체매장의 개별매출조회(사용자지정 기간-月기준)
SELECT frname, s.frreginum, frtel, frrepname, ename, frsales
FROM store s, emp e, (  SELECT frreginum, nvl(sum(payprice),0) frsales
						FROM orders
						WHERE state='완료'
						AND to_char(orderdate,'YYYY/MM') BETWEEN '2023/01' AND '2023/02'
						GROUP BY frreginum ) ord
WHERE ord.frreginum=s.frreginum AND s.empnum=e.empnum;



SELECT * FROM store;
SELECT * FROM emp;


SELECT * FROM orders; 
SELECT * FROM PRODORDER;
--where SUBSTR(orderdate, 1, 5) BETWEEN '23/01' AND '23/02'; <<절대 BETWEEN '2023/01'형태XXXXX
--AND orderdate BETWEEN to_Date('화면에서 받아오는 시작날짜','YYYY/MM') AND to_Date('화면에서 받아오는 끝날짜','YYYY/MM')


--본사:특정매장의 매출조회(사용자지정기간-月기준)


 
SELECT * FROM store;
--INSERT INTO store VALUES('123456790', 3917,'투썸 부산광안리점', '08:00', '14', '월', '김사희', '051-123-4754', '부산 광안리구 갈매기로 123', 'busan01' );
--INSERT INTO store VALUES('123456791', 970525, '투썸 광화문점', '07:00', '14', '화', '이종혁', '02-264-6537', '서울 종로구 광화로 45', 'gwanghwamun');
SELECT * FROM emp; 
--INSERT INTO emp VALUES (3917, 'a1234', '김아무', '관리팀');
SELECT * FROM orders;

--123456789 가게
INSERT INTO orders VALUES ('a10000', to_Date('2023/01/02','YY/MM/DD'),'1000',123456789,'complete',1,4100,'' );
INSERT INTO orders VALUES ('a10001', to_Date('2023/01/02','YY/MM/DD'),'1000',123456789,'complete',1,4100,'' );
INSERT INTO orders VALUES ('a10002', to_Date('2023/01/05','YY/MM/DD'),'1000',123456789,'complete',2,8200,'' );
INSERT INTO orders VALUES ('a10003', to_Date('2023/01/05','YY/MM/DD'),'1000',123456789,'cancel',2,8200,'' );
INSERT INTO orders VALUES ('a10004', to_Date('2023/01/06','YY/MM/DD'),'1000',123456789,'complete',2,8200,'' );
INSERT INTO orders VALUES ('a10005', to_Date('2023/01/08','YY/MM/DD'),'1001',123456789,'complete',1,5800,'' );
--123456790
INSERT INTO orders VALUES ('b10000', to_Date('2023/01/02','YY/MM/DD'),'1000',123456790,'complete',1,4100,'' );
INSERT INTO orders VALUES ('b10001', to_Date('2023/01/02','YY/MM/DD'),'1000',123456790,'cancel',1,4100,'' );
INSERT INTO orders VALUES ('b10002', to_Date('2023/01/07','YY/MM/DD'),'1000',123456790,'complete',2,8200,'' );
INSERT INTO orders VALUES ('b10003', to_Date('2023/01/08','YY/MM/DD'),'1000',123456790,'complete',2,8200,'' );
INSERT INTO orders VALUES ('b10004', to_Date('2023/01/09','YY/MM/DD'),'1000',123456790,'complete',2,8200,'' );
INSERT INTO orders VALUES ('b10005', to_Date('2023/01/09','YY/MM/DD'),'1001',123456790,'cancel',1,5800,'' );
--123456791 가게
INSERT INTO orders VALUES ('c10000', to_Date('2023/01/01','YY/MM/DD'),'1000',123456791,'cancel',1,4100,'' );
INSERT INTO orders VALUES ('c10001', to_Date('2023/01/01','YY/MM/DD'),'1000',123456791,'complete',1,4100,'' );
INSERT INTO orders VALUES ('c10002', to_Date('2023/01/12','YY/MM/DD'),'1000',123456791,'cancel',2,8200,'' );
INSERT INTO orders VALUES ('c10003', to_Date('2023/01/13','YY/MM/DD'),'1000',123456791,'complete',2,8200,'');
INSERT INTO orders VALUES ('c10004', to_Date('2023/01/13','YY/MM/DD'),'1000',123456791,'cancel',2,8200,'' );
INSERT INTO orders VALUES ('c10005', to_Date('2023/01/17','YY/MM/DD'),'1001',123456791,'complete',1,5800,'' );
INSERT INTO orders VALUES ('c10006', to_Date('2023/01/19','YY/MM/DD'),'1001',123456791,'complete',1,5800,'' );
INSERT INTO orders VALUES ('c10007', to_Date('2023/03/01','YY/MM/DD'),'1001',123456791,'complete',1,5800,'' );

INSERT INTO orders VALUES ('c10008', to_Date('2023/02/03','YY/MM/DD'),'1001',123456791,'complete',1,5800,'' );
INSERT INTO orders VALUES ('c10009', to_Date('2023/02/11','YY/MM/DD'),'1001',123456791,'complete',1,5800,'' );



SELECT * FROM orders;



SELECT * FROM menu;
