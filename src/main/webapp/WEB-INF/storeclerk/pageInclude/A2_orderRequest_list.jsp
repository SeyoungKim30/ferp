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
	$(document).ready(function(){
	})
</script>
</head>
<body>
	<h2 class="h2Title">자재 리스트</h2>
	<br>
	<div>
		<div class="row">
			<div class="thDiv" style="width: 14%;">카테고리</div>
			<div class="thDiv" style="width: 19%;">자재명</div>
			<div class="thDiv" style="width: 19%;">거래처</div>
			<div class="thDiv" style="width: 14%;">가격</div>
			<div class="thDiv" style="width: 14%;">재고 수량</div>
			<div class="thDiv" style="width: 9%;">요청 수량</div>
			<div class="thDiv" style="width: 9%;">신청</div>
		</div>
		<div>
			<c:forEach var="p" items="${plist }">
				<div class="row p${p.productNum }">
					<div class="tdDiv" style="width: 14%;">${p.category }</div>
					<div class="tdDiv" style="width: 19%;">
						<input type="hidden" class="productName${p.productNum }" value="${p.productName }"> ${p.productName }
					</div>
					<div class="tdDiv" style="width: 19%;">
						<input type="hidden" class="opposite${p.productNum }" value="${p.opposite }"> ${p.opposite }
					</div>
					<input type="hidden" class="productNum${p.productNum }" value="${p.productNum }"> 
					<input type="hidden" class="frRegiNum${p.productNum }" value="${p.frRegiNum }">
					<div class="tdDiv" style="width: 14%;"><fmt:formatNumber value='${p.price }' type='currency'/></div>
					<div class="tdDiv" style="width: 14%;">${p.remainAmount }</div>
					<div class="tdDiv" style="width: 9%;">
						<div class="row center">
							<button type="button" class="adjustAmountBtn minus${p.productNum }">-</button>
							<input class="adjustAmountText a${p.productNum }" type="text" value="0" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							<button type="button" class="adjustAmountBtn plus${p.productNum }">+</button>
						</div>
					</div>
					<div class="tdDiv" style="width: 9%;">
						<button type="button" class="regB${p.productNum } rB">신청</button>
					</div>
				</div>
				<img src="${path }/resource/img/${p.img}" width="200px" height="200px" class="p preview${p.productNum }" />
<style>
.p${p .productNum}:hover ~ .preview${p .productNum}{
	position:absolute;
	display:block;
}
</style>
<script type="text/javascript">
	$(".p${p.productNum }").mouseover(function(e){
		$(".preview${p.productNum }").css({
			left: e.pageX-200,
		    top: e.pageY-200
		 });
	})
	var i${p.productNum } = 0;
	if($(".a${p.productNum }").val()=='0'){
		$(".minus${p.productNum }").attr("disabled",true)
	}
	$(".minus${p.productNum }").click(function(){
		if($(".a${p.productNum }").val()=='0'){
			$(".minus${p.productNum }").attr("disabled",true)
		}else{
			i${p.productNum }--
			$(".a${p.productNum }").val(i${p.productNum })			
		}
	})
	$(".plus${p.productNum }").click(function(){
		i${p.productNum }++
		$(".minus${p.productNum }").attr("disabled",false)
		$(".a${p.productNum }").val(i${p.productNum })
	})
	$(".regB${p.productNum }").click(function(){
		$(".supplierName").val($(".opposite${p.productNum }").val())
		$(".productName").val($(".productName${p.productNum }").val())
		$("[name=amount]").val($(".a${p.productNum }").val())	
		$("[name=productNum]").val($(".productNum${p.productNum }").val())
		$(".adjustAmountText").val("0")
		$("#modal").attr("style", "display:none");
	})
</script>
			</c:forEach>
		</div>
	</div>
</body>
</html>