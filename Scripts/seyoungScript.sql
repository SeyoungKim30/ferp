SELECT * FROM account ;
SELECT * FROM STORE s ;
SELECT * FROM emp;

INSERT INTO ACCOUNT values('10100','자산','현금');
ALTER TABLE statement RENAME TO ACStatement;
ALTER TABLE ACSTATEMENT RENAME COLUMN debt TO debit;

UPDATE account SET ACNTUSING = 0 WHERE acntnum='10110';

INSERT INTO acstatement values('A0001','10174252589','11100',1000,0,null,sysdate,null);
INSERT INTO acstatement values('A0001','10174252589','11200',0,1000,null,sysdate,null);

SELECT count(DISTINCT statementNum) FROM ACSTATEMENT a WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') = '2023-03-01';

--전표입력
--첫번째거는 +1, 뒤에거는 그냥
INSERT INTO ACSTATEMENT VALUES('WR'||(SELECT nvl(substr(MAX(statementNum),3,5),1000)+1 FROM ACSTATEMENT a  WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') = '2023-02-27'),'1234567890',0,TO_DATE('2023-02-27','YYYY-MM-DD'),10100,2000,0,NULL,null);
INSERT INTO ACSTATEMENT VALUES('WR'||(SELECT nvl(substr(MAX(statementNum),3,5),1000) FROM ACSTATEMENT a  WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') = '2023-02-27'),'1234567890',1,TO_DATE('2023-02-27','YYYY-MM-DD'),10100,0,2000,NULL,null);

SELECT substr(MAX(statementNum),3,5) FROM ACSTATEMENT a WHERE STMTDATE = TO_DATE('2023-02-28','YYYY-MM-DD'); 
SELECT nvl(substr(MAX(statementNum),3,5),1000) FROM ACSTATEMENT a  WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') = '2023-02-28'; 

/*
INSERT INTO ACSTATEMENT VALUES ('WR1001','1234567890',0,sysdate,10100,1000,0,NULL,null);
INSERT INTO ACSTATEMENT VALUES ('WR1001','1234567890',1,sysdate,10100,0,1000,NULL,null);
INSERT INTO ACSTATEMENT VALUES ('WR1002','1234567890',0,sysdate,10100,1000,0,NULL,null);
INSERT INTO ACSTATEMENT VALUES ('WR1002','1234567890',1,sysdate,10100,0,1000,NULL,null);
*/

SELECT * FROM ACSTATEMENT WHERE frRegiNum Like '%'||''||'%'  AND STATEMENTNUM Like '%'||''||'%' ;
SELECT max(STATEMENTNUM) FROM ACSTATEMENT a;

UPDATE ACSTATEMENT SET acntnum= 10100, debit=3000, credit=0,STMTOPPOSITE ='정기거래처',REMARK ='참고용' WHERE STATEMENTNUM ='A0001' AND TO_CHAR(stmtdate,'YYYY-MM-DD') = '2023-02-01' AND lineNum=0;

SELECT * FROM ACSTATEMENT a WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') ='2023-02-28' AND STATEMENTNUM = (SELECT min(STATEMENTNUM) FROM ACSTATEMENT a2);
SELECT * FROM ACSTATEMENT a WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') ='2023-02-27' AND STATEMENTNUM = (SELECT max(STATEMENTNUM) FROM ACSTATEMENT a2);

DELETE FROM ACSTATEMENT a WHERE STATEMENTNUM = 'WR1002' ;

SELECT TO_DATE('2022-11-11','YYYY-MM-DD') FROM dual; 

SELECT * FROM Account where acntNum Like '%'||''||'%' And acntTitle LIKE '%'||'현'||'%';
DROP TABLE ACSTATEMENT ;

--전표목록 조회
SELECT a.ACNTGROUP, s.* FROM ACSTATEMENT s, ACCOUNT a 
WHERE s.acntnum = a.acntnum 
AND a.ACNTNUM = 10100
AND (STMTOPPOSITE IS NULL OR STMTOPPOSITE LIKE '%'||''||'%')
AND STMTDATE BETWEEN TO_DATE('2023-02-01','YYYY-MM-DD') AND TO_DATE('2023-03-10','YYYY-MM-DD')
;

SELECT STATEMENTNUM,a.ACNTTITLE "ACNTNUM",
	CASE WHEN acntgroup='비용' THEN debit-credit 
	WHEN acntgroup='자산' THEN debit-credit
	ELSE CREDIT - debit END AS DEBIT,
	STMTOPPOSITE,TO_CHAR(STMTDATE,'YYYY-MM-DD') "STMTDATE", REMARK FROM ACSTATEMENT s , ACCOUNT a
WHERE s.ACNTNUM = a.ACNTNUM 
AND s.ACNTNUM LIKE '%'||'10300'||'%'
AND (STMTOPPOSITE IS NULL OR STMTOPPOSITE LIKE '%'||''||'%')
AND STMTDATE BETWEEN TO_DATE('2023-02-01','YYYY-MM-DD') AND TO_DATE('2023-03-10','YYYY-MM-DD')
AND FRREGINUM = '9999999999'
;
SELECT nvl(substr(MAX(statementNum),3,5),1000)+1 FROM ACSTATEMENT;
	
SELECT acntgroup,
CASE WHEN acntgroup='비용' THEN debit-credit 
	WHEN acntgroup='자산' THEN debit-credit
	ELSE CREDIT - debit END AS DEBIT 
FROM ACSTATEMENT s , ACCOUNT a
WHERE s.ACNTNUM = a.ACNTNUM 
AND s.acntnum='40100';

SELECT TO_CHAR(STMTDATE,'YYYY-MM-DD') AS "STMTDATE", a.ACNTTITLE "ACNTNUM",
		sum(CASE WHEN acntgroup='비용' THEN debit-credit 
		WHEN acntgroup='자산' THEN debit-credit
		ELSE CREDIT - debit END) AS DEBIT
	FROM ACSTATEMENT s , ACCOUNT a
WHERE s.ACNTNUM = a.ACNTNUM 
AND s.ACNTNUM LIKE '%'||''||'%'
AND (STMTOPPOSITE IS NULL OR STMTOPPOSITE LIKE '%'||''||'%')
AND STMTDATE BETWEEN TO_DATE('2023-02-01','YYYY-MM-DD') AND TO_DATE('2023-03-10','YYYY-MM-DD')
AND FRREGINUM = '9999999999'
	GROUP BY STMTDATE ,a.ACNTTITLE ;

SELECT * FROM PRODORDER p ;
/*CREATE SEQUENCE pdSeq
INCREMENT BY 1
START WITH 10000
MINVALUE 10000
MAXVALUE 99999
ORDER
CYCLE;*/
SELECT * FROM product;
--INSERT INTO Product values('PD'||pdSeq.nextval,'유제품','매일우유 바리스타 1L*5','매일우유 서부통판센터',7200,'/resource/img/PD10001.jpg',null);
--INSERT INTO Product values('PD'||pdSeq.nextval,'유제품','매일우유 1% 저지방우유 1.5L','매일우유 서부통판센터',4980,'/resource/img/PD10002.PNG',null);
SELECT * FROM PRODORDER p ;
INSERT INTO PRODORDER values((SELECT TO_CHAR(SYSDATE,'YYYYMM')||'1234567892' FROM dual),'PD10001','1234567892','9999999999',to_date('2023-03-01','YYYY-MM-DD'),3,'정산전','완료');
INSERT INTO PRODORDER values((SELECT TO_CHAR(SYSDATE,'YYYYMM')||'1234567892' FROM dual),'PD10002','1234567892','9999999999',to_date('2023-03-01','YYYY-MM-DD'),1,'정산전','완료');

INSERT INTO PRODORDER values((SELECT TO_CHAR(SYSDATE,'YYYYMM')||'1234567890' FROM dual),'PD10001','1234567890','9999999999',to_date('2023-02-25','YYYY-MM-DD'),32,'정산전','완료');
INSERT INTO PRODORDER values((SELECT TO_CHAR(SYSDATE,'YYYYMM')||'1234567890' FROM dual),'PD10002','1234567890','9999999999',to_date('2023-02-25','YYYY-MM-DD'),8,'정산전','완료');
--INSERT INTO PRODORDER values((SELECT TO_CHAR(SYSDATE,'YYYYMM')||'1234567890' FROM dual),'PD10001','1234567892','9999999999',SYSdate,3,'정산전','요청');
--INSERT INTO PRODORDER values((SELECT TO_CHAR(SYSDATE,'YYYYMM')||'1234567890' FROM dual),'PD10002','1234567892','9999999999',SYSdate,1,'정산전','요청');


--물류관리 발주 조회 메뉴
--주문지점, 발주번호, 날짜로 검색 + 월별 조회
SELECT * FROM PRODORDER o,PRODUCT p 
WHERE o.PRODUCTNUM =p.PRODUCTNUM
and (DEMANDER LIKE '%'||'1234567892'||'%' OR ORDERNUM LIKE '%'||'2023021234567890'||'%' )
AND TRUNC(orderdate,'month') = trunc(to_date('2023-02-28','YYYY-MM-DD'),'month')
;

--조건으로 검색
SELECT p.*, s1.ename,s1.frname FROM PRODORDER p ,(SELECT * FROM store s, emp e WHERE s.EMPNUM =e.EMPNUM ) s1 
WHERE p.DEMANDER = s1.FRREGINUM
AND PRODUCTNUM LIKE '%'||'PD10001'||'%'
AND s1.ename LIKE '%'||''||'%'
AND PAYMENTSTATE LIKE '%'||''||'%'
AND ORDERSTATE LIKE '%'||''||'%'
AND TRUNC(orderdate) = to_date('2023-02-25','YYYY-MM-DD')
;

--발주 검색: 최종
SELECT po.*, se.empnum,se.ename,se.frreginum,se.frname,stck.remainamount FROM PRODORDER po, product pd, 
		(SELECT FRREGINUM ,FRNAME,e.empnum,ename FROM store s, emp e WHERE s.EMPNUM =e.EMPNUM) se,
		(SELECT * FROM STOCK s WHERE STOCKDATE IN (SELECT max(STOCKDATE) FROM stock GROUP BY PRODUCTNUM)) stck
WHERE po.DEMANDER = se.FRREGINUM AND pd.PRODUCTNUM =po.PRODUCTNUM AND stck.productNum = po.PRODUCTNUM 
	AND (TRUNC(orderdate) = to_date('','YYYY-MM-DD')	--일별일때
			OR TRUNC(orderdate,'month') = TRUNC(to_date('','YYYY-MM-DD'),'month')--월별일때
			OR ORDERNUM LIKE '%'||'2023021234567890'||'%')	--발주번호
	AND (po.DEMANDER LIKE '%'||'디맨더로 받아온 변수'||'%' OR se.frname LIKE '%'||'독산'||'%')	--주문지점
	AND (se.ename LIKE '%'||''||'%' OR se.empNum LIKE '%'||''||'%')	--담당자
	AND (pd.PRODUCTNUM LIKE '%'||''||'%' OR pd.PRODUCTNAME LIKE '%'||''||'%') --상품번호 또는 이름
	AND po.PAYMENTSTATE LIKE '%'||''||'%' AND po.ORDERSTATE LIKE '%'||''||'%'
;

--서브테이블
SELECT FRREGINUM ,FRNAME,e.empnum,ename FROM store s, emp e WHERE s.EMPNUM =e.EMPNUM;
--서브테이블 실시간 본사 재고
SELECT * FROM STOCK s WHERE STOCKDATE IN (SELECT max(STOCKDATE) FROM stock GROUP BY PRODUCTNUM);

SELECT * FROM stock;
SELECT * FROM emp  ;
/*INSERT INTO emp values('00009999','1234','admin','관리자');
INSERT INTO store(frreginum) values('9999999999',); 
INSERT INTO stock VALUES ('PD10001','9999999999',sysdate,100,100,null);*/
INSERT INTO stock VALUES ('PD10001','9999999999',sysdate,10,110,null);