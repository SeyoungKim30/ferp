SELECT * FROM PRODUCT;
DELETE FROM PRODUCT WHERE PRODUCTNUM ='11';
SELECT * FROM STOCK;
SELECT * FROM PRODORDER;
INSERT INTO PRODORDER VALUES ('111','11','1234567890','11',sysdate,'11','11','11');
SELECT * FROM STORE;
-- 본사 재고 조회
SELECT p.PRODUCTNUM ,p.CATEGORY ,p.PRODUCTNAME ,p.OPPOSITE ,p.PRICE ,p2.AMOUNT ,p2.ORDERSTATE ,p.REMARK 
FROM PRODUCT p , PRODORDER p2 
WHERE p.PRODUCTNUM = p2.PRODUCTNUM 
AND p.productNum LIKE '%'||''||'%'
AND category LIKE '%'||''||'%'
AND productName LIKE '%'||''||'%'
AND opposite LIKE '%'||''||'%'
AND orderState LIKE '%'||''||'%';
SELECT DISTINCT orderState FROM PRODORDER;
-- 본사 재고 등록
INSERT INTO PRODUCT VALUES (#{productNum}, #{category}, 
#{productName}, #{opposite}, #{price}, #{img}, #{remark});
-- 본사 재고 수정
UPDATE PRODUCT
SET productNum = #{productNum},
	category = #{category},
	productName = #{productName},
	opposite = #{opposite},
	price = #{price},
	img = #{img},
	remark = #{remark}
WHERE productNum = #{productNum};
-- 본사 매매내역 조회

-- 본사 매매내역 등록

-- 본사 매매내역 수정

-- 본사 매매내역 삭제

-- 매장 재고 조회
SELECT s.STOCKDATE ,p.PRODUCTNUM ,p.CATEGORY ,p.OPPOSITE ,p.PRICE ,p2.AMOUNT ,p2.ORDERSTATE ,p.REMARK 
FROM PRODUCT p , STOCK s , PRODORDER p2 
WHERE p.PRODUCTNUM = s.PRODUCTNUM 
AND p.PRODUCTNUM = p2.PRODUCTNUM 
AND stockDate LIKE '%'||''||'%'
AND p.productNum LIKE '%'||''||'%'
AND category LIKE '%'||''||'%'
AND productName LIKE '%'||''||'%'
AND opposite LIKE '%'||''||'%'
AND orderState LIKE '%'||''||'%';
-- 매장 매매내역 조회
SELECT s.STOCKDATE ,p.ORDERNUM ,p2.PRODUCTNUM ,p2.CATEGORY ,p2.PRODUCTNAME ,p2.OPPOSITE ,p2.PRICE ,s.APPLYAMOUNT ,p.PAYMENTSTATE ,s.REMARK 
FROM STOCK s ,PRODORDER p ,PRODUCT p2
WHERE p2.PRODUCTNUM = s.PRODUCTNUM 
AND p2.PRODUCTNUM = p.PRODUCTNUM ;
-- 매장 매매내역 등록

-- 매장 매매내역 수정

-- 매장 매매내역 삭제


SELECT TO_CHAR(s.stockDate,'YYYY-MM-DD') stockDate ,p.PRODUCTNUM ,p.CATEGORY ,p.PRODUCTNAME ,p.OPPOSITE ,p.PRICE ,p2.AMOUNT ,p2.ORDERSTATE ,p.REMARK 
		FROM PRODUCT p , STOCK s , PRODORDER p2 
		WHERE p.PRODUCTNUM = s.PRODUCTNUM 
		AND p.PRODUCTNUM = p2.PRODUCTNUM 
		AND stockDate = to_date('2023-02-11','YYYY-MM-DD');
SELECT TO_CHAR(s.stockDate,'YYYY-MM-DD') stockDate
		,p.PRODUCTNUM ,p.CATEGORY ,p.PRODUCTNAME ,p.OPPOSITE ,p.PRICE
		,p2.AMOUNT ,p2.ORDERSTATE ,p.REMARK
		FROM PRODUCT p , STOCK s , PRODORDER p2
		WHERE p.PRODUCTNUM = s.PRODUCTNUM
		AND p.PRODUCTNUM = p2.PRODUCTNUM
		AND s.stockDate LIKE '%'|| to_date('2023-02-28','YYYY-MM-DD')||'%';