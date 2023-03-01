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
	width : 800px;
	padding: 25px;
	border: 1px solid #FFFFFF;
	border-radius: 5px;
	background-color: #FFFFFF;
}
body{
	background-color: #f5f5f5;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#insBtn").click(function(){
			var isInValid = false
			for(var idx=0;idx<$(".ckValid").length;idx++){
				if($(".ckValid").eq(idx).val()==""){
					alert("입력하여야 등록 가능합니다.")
					$(".ckValid").eq(idx).focus()
					isInValid = true
					break;
				}
			}
			if(isInValid){
				return
			}
			$("form").submit()
		})
		$("#returnBtn").click(function(){
			location.href = "${path}/hproductList.do"
		})
	});
</script>
</head>
<body>
	<div>
		<div id="insform">
			<h2>본사 자재 등록</h2>
			<form method="post" enctype="multipart/form-data"
				action="${path}/hproductIns.do" novalidate>
				<div>
					<label for="productNum">자재코드</label> 
					<input name="productNum" type="text" value="${param.productNum}" 
						class="ckValid" id="productNum" placeholder="자재코드 입력" required>
				</div>
				<div>
					<label for="category">카테고리명</label> 
					<input type="text" name="category" value="${param.category}" 
						class="ckValid" id="category" placeholder="카테고리명 입력" required>
				</div>
				<div>
					<label for="productName">자재명</label> 
					<input type="text" name="productName" value="${param.productName}" 
						class="ckValid" id="productName" placeholder="자재명 입력" required>
				</div>
				<div>
					<label for="opposite">거래처</label> 
					<input type="text" name="opposite" value="${param.opposite}"
						class="ckValid"	id="opposite" placeholder="거래처 입력" required>
				</div>
				<div>
					<label for="price">단가</label> 
					<input type="text" name="price" value="${param.price}"
						class="ckValid" id="price" placeholder="단가 입력" required>
				</div>
				<div>
					<label for="remark">비고</label> 
					<input type="text" name="remark" value="${param.remark}" 
						class="ckValid" id="remark" placeholder="비고 입력" required>
				</div>
				<div>
					<div class="custom-file">
						<label class="custom-file-label" for="file01">이미지</label>
						<input type="file" name="multipartfile" id="file01"> 
					</div>
				</div><br>
				<button id="insBtn" class="btn-primary" type="button">등록</button>
				<button id="returnBtn" class="btn-submit" type="button">닫기</button>
			</form>
		</div>
	</div>
</body>
</html>