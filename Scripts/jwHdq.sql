--매장매출은 주문 
--매장매입은 발주

--본사:저번달 전체매장의 총 매출조회
SELECT sum(payprice) allfrsales
FROM orders
WHERE state='완료'
AND to_char(orderdate, 'YYYY/MM')=to_char(add_months(SYSDATE, -1),'YYYY/MM');

--본사:전체매장의 개별매출조회(사용자지정 기간-月기준)
SELECT frregfinum, sum(payprice) frsales
FROM orders
WHERE state='완료'
AND orderdate BETWEEN CONVERT(date, '화면에서 받아오는 시작날짜') AND CONVERT(date, '화면에서 받아오는 끝날짜')
GROUP BY frrefinum;
--ORDER BY ;

--본사:특정매장의 매출조회(사용자지정기간-月기준)




