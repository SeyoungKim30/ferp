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
SELECT to_char(onTime, 'YYYY/MM/DD') wday, MIN(onTime) firstworkt, MAX(offTime) lastworkt
FROM EMPCHECKIN 
WHERE FRREGINUM='1234567890' 
GROUP BY to_char(onTime, 'YYYY/MM/DD');



SELECT *  --FRCLOSEDDTE 휴무일 
FROM store ;
--GROUP BY TRUNC(onTime, DATE);



--본사:QA점검
SELECT * FROM QACHECKLIST; --실제문항
SELECT * FROM qa;--qa한 기록
--QA실행번호(QA||YYMMDD)  사업자번호 문항번호 결과  본사직원번호(점검한직원)  점검배정일자  점검등록일자(sysdate)  비고
--처음에 담당자한테 점검일자를 배정하고  >>insert 
--실제 점검일에 점검등록일자와 문항번호 결과 등을 입력<<update

--본사:QA항목 출력
--QACHECKLIST
--문항번호  1001<<sequence
--사용여부  A/DA

--품질관리점검표
SELECT qanum, qaitem, usable FROM QACHECKLIST; --전체조회
UPDATE QACHECKLIST SET USABLE='A' WHERE qanum='1005'; --활성화
UPDATE QACHECKLIST SET USABLE='DA' WHERE qanum='1005'; --비활성화
INSERT INTO QACHECKLIST VALUES(qanum_seq.nextval||'', '테이블과 의자는 청결하게 관리되고 있는가','A'); --항목추가


--이달qa 전매장 조회
SELECT s.frreginum, frname, FRREPNAME, ename, frtel, inspectdte, regdte
FROM store s, emp e, (  SELECT FRREGINUM, max(inspectdte) inspectdte, max(regdte) regdte
						FROM QA 
						WHERE trunc(inspectdte, 'MONTH') = trunc(SYSDATE, 'MONTH')  
						GROUP BY FRREGINUM) q
WHERE s.empnum=e.EMPNUM AND s.FRREGINUM=q.frreginum(+)
AND s.frreginum!='9999999999'
ORDER BY inspectdte, frname; 

--이달qa 특정매장 상세조회
--매장정보출력
SELECT DISTINCT  q.frreginum, frname, frtel, inspectdte, regdte, frrepname, ename
FROM store s, emp e, QA q
WHERE e.empnum=q.empnum and s.empnum=e.EMPNUM AND s.FRREGINUM=q.frreginum 
AND q.frreginum='1234567891'
AND trunc(inspectdte, 'MONTH') = trunc(SYSDATE, 'MONTH');
--qa점검결과표
SELECT qaitem, results, comments
FROM QA q, QACHECKLIST qck
WHERE q.qanum=qck.qanum
AND frreginum='1234567891'
AND trunc(inspectdte, 'MONTH') = trunc(SYSDATE, 'MONTH')
ORDER BY q.qanum;
--qa점검결과
SELECT results, count(results)
FROM QA q, QACHECKLIST qck
WHERE q.qanum = qck.qanum
AND frreginum='1234567891'
AND trunc(inspectdte, 'MONTH') = trunc(SYSDATE, 'MONTH')
GROUP BY results;



SELECT * FROM QACHECKLIST;
SELECT * FROM QA;
SELECT * FROM STORE; 

SELECT FRREGINUM, max(inspectdte), max(regdte)
FROM QA 
WHERE trunc(inspectdte, 'MONTH') = trunc(SYSDATE, 'MONTH')  
GROUP BY FRREGINUM;
--WHERE trunc(inspectdte, 'MONTH') = trunc(SYSDATE, 'MONTH')   --실제모드
--WHERE trunc(inspectdte, 'MONTH') = trunc(to_date('2022/02/01', 'YYYY/MM/DD'), 'MONTH') --확인용




--QA실행번호(QA||YYMMDD)  사업자번호 문항번호 결과  본사직원번호(점검한직원)  점검배정일자  점검등록일자(sysdate)  비고

--매장점검일배정  //2월달 매장점검일배정 클릭하면 >> 매장점검일, 매장번호는 프론트 단에서 
INSERT INTO QA VALUES('QA'||to_char(to_date('20230215', 'YYMMDD'), 'YYMMDD'), 
'123457891','1001','',
(SELECT empnum FROM store WHERE frreginum='1234567891'), 
to_date('20230215', 'YYMMDD'),null,''); --항목추가

--매장담당자의 매장점검
/*
UPDATE QA 
SET 
WHERE 
*/



/*

INSERT INTO QA VALUES('QA'||to_char(to_date('20230314', 'YYMMDD'), 'YYMMDD'), 
'1234567892','1008','',
(SELECT empnum FROM store WHERE frreginum='1234567892'), 
to_date('20230314', 'YYMMDD'), null,''); 

SELECT * from qa

*/




/*
create sequence qanum_seq
	increment by 1
	start with 1001
	maxvalue 9999
	nocycle;
*/	
/*
INSERT INTO QACHECKLIST VALUES(qanum_seq.nextval||'', '바닥의 청결이 유지되고 관리 상태가 양호한가','A');
INSERT INTO QACHECKLIST VALUES(qanum_seq.nextval||'', '선반이 청결하고 준비상품이 잘 정리되어있는가','A');
INSERT INTO QACHECKLIST VALUES(qanum_seq.nextval||'', '정수기 필터 교체 및 소독은 정기적으로 이뤄지는가','A');
INSERT INTO QACHECKLIST VALUES(qanum_seq.nextval||'', '쓰레기통과 그 주변은 청결하게 관리하는가','A');
INSERT INTO QACHECKLIST VALUES(qanum_seq.nextval||'', '근무중 수시로 가벼운 청소를 하는가','DA');
INSERT INTO QACHECKLIST VALUES(qanum_seq.nextval||'', '규정된 유니폼을 착용하고 정돈된 모습인가','DA');
INSERT INTO QACHECKLIST VALUES(qanum_seq.nextval||'', '규정된 유니폼을 착용했는가','A');
INSERT INTO QACHECKLIST VALUES(qanum_seq.nextval||'', '테이블과 의자는 청결하게 관리되고 있는가','A');
*/




/*
DROP TABLE empCheckIn;

CREATE TABLE empCheckIn (
	FrRegiNum	varchar2(50),
	clerkNum	varchar2(50),
	onTime	date,
	offTime	date
);

ALTER TABLE empCheckIn ADD CONSTRAINT PK_EMPCHECKIN PRIMARY KEY (
	clerkNum,
	FrRegiNum,
	ontime
);

ALTER TABLE empCheckIn ADD CONSTRAINT FK_storeClerk_TO_empCheckIn_1 FOREIGN KEY (
	FrRegiNum,
	clerkNum
);
*/

/*
--수
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911002', to_date('2023-02-01 06:50:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-01 15:10:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-02-01 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-01 23:15:00', 'YYYY-MM-DD HH24:MI:SS'));
--목 --3.2
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911001', to_date('2023-03-02 06:59:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-02 15:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-02 14:50:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-02 23:10:00', 'YYYY-MM-DD HH24:MI:SS'));
--금
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911002', to_date('2023-03-03 06:55:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-03 15:01:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-03 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-03 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--토
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911003', to_date('2023-03-04 06:57:30', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-04 15:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911004', to_date('2023-03-04 14:45:11', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-04 23:15:00', 'YYYY-MM-DD HH24:MI:SS'));
--일
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911004', to_date('2023-03-05 06:46:48', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-05 23:20:00', 'YYYY-MM-DD HH24:MI:SS'));


--화
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911001', to_date('2023-03-07 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-07 15:14:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-07 14:56:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-07 23:10:00', 'YYYY-MM-DD HH24:MI:SS'));
--수
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911002', to_date('2023-03-08 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-08 15:10:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-08 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-08 23:15:00', 'YYYY-MM-DD HH24:MI:SS'));
--목
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911001', to_date('2023-03-09 06:55:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-09 15:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-09 14:50:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-09 23:10:00', 'YYYY-MM-DD HH24:MI:SS'));
--금
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911002', to_date('2023-03-10 07:20:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-10 15:01:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-10 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-10 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));

--토
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911003', to_date('2023-03-11 06:55:30', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-11 23:25:00', 'YYYY-MM-DD HH24:MI:SS'));
--일
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911004', to_date('2023-03-12 06:50:48', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-12 23:20:00', 'YYYY-MM-DD HH24:MI:SS'));


--화
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911001', to_date('2023-03-14 06:52:48', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-14 15:14:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-14 14:56:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-14 23:10:00', 'YYYY-MM-DD HH24:MI:SS'));
--수
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911002', to_date('2023-03-15 06:57:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-15 15:10:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-15 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-15 23:15:00', 'YYYY-MM-DD HH24:MI:SS'));
--목
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911001', to_date('2023-03-16 07:02:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-16 15:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-16 14:50:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-16 23:10:00', 'YYYY-MM-DD HH24:MI:SS'));
--금
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911002', to_date('2023-03-17 06:50:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-17 15:01:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-17 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-17 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--토
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911003', to_date('2023-03-18 07:01:30', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-18 15:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911004', to_date('2023-03-18 14:40:30', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-18 23:25:00', 'YYYY-MM-DD HH24:MI:SS'));
--
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911004', to_date('2023-03-19 06:50:48', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-02-19 23:20:00', 'YYYY-MM-DD HH24:MI:SS'));


--화
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911001', to_date('2023-03-21 07:05:48', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-21 15:14:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-21 14:56:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-21 23:10:00', 'YYYY-MM-DD HH24:MI:SS'));
--수
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911002', to_date('2023-03-22 06:56:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-22 15:10:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-22 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-22 23:15:00', 'YYYY-MM-DD HH24:MI:SS'));
--목
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911001', to_date('2023-03-23 06:50:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-23 15:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-23 14:50:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-23 23:10:00', 'YYYY-MM-DD HH24:MI:SS'));
--금
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911002', to_date('2023-03-24 06:55:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-24 15:01:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-24 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-24 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
--토
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911003', to_date('2023-03-25 06:46:30', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-25 15:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911004', to_date('2023-03-25 14:40:30', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-25 23:25:00', 'YYYY-MM-DD HH24:MI:SS'));
--일
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911004', to_date('2023-03-26 06:48:48', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-26 23:20:00', 'YYYY-MM-DD HH24:MI:SS'));

--화
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911001', to_date('2023-03-28 06:50:48', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-28 15:14:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-28 14:56:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-28 23:10:00', 'YYYY-MM-DD HH24:MI:SS'));
--수
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911002', to_date('2023-03-29 06:40:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-29 15:40:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-29 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-29 23:35:00', 'YYYY-MM-DD HH24:MI:SS'));
--목
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911001', to_date('2023-03-30 06:50:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-30 15:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911005', to_date('2023-03-30 14:50:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-30 23:10:00', 'YYYY-MM-DD HH24:MI:SS'));
--금
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911002', to_date('2023-03-31 06:55:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-31 15:01:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO EMPCHECKIN VALUES ('1234567891', '12345678911003', to_date('2023-03-31 14:55:00', 'YYYY-MM-DD HH24:MI:SS'), to_date('2023-03-31 23:00:00', 'YYYY-MM-DD HH24:MI:SS'));
*/

--frreginum  1234567890   : 12345678901004~5
--frreginum  1234567891   : 12345678911001~5  --07~23 월요일 휴무 2/6  2/13  2/20  2/27  3/6  
--  화 수 목 금 토 일
--  1  2 1  2 3    오픈 07~15
--  5  5 5  5 4  4   마감 15~23 
--             

SELECT * FROM EMPCHECKIn;
SELECT * FROM CLERKSCHEDULE;

/*
--수
INSERT INTO CLERKSCHEDULE values('2023-02-01T07:00:00','2023-02-01T15:00:00','12345678911002','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-01T15:00:00','2023-02-01T23:00:00','12345678911005','1234567891');
--목
INSERT INTO CLERKSCHEDULE values('2023-02-02T07:00:00','2023-02-02T15:00:00','12345678911001','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-02T15:00:00','2023-02-02T23:00:00','12345678911005','1234567891');
--금
INSERT INTO CLERKSCHEDULE values('2023-02-03T07:00:00','2023-02-03T15:00:00','12345678911002','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-03T15:00:00','2023-02-03T23:00:00','12345678911005','1234567891');
--토
INSERT INTO CLERKSCHEDULE values('2023-02-04T07:00:00','2023-02-04T15:00:00','12345678911003','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-04T15:00:00','2023-02-04T23:00:00','12345678911004','1234567891');
--일
INSERT INTO CLERKSCHEDULE values('2023-02-05T07:00:00','2023-02-05T23:00:00','12345678911004','1234567891');


--화
INSERT INTO CLERKSCHEDULE values('2023-02-07T07:00:00','2023-02-07T15:00:00','12345678911001','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-07T15:00:00','2023-02-07T23:00:00','12345678911005','1234567891');
--수
INSERT INTO CLERKSCHEDULE values('2023-02-08T07:00:00','2023-02-08T15:00:00','12345678911002','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-08T15:00:00','2023-02-08T23:00:00','12345678911005','1234567891');
--목
INSERT INTO CLERKSCHEDULE values('2023-02-09T07:00:00','2023-02-09T15:00:00','12345678911001','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-09T15:00:00','2023-02-09T23:00:00','12345678911005','1234567891');
--금
INSERT INTO CLERKSCHEDULE values('2023-02-10T07:00:00','2023-02-10T15:00:00','12345678911002','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-10T15:00:00','2023-02-10T23:00:00','12345678911005','1234567891');
--토
INSERT INTO CLERKSCHEDULE values('2023-02-11T07:00:00','2023-02-11T15:00:00','12345678911003','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-11T15:00:00','2023-02-11T23:00:00','12345678911004','1234567891');
--일
INSERT INTO CLERKSCHEDULE values('2023-02-12T07:00:00','2023-02-12T23:00:00','12345678911004','1234567891');


--화
INSERT INTO CLERKSCHEDULE values('2023-02-14T07:00:00','2023-02-14T15:00:00','12345678911001','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-14T15:00:00','2023-02-14T23:00:00','12345678911005','1234567891');
--수
INSERT INTO CLERKSCHEDULE values('2023-02-15T07:00:00','2023-02-15T15:00:00','12345678911002','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-15T15:00:00','2023-02-15T23:00:00','12345678911005','1234567891');
--목
INSERT INTO CLERKSCHEDULE values('2023-02-16T07:00:00','2023-02-16T15:00:00','12345678911001','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-16T15:00:00','2023-02-16T23:00:00','12345678911005','1234567891');
--금
INSERT INTO CLERKSCHEDULE values('2023-02-17T07:00:00','2023-02-17T15:00:00','12345678911002','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-17T15:00:00','2023-02-17T23:00:00','12345678911005','1234567891');
--토
INSERT INTO CLERKSCHEDULE values('2023-02-18T07:00:00','2023-02-18T15:00:00','12345678911003','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-18T15:00:00','2023-02-18T23:00:00','12345678911004','1234567891');
--일
INSERT INTO CLERKSCHEDULE values('2023-02-19T07:00:00','2023-02-19T23:00:00','12345678911004','1234567891');


--화
INSERT INTO CLERKSCHEDULE values('2023-02-20T07:00:00','2023-02-20T15:00:00','12345678911001','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-20T15:00:00','2023-02-20T23:00:00','12345678911005','1234567891');
--수
INSERT INTO CLERKSCHEDULE values('2023-02-21T07:00:00','2023-02-21T15:00:00','12345678911002','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-21T15:00:00','2023-02-21T23:00:00','12345678911005','1234567891');
--목
INSERT INTO CLERKSCHEDULE values('2023-02-22T07:00:00','2023-02-22T15:00:00','12345678911001','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-22T15:00:00','2023-02-22T23:00:00','12345678911005','1234567891');
--금
INSERT INTO CLERKSCHEDULE values('2023-02-23T07:00:00','2023-02-23T15:00:00','12345678911002','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-23T15:00:00','2023-02-23T23:00:00','12345678911005','1234567891');
--토
INSERT INTO CLERKSCHEDULE values('2023-02-24T07:00:00','2023-02-24T15:00:00','12345678911003','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-24T15:00:00','2023-02-24T23:00:00','12345678911004','1234567891');
--일
INSERT INTO CLERKSCHEDULE values('2023-02-25T07:00:00','2023-02-25T23:00:00','12345678911004','1234567891');

--화
INSERT INTO CLERKSCHEDULE values('2023-02-27T07:00:00','2023-02-27T15:00:00','12345678911001','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-27T15:00:00','2023-02-27T23:00:00','12345678911005','1234567891');
--수
INSERT INTO CLERKSCHEDULE values('2023-02-28T07:00:00','2023-02-28T15:00:00','12345678911002','1234567891');
INSERT INTO CLERKSCHEDULE values('2023-02-28T15:00:00','2023-02-28T23:00:00','12345678911005','1234567891');
*/

-- product에서 자재명 자재코드
-- stock에서 
-- 본사에서 본사재고 현재 창고에 있는것만 뜨게
-- 자재코드, 자재명, 일자, 사업자번호, 변동수량, 재고수량, 발주번호, 발주신청일,발주상태
SELECT * FROM PRODORDER;
SELECT * FROM stock;

SELECT DISTINCT s.productnum, nvl(odst, '완료') odst
FROM stock s, (SELECT productnum, orderstate
				FROM PRODORDER 
				WHERE orderstate='요청'
				ORDER BY orderdate) p
WHERE s.productnum(+) = p.productnum
;

SELECT * FROM PRODORDER;
SELECT * FROM stock; 
SELECT productnum, ORDERDATE, orderstate
FROM PRODORDER 
WHERE orderstate='요청';

SELECT * FROM orders;



