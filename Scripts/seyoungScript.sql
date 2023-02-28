SELECT * FROM account ;

INSERT INTO ACCOUNT values('10100','자산','현금');
ALTER TABLE statement RENAME TO ACStatement;
ALTER TABLE ACSTATEMENT RENAME COLUMN debt TO debit;

UPDATE account SET ACNTUSING = 0 WHERE acntnum='10110';

INSERT INTO acstatement values('A0001','10174252589','11100',1000,0,null,sysdate,null);
INSERT INTO acstatement values('A0001','10174252589','11200',0,1000,null,sysdate,null);
   SELECT count(DISTINCT statementNum) FROM ACSTATEMENT a WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') = '2023-02-23';

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

SELECT * FROM ACSTATEMENT a ;
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
AND STMTDATE BETWEEN TO_DATE('2023-02-01','YYYY-MM-DD') AND TO_DATE('2023-02-10','YYYY-MM-DD')
;

SELECT STATEMENTNUM,
	CASE WHEN acntgroup='비용' THEN debit-credit 
	WHEN acntgroup='자산' THEN debit-credit
	ELSE CREDIT - debit END AS DEBIT,
	STMTOPPOSITE,TO_CHAR(STMTDATE,'YYYY-MM-DD') "STMTDATE", REMARK FROM ACSTATEMENT s , ACCOUNT a
WHERE s.ACNTNUM = a.ACNTNUM 
AND s.ACNTNUM = 40100
AND (STMTOPPOSITE IS NULL OR STMTOPPOSITE LIKE '%'||''||'%')
AND STMTDATE BETWEEN TO_DATE('2023-02-01','YYYY-MM-DD') AND TO_DATE('2023-02-10','YYYY-MM-DD')
AND FRREGINUM = 'fakeID1111'
;

SELECT acntgroup,
CASE WHEN acntgroup='비용' THEN debit-credit 
	WHEN acntgroup='자산' THEN debit-credit
	ELSE CREDIT - debit END AS DEBIT 
FROM ACSTATEMENT s , ACCOUNT a
WHERE s.ACNTNUM = a.ACNTNUM 
AND s.acntnum='40100';

SELECT TO_CHAR(STMTDATE,'YYYY-MM-DD') AS "STMTDATE" ,
		sum(CASE WHEN acntgroup='비용' THEN debit-credit 
		WHEN acntgroup='자산' THEN debit-credit
		ELSE CREDIT - debit END) AS DEBIT
	FROM ACSTATEMENT s , ACCOUNT a
WHERE s.ACNTNUM = a.ACNTNUM 
AND s.ACNTNUM = 40100
AND (STMTOPPOSITE IS NULL OR STMTOPPOSITE LIKE '%'||''||'%')
AND STMTDATE BETWEEN TO_DATE('2023-02-01','YYYY-MM-DD') AND TO_DATE('2023-02-10','YYYY-MM-DD')
AND FRREGINUM = 'fakeID1111'
	GROUP BY STMTDATE;
	
SELECT * FROM PRODORDER o,PRODUCT p WHERE o.PRODUCTNUM =p.PRODUCTNUM  ;
CREATE SEQUENCE pdSeq
INCREMENT BY 1
START WITH 10000
MINVALUE 10000
MAXVALUE 99999
ORDER
CYCLE;
SELECT * FROM product;
INSERT INTO Product values(pdSeq.nextval,'유제품','매일우유 바리스타 1L*5','매일우유 서부통판센터',7200,,)
