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
<title>본사 재고 조회</title>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css"/>
<style>
.inputbox{
	width: 200px;
}
.searchtab{
	border: 1px solid lightgray;
	margin-top: 10px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("[name=productNum]").val("${sch.productNum}");
		$("[name=category]").val("${sch.category}");
		$("[name=productName]").val("${sch.productName}");
		$("[name=opposite]").val("${sch.opposite}");
		$("[name=remark]").val("${sch.remark}");	
		
		$("#insBtn").click(function(){
			location.href="${path}/hproductInsFrm.do
		})
	});
	<%--
	function goDetail(productNum){
		location.href="${path}/hproductInfo.do?productNum="+productNum 
	}
	
	--%>
	
</script>
</head>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
			<h2>본사 재고 조회</h2>
			<form method="post">
				<input class="inputbox" name="productNum" value="${sch.productNum}" placeholder="자재코드 입력"/>
				<input class="inputbox" name="category" value="${sch.category}" placeholder="카테고리명 입력"/>
				<input class="inputbox" name="productName" value="${sch.productName}" placeholder="자재명 입력"/>
				<input class="inputbox" name="opposite" value="${sch.opposite}" placeholder="거래처 입력"/>
				<input class="inputbox" name="remark" value="${sch.remark}" placeholder="발주상태 입력"/>
				<button class="btn-secondary" type="submit">검색</button>
			    &nbsp;
			    <button class="btn-primary" id="insBtn" type="button">자재등록</button>
			</form>
			<div class="searchtab">
				<table>
				<thead>
					<tr><th>자재코드</th><th>카테고리명</th><th>자재명</th>
						<th>거래처</th><th>단가</th><th>비고</th></tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${plist}">
			    	    <tr ondblclick="goDetail(${product.productNum})">
			    	    	<td>${product.productNum}</td><td>${product.category}</td>
			    	    	<td>${product.productName}</td><td>${product.opposite}</td>
			    	    	<td>${product.price}</td><td>${product.remark}</td>
			    	    </tr>
			    	</c:forEach>
				</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>