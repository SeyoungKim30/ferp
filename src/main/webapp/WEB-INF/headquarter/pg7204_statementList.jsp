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
<title>타이틀</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<style>
.toolbar div input,select{
	display:block;}
</style>
</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">

	<div class="toolbar">
		<div>
				<div><label>시작일자<input type="date"></label></div>
				<div><label>종료일자<input type="date"></label></div>
				<div><label>거래처<input placeholder="거래처"></label></div>
				<div><label>계정과목<select><option>계정과목</option></select></label></div>
		</div>
		<div>
		<button>일자별 조회</button>
		<button>건별 조회</button>
		</div>
	</div>

<table style="width:100%">
<thead>
<tr><th>일자</th><th>계정명</th><th>금액</th><th>거래처</th><th>적요</th></tr>
</thead>
<tbody>
<tr style="font-weight: bold"><td>전체</td><td>상품매출</td><td>452,100</td><td></td><td></td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
<tr><td>2023-02-18</td><td>상품매출</td><td>6,000</td><td>결제대행사</td><td>주문번호 1065132</td></tr>
</tbody>
</table>

		
		
		
		
		</div>
	</div>
</body>
</html>