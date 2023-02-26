<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장별 발주목록</title>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body class="container">
매장별(발주 번호별) 발주 목록표를 조회하는 기능
1. 오늘 주문들어온거 보고 창고에 딸기 몇개 사올지
2. 딸기 사온거 트럭별로 몇개 실을지(제품별 몇개)
3. 매장별로 보기
- 담당자랑 주문지점은 동시에 선택할 수 없음. 담당자 선택하면 그 담당자가 담당하는 모든 매장이 나오는거고, 담당자 입력해놨어도 지점 입력하면 담당자는 없어지게해야됨<br>
- 주문일자+ 주문 지점 또는 담당자만 입력했을때 결과
- 배송체크 버튼은 주문지점이나 발주번호로 검색했을때만
- 윗줄 검색어랑 아랫줄 검색어 따로??? (날짜만 공통 사용)
<br><br><br>
<div class="row bg-light">
<div class="col m-3 p-2 ">
	<div class="row">
		<div class="col">주문일자 <span class="text-primary"><input type="checkbox">월별 조회</span><input class="form-control" type="date"></div>
		<div class="col">담당자<select class="form-control"><option>김물류</option><option>전체 보기 &nbsp; &nbsp;&nbsp; &nbsp;</option><option>김박박</option><option>남진</option><option>둘리</option></select></div>
		<div class="col">상품 선택<select class="form-control"><option>전체 보기 &nbsp; &nbsp; &nbsp;</option><option>에티오피아1kg</option><option>딸기</option><option>매일우유 바리스타 1L*10</option></select></div>
		<div class="col">상태<select class="form-control"><option>전체 보기 &nbsp; &nbsp; &nbsp;</option><option>배송전</option><option>배송완료</option></select></div>
	</div>
	<div class="row">
			<div class="col">주문지점으로 검색<input class="form-control" placeholder="-" value="홍대입구9번출구점"></div>
			<div class="col">발주번호로 검색<input class="form-control" placeholder="-" value=""></div>
	</div>
</div>
<div class="col-2 p-3"><input type="submit" class="btn btn-primary p-5 overflow" value="발주 조회"></div>
</div>

<table class="table m-3">
<thead>
<tr><th>주문일자</th><th>주문지점</th><th>상품</th><th>수량</th><th>본사 재고</th><th>상태 <button class="btn btn-sm btn-dark">전체 배송체크</button></th></tr>
</thead>
<tbody>
<tr><td>2023-02-18</td><td>홍대입구9번출구점</td><td>에티오피아1kg</td><td>12</td><td>170</td><td>배송전 <button class="btn btn-sm btn-dark">배송체크</button></td></tr>
<tr><td>2023-02-18</td><td>홍대입구9번출구점</td><td>매일우유 1L*5</td><td>14</td><td>20</td><td>배송전 <button class="btn btn-sm btn-dark">배송체크</button></td></tr>
<tr><td>2023-02-18</td><td>홍대입구9번출구점</td><td>딸기5kg(음료용)</td><td>24</td><td>19</td><td>배송전 <button class="btn btn-sm btn-dark">배송체크</button></td></tr>

</tbody>
</table>


<br>
<br>
<br>
<br>
<br>
<br>

3. 상품별 조회할때 : 주문지점이 하나씩 출력됨
<br>
<br>
<br>
<br>
<br>
<br><br>
<br>
<br>
<br>
<br>
<br>

<div class="row bg-light">
<div class="col m-3 p-2 ">
	<div class="row">
		<div class="col">주문일자 <input type="checkbox">월별 조회<input class="form-control" type="date"></div>
		<div class="col">담당자<select class="form-control"><option>김물류</option><option>전체 보기 &nbsp; &nbsp;&nbsp; &nbsp;</option><option>김박박</option><option>남진</option><option>둘리</option></select></div>
		<div class="col">상품 선택<select class="form-control"><option>에티오피아1kg</option><option>딸기</option><option>매일우유 바리스타 1L*10</option></select></div>
		<div class="col">발주 상태<select class="form-control"><option>전체 보기 &nbsp; &nbsp; &nbsp;</option><option>배송전</option><option>배송완료</option></select></div>
	</div>
	<div class="row">
			<div class="col">주문지점으로 검색<input class="form-control" placeholder="-" value="홍대입구9번출구점"></div>
			<div class="col">발주번호로 검색<input class="form-control" placeholder="-" value=""></div>
	</div>
</div>
<div class="col-2 p-3"><input type="submit" class="btn btn-primary p-5 overflow" value="발주 조회"></div>
</div>

<table class="table m-3">
<thead>
<tr><th>주문일자</th><th>주문지점</th><th>상품</th><th>수량</th><th>본사 재고</th><th>상태</th></tr>
</thead>
<tbody>
<tr><td>2023-02-18</td><td>홍대역점</td><td>에티오피아1kg</td><td>10</td><td>100</td><td>배송전</td></tr>
<tr><td>2023-02-18</td><td>신촌점</td><td>에티오피아1kg</td><td>12</td><td>100</td><td>배송전</td></tr>
<tr><td>2023-02-18</td><td>홍대입구9번출구점</td><td>에티오피아1kg</td><td>80</td><td>100</td><td>배송전</td></tr>
<tr><td>2023-02-18</td><td>동교점</td><td>에티오피아1kg</td><td>10</td><td>100</td><td>배송전</td></tr>
<tr><td>2023-02-18</td><td>서교점</td><td>에티오피아1kg</td><td>4</td><td>100</td><td>배송전</td></tr>
<tr><td>2023-02-18</td><td>합정점</td><td>에티오피아1kg</td><td>19</td><td>100</td><td>배송전</td></tr>
<tr><td>2023-02-18</td><td>연남센트럴파크점</td><td>에티오피아1kg</td><td>8</td><td>100</td><td>배송전</td></tr>
<tr><td>2023-02-18</td><td>연남메트로점</td><td>에티오피아1kg</td><td>10</td><td>100</td><td>배송전</td></tr>
<tr><td>2023-02-18</td><td>홍익대점</td><td>에티오피아1kg</td><td>9</td><td>100</td><td>배송전</td></tr>
</tbody>
</table>


</body>
</html>