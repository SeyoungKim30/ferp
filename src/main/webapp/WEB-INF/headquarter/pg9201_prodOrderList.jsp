<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="login" value="fakeID1111" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주목록 조회</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />

</head>
<script type="text/javascript">
	localStorage.setItem("pageIdx","9201")
	localStorage.setItem("eqIdx","3")
</script>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
	
	<div class="toolbox">
	<h3>매장별 검색</h3>
	<div class="toolbar">
		<div>
		<label>주문일자 
				<span style="color:#007bff;margin-left: 1em;align-items: center;"><input type="checkbox" style="display: inline;height: 1em;width: 1em">월별 조회</span>
				<input type="date"></label>
		<label>	주문지점으로 검색<input placeholder="-" value="홍대입구9번출구점"></label>
		<label>	발주번호로 검색<input placeholder="-" value=""></label>
		</div>
	</div>
	<h3>조건으로 검색</h3>
	<div class="toolbar">
	<div>
		<label>담당자<select ><option>김물류</option><option>전체 보기</option><option>김박박</option><option>남진</option><option>둘리</option></select></label>
		<label>상품 선택<select ><option>전체 보기</option><option>에티오피아1kg</option><option>딸기</option><option>매일우유 바리스타 1L*10</option></select></label>
		<label>상태<select ><option>전체 보기</option><option>배송전</option><option>배송완료</option></select></label>
	</div>
	<input type="submit" class="btn btn-primary p-5 overflow" value="발주 조회">
	</div>
	</div>

<table>
<thead>
<tr><th>주문일자</th><th>주문지점</th><th>상품</th><th>수량</th><th>본사 재고</th><th>상태 <button>전체 체크</button></th></tr>
</thead>
<tbody>
<tr><td>2023-02-18</td><td>홍대입구9번출구점</td><td>에티오피아1kg</td><td>12</td><td>170</td><td>배송전 <button>배송체크</button></td></tr>
<tr><td>2023-02-18</td><td>홍대입구9번출구점</td><td>매일우유 1L*5</td><td>14</td><td>20</td><td>배송전 <button>배송체크</button></td></tr>
<tr><td>2023-02-18</td><td>홍대입구9번출구점</td><td>딸기5kg(음료용)</td><td>24</td><td>19</td><td>배송전 <button>배송체크</button></td></tr>

</tbody>
</table>
		
	

		</div>
	</div>
</body>
</html>