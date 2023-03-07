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
})
</script>
</head>
<body class="container">
<script>
localStorage.setItem("pageIdx","9301")
localStorage.setItem("eqIdx","9000")
</script>

	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		<h2>발주 결제 관리</h2><hr>	<br>

<div class="toolbox">
<form id="searchform">
	<h3>조건으로 조회</h3>
	<div class="toolbar choice1" style="cursor: pointer;">
		<div>
		<label>월별 조회 <input type="month" name="orderDateMonth" required></label>
		<label>주문지점<input name="demander" list="storeList"></label><datalist id="storeList"></datalist>
		<label>담당자<input name="supplier"></label>
		<label>발주상태<select name="orderState"><option value="">전체 보기</option><option>요청</option><option>배송</option><option>완료</option><option>조정</option><option>취소완료</option></select></label>
		<label>결제상태<select name="paymentState"><option value="">전체 보기</option><option>정산전</option><option>청구</option><option>계산서 발행</option><option>완료</option></select></label>
		</div>
	</div>
	<h3>발주번호로 조회</h3>
	<div class="toolbar choice2" style="cursor: pointer;">
		<label>발주 번호<input name="orderNum" required></label>
		<button class="btn-secondary">조회</button>
	</div>
</form>
</div>	
<script>
//셋 중 하나만 입력할 수 있게
$('.choice1 *').on('click',function(){
	$('.choice2 input').attr('disabled',true);
	$('.choice1 input').each(function(){
		$(this).attr('disabled',false);
	})

})
$('.choice2').on('click',function(){
	$('.choice1 input,select').attr('disabled',true);
	$('.choice2 input').attr('disabled',false);
	$('.choice2 input').focus();
})

</script>
		</div>
	</div>
</body>
</html>