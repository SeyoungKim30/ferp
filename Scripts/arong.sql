SELECT * FROM PRODUCT;
SELECT * FROM STOCK;
SELECT * FROM Product
WHERE productNum LIKE '%'||''||'%'
AND category LIKE '%'||''||'%'
AND productName LIKE '%'||''||'%'
AND opposite LIKE '%'||''||'%'
AND remark LIKE '%'||''||'%';