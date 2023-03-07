<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
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
<script type="text/javascript" src="${path }/resource/js/sy_fetchs.js"></script>
<script>
window.addEventListener('load',function(){
	fetchStoreList();
	$('[type=month]').val(new Date().toISOString().slice(0, 7));
})
</script>
</head>
<body class="container">
<script>
localStorage.setItem("pageIdx","9310")
localStorage.setItem("eqIdx","9000")
</script>
%@ include file="/resource/templates/header.jsp"%
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		<h2>발주 결제 관리</h2><hr>	<br>


<form id="searchform">
	<div class="toolbar">
		<div>
		<label>시작월<input type="month" name="orderDateMonth" required></label>
		<label>종료월<input type="month" name="orderDate"></label>
		<label>주문지점<input name="demander" list="storeList"></label><datalist id="storeList"></datalist>
		<label>담당자<input name="supplier"></label>
		<label>발주상태<select name="orderState"><option value="">전체 보기</option><option>요청</option><option>배송</option><option>완료</option><option>조정</option><option>취소완료</option></select></label>
		<label>결제상태<select name="paymentState"><option value="">전체 보기</option><option>정산전</option><option>청구</option><option>계산서 발행</option><option>완료</option></select></label>
		</div>
		<button class="btn-secondary">조회</button>
	</div>
</form>

<table>
<thead><tr>
<th>정산월</th><th>거래지점</th><th>담당자</th><th>공급가액</th><th>부가세</th><th>총금액</th><th>결제상태</th><th>변경</th>
</tr></thead>
<tbody></tbody>
</table>


		</div>
	</div>
	
<script>
//form ajax로 제출해서 테이블에 출력하기
const form1= document.querySelector('#searchform')
form1.addEventListener('submit', function(e){
    e.preventDefault();	//submit 방지
	fetchSelectPromise("#searchform","${path }/selectProdOrderPayState.do?").then(function(result){
		console.log(result.list)
	}).catch(function(error){console.error(error);})
})



</script>	
</body>
</html>