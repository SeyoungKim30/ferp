SELECT * FROM PRODUCT;
SELECT * FROM STOCK;
SELECT * FROM PRODORDER;
SELECT * FROM STORE; 
----------------------------------
-- 본사/매장 재고 조회(자재코드별로 최근일자의 자재수량 조회)
SELECT p.*, s.stockDate, s.REMAINAMOUNT, s.FRREGINUM 
FROM PRODUCT p, STOCK s
WHERE p.PRODUCTNUM = s.PRODUCTNUM
AND s.FRREGINUM = '9999999999'
AND (s.PRODUCTNUM, s.STOCKDATE) IN (
    SELECT PRODUCTNUM, MAX(STOCKDATE)
    FROM STOCK
    WHERE FRREGINUM = '9999999999'
    GROUP BY PRODUCTNUM
)
AND s.stockDate LIKE '%'|| to_date('','YYYY-MM-DD')||'%'
AND p.productNum LIKE '%'||''||'%'
AND category LIKE '%'||''||'%'
AND productName LIKE '%'||''||'%'
AND opposite LIKE '%'||''||'%';
-- 본사/매장 재고 상세 페이지
SELECT *
FROM PRODUCT
WHERE productNum like '%'||''||'%';
-- 본사/매장 재고 관리 조회
SELECT s.STOCKDATE ,p.PRODUCTNUM ,p.PRODUCTNAME ,p.PRICE ,s.APPLYAMOUNT ,s.REMAINAMOUNT 
FROM PRODUCT p, STOCK s
WHERE p.PRODUCTNUM = s.PRODUCTNUM
AND s.FrRegiNum = '1234567890';
-- 매장 재고 매출내역등록
INSERT INTO STOCK 
VALUES ('PD10002', '1234567890', sysdate, -3, 
        (SELECT REMAINAMOUNT -3 
         FROM STOCK 
         WHERE PRODUCTNUM = 'PD10002' 
         AND STOCKDATE = (SELECT MAX(STOCKDATE) 
         		FROM STOCK WHERE PRODUCTNUM = 'PD10002')), null);
-- 매장 재고 관리 수정
UPDATE STOCK 
SET APPLYAMOUNT = -2,
    REMAINAMOUNT = (
        SELECT REMAINAMOUNT -2 - APPLYAMOUNT 
        FROM (
            SELECT REMAINAMOUNT, ROW_NUMBER() OVER (ORDER BY STOCKDATE DESC) AS RN 
            FROM STOCK 
            WHERE PRODUCTNUM = 'PD10002'
        ) T 
        WHERE RN = 1
    )
WHERE PRODUCTNUM = 'PD10002' AND STOCKDATE = (SELECT MAX(STOCKDATE) FROM STOCK WHERE PRODUCTNUM = 'PD10002');
-- 매장 재고 관리 삭제
DELETE FROM STOCK 
WHERE PRODUCTNUM = 'PD10002' 
AND APPLYAMOUNT = 3 
AND REMAINAMOUNT = 44;
-- 본사 재고 등록
INSERT INTO PRODUCT VALUES ('PD'||pdSeq.nextval, '', '', '', '', '', '');
-- 본사 재고 수정
UPDATE PRODUCT 
SET REMARK  = ''
WHERE PRODUCTNUM = 'PD10001';
--직원스케줄캘린더 등록
INSERT INTO CLERKSCHEDULE values('2023-03-02T12:00:00','2023-03-02T18:00:00','12345678911001','1234567891');
--직원스케줄캘린더
SELECT * FROM clerkSchedule;
SELECT * FROM storeClerk;
SELECT * FROM store;
SELECT c.*, clerkname 
FROM CLERKSCHEDULE c ,STORECLERK s 
WHERE c.CLERKNUM = s.CLERKNUM 
AND c.FRREGINUM = s.FRREGINUM ;

SELECT DISTINCT s.productNum, p.PRODUCTNAME 
FROM STOCK s, PRODUCT p 
WHERE s.PRODUCTNUM = p.PRODUCTNUM ;

SELECT * 
FROM STORECLERK s 
WHERE FRREGINUM ='1234567890';

SELECT PRODUCTNUM, REMAINAMOUNT  
FROM STOCK
WHERE STOCKDATE in (SELECT MAX(STOCKDATE) 
         		FROM STOCK GROUP BY PRODUCTNUM);


SELECT PRODUCTNUM, sum(applyAmount)
FROM STOCK s 
WHERE FRREGINUM ='1234567890'
GROUP BY PRODUCTNUM ;