<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<link rel="stylesheet" href="${path}/resource/css/reset.css">
<link rel="stylesheet" href="${path}/resource/css/A2_jhCSS.css">
<link rel="stylesheet" href="${path}/resource/css/A2_orderRequestJH.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	})
</script>
</head>
<body>
<div class="listCon border">
	<h2 class="h2Title">&nbsp;&nbsp;&nbsp; 발주번호 : <span class="orderNum"></span><span class="orderDate"></span></h2>
	<br>
	<div>
		<div class="listform col">
			<div class="row">
				<div>
					<img class="img" width="250px" height="250px">
				</div>
				<div class="col">
					<div>
						<label>자재코드</label>
						<div class="productNum"></div>
					</div>
					<div>
						<label>자재명</label>
						<div class="productName"></div>						
					</div>
					<div>
						<label>요청수량</label>
						<div class="amount"></div>						
					</div>
				</div>
			</div>
			<div class="row">
				<div>
					<label>공급자번호</label>						
					<div class="supplier"></div>
				</div>
				<div class="os1">
					<label>요청매장번호</label>						
					<div class="demander"></div>
				</div>
			</div>
			<div class="row">
				<div>
					<label>결제상태</label>						
					<div class="paymentState"></div>
				</div>
				<div class="os2">
					<label>발주상태</label>						
					<div class="orderState"></div>
				</div>
			</div>
		</div>
		<hr>
		<div class="orderDate2" style="display: none;"></div>
		<div class="right margin">
			<button type="button" class="uBtn">수정</button>
			<button type="button" class="dBtn">삭제</button>	
			<button type="button" class="cBtn">닫기</button>	
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(".uBtn").on('click',function(){
var dataString = 'amount='+$(".amount").text()+'&orderNum='+$(".orderNum").text()+'&productNum='+$(".productNum").text()+'&orderDate='+$(".orderDate2").text()
console.log(dataString)
		if(confirm("수정하시겠습니까?")){
			$.ajax({
				type : "post",
				url : '${path}/uptReqList.do',
				data : dataString,
				dataType : "json",
				success : function(data){
					alert(data.msg)
				},
				err : function(err){
					console.log(err)
				}
					
			})
		}
	})
</script>
</html>