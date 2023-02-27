<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="now" value="<%= new java.util.Date() %>" />
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel="stylesheet" href="${path}/resource/css/reset.css" >
<link rel="stylesheet" href="${path}/resource/css/A2_jhCSS.css" >
<link rel="stylesheet" href="${path}/resource/css/A2_orderRequestJH.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	/* 
	// 페이지 우선순위
	if($(".fourthOp").hasClass("selectedFunction")){
		$(".fourthOp").css("z-index",999)
	}
	 */
	$(".firstOp").click(function(){
		
	})
	$(".secondOp").click(function(){
		
	})
	$(".thirdOp").click(function(){
		
	})
	$(".fourthOp").click(function(){
		location.href="${path}/clerkPayList.do"
	})
});
</script>
</head>
<body>
	<div class="containerJ">
		<div class="row">
			<div class="selectedFunction firstOp">발주 신청</div>
			<div class="unselectedFunction secondOp">배송 불량 신청</div>
			<div class="unselectedFunction thirdOp">배송 불량 현황 조회</div>
			<div class="unselectedFunction fourthOp">발주 계산서 조회</div>
		</div>
		<div class="border fstCon">
			<div class="border margin">
				<form id="regForm" method="post">
					<div class="row">
						<input type="text" name="frRegiNum" class="margin regList" value="fr01" placeholder="사업자등록번호" readOnly required/>
						<input type="date" name="orderDate" value="<fmt:formatDate value="${now}" pattern = "yyyy-MM-dd"/>" class="margin regList"   readOnly required/>
						<input type="text" name="opposite" class="margin regList" placeholder="거래처" required/>
					</div>
					<div class="row">
						<input type="text" name="productName" class="margin-tn regList" placeholder="자재명" required/>
						<input type="text" name="amount" class="margin-tn regList" placeholder="수량" required/>
						<button type="button" class="regBtn regList">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>