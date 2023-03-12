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
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
	})
</script>
</head>
<body>
	<div class="listCon">
		<h2 class="h2Title">
			&nbsp;&nbsp;&nbsp; 발주번호 : <span class="orderNum"></span><span class="orderDate"></span>
		</h2>
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
							<div class="row">
								<button class="minus10" type="button">-10</button>
								<button class="minus1" type="button">-1</button>
								<div class="amount"></div>
								<button class="plus1" type="button">+1</button>
								<button class="plus10" type="button">+10</button>
							</div>
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
					<div class="os2">
						<label>결제상태</label>
						<div class="paymentState"></div>
					</div>
					<div>
						<label>발주상태</label>
						<div class="orderState"></div>
					</div>
				</div>
			</div>
			<hr>
			<div class="orderDate2" style="display: none;"></div>
			<div>
				<button type="button" class="wdBtn">교환/취소 신청</button>				
			</div>
			<div class="right margin">
				<button type="button" class="uBtn">수정</button>
				<button type="button" class="dBtn">신청 취소</button>
				<button type="button" class="cBtn" id="closeBtn2">닫기</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(".uBtn").on(
			'click',
			function() {
				var dataString = 'amount=' + $(".amount").text() + '&orderNum='
						+ $(".orderNum").text() + '&productNum='
						+ $(".productNum").text() + '&orderDate='
						+ $(".orderDate2").text()
				if (confirm("수정하시겠습니까?")) {
					$.ajax({
						type : "post",
						url : '${path}/uptReqList.do',
						data : dataString,
						dataType : "json",
						success : function(data) {
							alert(data.msg)
							location.reload()
						},
						err : function(err) {
							console.log(err)
						}

					})
				}
			})
	$(".dBtn").on(
			'click',
			function() {
				var dataString = 'orderNum=' + $(".orderNum").text()
						+ '&productNum=' + $(".productNum").text()
						+ '&orderDate=' + $(".orderDate2").text()
				if (confirm("신청취소하시겠습니까?")) {
					$.ajax({
						type : "post",
						url : '${path}/delReqList.do',
						data : dataString,
						dataType : "json",
						success : function(data) {
							alert(data.msg)
							location.reload()
						},
						err : function(err) {
							console.log(err)
						}

					})
				}
			})
	$(".minus1").click(function() {
		var num1 = parseInt($(".amount").text())
		if ((num1 - 1) > 0) {
			$(".amount").text(num1 - 1)
		} else {
			alert("요청수량을 확인해주세요.")
		}

	})
	$(".minus10").click(function() {
		var num1 = parseInt($(".amount").text())
		if ((num1 - 10) > 0) {
			$(".amount").text(num1 - 10)
		} else {
			alert("요청수량을 확인해주세요.")
		}
	})
	$(".plus1").click(function() {
		var num1 = parseInt($(".amount").text())
		if ((num1 + 1) > 0) {
			$(".amount").text(num1 + 1)
		} else {
			alert("ㅁㄴㅇ")
		}
	})
	$(".plus10").click(function() {
		var num1 = parseInt($(".amount").text())
		if ((num1 + 10) > 0) {
			$(".amount").text(num1 + 10)
		} else {
			alert("ㅁㄴㅇ")
		}
	})
	$("#closeBtn2").click(function() {
		$("#modal2").attr("style", "display:none");
	});
	$(".wdBtn").click(function(){
		var orderNumQS = $(".orderNum").text()
		var prodNameQS = $("div.productName").text()
		console.log(orderNumQS)
	})
	
	/*  
	자재명 선택, 종류(오배/누송락/파손) 선택, 처리 방식(환불/재배송) 선택, 이미지 첨부(필요 시)

	*/
</script>
</html>