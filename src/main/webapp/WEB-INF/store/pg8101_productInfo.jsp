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
<title>매장 재고 조회</title>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css"/>
<style>
.searchbox{
	border: 1px solid lightgray;
	margin-top: 10px;
}
.searchbar {
	width: 30%;
	margin: 10px;
	display: inline-block;
	justify-content: space-between;
}
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
		<%-- 
		
		--%>	
	});
</script>
</head>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
			<h2>자재 정보 상세</h2>
			<form>
				<div class="searchbox">
					<div class="searchbar">
						<span>자재코드</span>
						<input class="inputbox" name="productNum" value="${sch.productNum}" type="text" size="10" />
					</div>
					<div class="searchbar">
						<span>카테고리명</span>
						<input class="inputbox" name="category" value="${sch.category}" type="text" size="10" />
					</div>
					<div class="searchbar">
						<span>자재명</span>
						<input class="inputbox" name="productName" value="${sch.productName}" type="text" size="10" />
					</div>
					<div class="searchbar">
						<span>거래처</span>
						<input class="inputbox" name="opposite" value="${sch.opposite}" type="text" size="10" />
					</div>
					<div class="searchbar">
						<span>발주상태</span>
						<input class="inputbox" name="remark" value="${sch.remark}" type="text" size="10" />
					</div>
					<div class="searchbar">
						<button class="btn-secondary">검색</button>
						<button class="btn-primary">자재등록</button>
					</div>
				</div>
			</form>
			<div class="searchtab">
				<table width="80%">
				<thead>
					<tr><th>자재코드</th><th>카테고리명</th><th>자재명</th>
						<th>거래처</th><th>단가</th><th>비고</th></tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${plist}">
			    	    <tr><td>${product.productNum}</td><td>${product.category}</td>
			    	    	<td>${product.productName}</td><td>${product.opposite}</td>
			    	    	<td>${product.price}</td><td>${product.remark}</td></tr>
			    	</c:forEach>
					<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
				</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>