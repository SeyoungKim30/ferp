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
	<h2 class="h2Title">발주 신청서 조회</h2>
	<br>
	<div>
		<div class="row">
			<div class="thDiv" style="width: 18%;">발주번호</div>
			<div class="thDiv" style="width: 10%;">자재번호</div>
			<div class="thDiv" style="width: 14%;">요청매장번호</div>
			<div class="thDiv" style="width: 14%;">공급자번호</div>
			<div class="thDiv" style="width: 14%;">신청날짜</div>
			<div class="thDiv" style="width: 10%;">요청수량</div>
			<div class="thDiv" style="width: 10%;">결제상태</div>
			<div class="thDiv" style="width: 10%;">발주상태</div>
		</div>
		<div>
			<c:forEach var="req" items="${reqlist }">
				<div class="row" onclick="prodInfo('${req.orderNum}','${req.productNum }','${req.productName }','${req.amount }',
						'${req.supplier }','${req.demander }','${req.orderDate }','${req.img}','${req.paymentState }','${req.orderState }')">
					<div class="tdDiv" style="width: 18%;">${req.orderNum }</div>
					<div class="tdDiv" style="width: 10%;">${req.productNum }</div>
					<div class="tdDiv" style="width: 14%;">${req.demander }</div>
					<div class="tdDiv" style="width: 14%;">${req.supplier }</div>
					<div class="tdDiv" style="width: 14%;">
						<div style="display: none;">
							<fmt:parseDate var="orderDate" value="${req.orderDate }" pattern="yyyy-MM-dd HH:mm:ss"/> 
						</div>
						<fmt:formatDate value="${orderDate }" pattern="yyyy년MM월dd일"/>
					</div>
					<div class="tdDiv" style="width: 10%;text-align: right;"><fmt:formatNumber value='${req.amount }' pattern='#,#00.##' /></div>
					<div class="tdDiv" style="width: 10%;">${req.paymentState }</div>
					<div class="tdDiv" style="width: 10%;">${req.orderState}</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script type="text/javascript">
	function prodInfo(orderNum,productNum,productName,amount,supplier,demander,orderDate,img,paymentState,orderState){
		$(".orderNum").text(orderNum)
		$(".productNum").text(productNum)
		$(".productName").text(productName)
		$(".amount").text(amount)
		$(".supplier").text(supplier)
		$(".demander").text(demander)
		$(".orderDate").text(orderDate.substring(0,10))
		$(".orderDate2").text(orderDate)
		$(".img").attr("src",'${path}/resource/img/'+img)
		$(".paymentState").text(paymentState)
		$(".orderState").text(orderState)
		if($(".orderState").text() == '완료'){
			$(".uBtn").attr("disabled",true)
			$(".uBtn").css("backgroundColor","#dc3545")
			$(".uBtn").text("발주완료")
		}else{
			$(".uBtn").attr("disabled",false)
			$(".uBtn").css("backgroundColor","#6c757d")
			$(".uBtn").text("수정")
		}
	}
</script>
</html>