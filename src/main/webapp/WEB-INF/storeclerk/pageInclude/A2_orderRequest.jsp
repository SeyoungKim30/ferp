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
<link rel="stylesheet" href="${path}/resource/css/A2_modalCSS.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".regBtn").click(function(){
			if(confirm("신청하시겠습니까?")){
				$.ajax({
					type : "post",
					url : "/ferp/requestFrm.do",
					data : $("#regForm").serialize(),
					dataType : "json",
					success : function(data) {
						console.log(data)
						alert(data.msg)
						location.reload()
					},
					error : function(err) {						
						console.log($("#regForm").serialize())
						console.log(err)
					}
				})
			}
		})
	})
</script>
</head>
<body>
	<h2 class="h2Title">발주 신청</h2>
	<br>
	<div id="modal">
		<div class="modal_content">
			<%@ include file="/WEB-INF/storeclerk/pageInclude/A2_orderRequest_list.jsp"%>
			<div style="text-align: right;">
				<button type="button" id="closeBtn">닫기</button>
			</div>
		</div>
	<div class="modal_layer"></div>
	</div>
	<div>
		<div class="toolbox">
			<h3>신청서</h3>
			<br>
			<form id="regForm" method="post">
				<div class="row">
					<div class="col margin-tn w25">
						<label>매장번호</label> 
						<input type="text" name="demander" class="margin-tln regList" value="${login.frRegiNum }" readOnly required />
					</div>
					<div class="col margin-tn w25">
						<label>신청 날짜</label> 
						<input type="date" name="orderDate" value="<fmt:formatDate value='${now}' pattern = 'yyyy-MM-dd'/>" class="margin-tln regList" readOnly required />
					</div>
					<div class="col margin-tn w25" id="openBtn1">
						<label>거래처</label> 
						<input type="text" class="margin-tln regList supplierName" placeholder="거래처" required />
					</div>
				</div>
				<div class="row">
					<div class="col margin-tn w25" id="openBtn2">
						<label>자재명</label> 
						<input type="text" class="margin-tln regList productName" placeholder="자재명" required />
					</div>
					<div class="col margin-tn w25" id="openBtn3">
						<label>수량</label> 
						<input type="text" name="amount" class="margin-tln regList" placeholder="수량" pattern="[0-9]+" required />
					</div>
					<input type="hidden" name="productNum" required />
					<input type="hidden" name="supplier" value="${not empty login.ename?'---':'9999999999' }" required/>
					<div class="col margin-tn w25">
						<button type="button" class="regBtn regList" style="margin-top: 19.5px;">등록</button>
					</div>			
				</div>
			</form>
			<br>
		</div>
	</div>
</body>
<script src="${path}/resource/templates/A2_modalJS.js"></script>
</html>