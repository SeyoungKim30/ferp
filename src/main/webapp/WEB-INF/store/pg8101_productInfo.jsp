<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사 재고 등록</title>
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<style>
#insform {
	position: absolute;
	display: block;
	text-align: center;
	margin: auto;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width : 500px;
	padding: 25px;
	border: 1px solid #FFFFFF;
	border-radius: 5px;
	background-color: #FFFFFF;
}
body{
	background-color: #f5f5f5;
}
.prodimg{
	width: 250px;
	height: 250px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#returnBtn").click(function(){
			location.href = "${path}/sproductList.do"
		})
		
	});
</script>
</head>
<body>
	<div id="insform">
		<h2>매장 자재 상세</h2>
		<div><img class="prodimg" src="${path}/resource/img/${product.img}"></div>
		<div>
			<label for="productNum">자재코드</label> 
			<input name="productNum" type="text" value="${product.productNum}" readonly
				class="ckValid" id="productNum" placeholder="자재코드 입력" required>
		</div>
		<div>
			<label for="category">카테고리명</label> 
			<input type="text" name="category" value="${product.category}" readonly
				class="ckValid" id="category" placeholder="카테고리명 입력" required>
		</div>
		<div>
			<label for="productName">자재명</label> 
			<input type="text" name="productName" value="${product.productName}" readonly
				class="ckValid" id="productName" placeholder="자재명 입력" required>
		</div>
		<div>
			<label for="opposite">거래처</label> 
			<input type="text" name="opposite" value="${product.opposite}" readonly
				class="ckValid"	id="opposite" placeholder="거래처 입력" required>
		</div>
		<div>
			<label for="price">단가</label> 
			<input type="text" name="price" value="${product.price}" readonly
				class="ckValid" id="price" placeholder="단가 입력" required>
		</div>
		<div>
			<label for="remark">비고</label> 
			<input type="text" name="remark" value="${product.remark}" readonly
				class="ckValid" id="remark" placeholder="비고 입력" required>
		</div>
		<br>
		<button id="returnBtn" class="btn-submit" type="button">닫기</button>
	</div>
</body>
</html>