SELECT * FROM account;
INSERT INTO ACCOUNT values('10100','자산','현금');
ALTER TABLE statement RENAME TO ACStatement;

INSERT INTO acstatement values('A0001','10174252589','11100',1000,0,null,sysdate,null);
INSERT INTO acstatement values('A0001','10174252589','11200',0,1000,null,sysdate,null);
   SELECT count(DISTINCT statementNum) FROM ACSTATEMENT a WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') = '2023-02-23';

--첫번째거는 +1, 뒤에거는 그냥
INSERT INTO ACSTATEMENT values('A'||to_char((SELECT count(DISTINCT statementNum)+1 FROM ACSTATEMENT a WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') = '2023-02-23'),'FM0000'),'1000','11200',0,1000,null,sysdate,null);
INSERT INTO ACSTATEMENT values('A'||to_char((SELECT count(DISTINCT statementNum) FROM ACSTATEMENT a WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') = '2023-02-23'),'FM0000'),'1000','77300',1000,0,null,sysdate,null);

INSERT INTO ACSTATEMENT 
	values('A'||to_char((SELECT count(DISTINCT statementNum)+1 FROM ACSTATEMENT a WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') = '2023-02-23'),'FM0000'),
		'1000','11100',0,10000,null,sysdate,null);
INSERT INTO ACSTATEMENT 
	values('A'||to_char((SELECT count(DISTINCT statementNum) FROM ACSTATEMENT a WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') = '2023-02-23'),'FM0000'),
		'1000','77300',10000,0,null,sysdate,null);


SELECT * FROM ACSTATEMENT a ;
SELECT min(STATEMENTNUM) FROM ACSTATEMENT a;

SELECT * FROM ACSTATEMENT a WHERE TO_CHAR(stmtdate,'YYYY-MM-DD') ='2023-02-23' AND STATEMENTNUM = (SELECT min(STATEMENTNUM) FROM ACSTATEMENT a2);

DELETE FROM ACSTATEMENT a ;

SELECT TO_DATE('2022-11-11','YYYY-MM-DD') FROM dual; 

SELECT * FROM Account where acntNum Like '%'||''||'%' And acntTitle LIKE '%'||'현'||'%';