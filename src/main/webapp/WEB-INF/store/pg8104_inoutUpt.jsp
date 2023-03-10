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
<title>본사 재고 관리 조회</title>
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css"/>
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
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
		
	});
	
</script>
</head>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		<h2>본사 재고 관리 조회</h2><br><hr><br>
			<div class="toolbox">
			<form class="toolbar" method="post">
				<input class="inputbox" name="productNum" value="${sch.productNum}" placeholder="자재코드 입력"/>
				<input class="inputbox" name="category" value="${sch.category}" placeholder="카테고리명 입력"/>
				<input class="inputbox" name="productName" value="${sch.productName}" placeholder="자재명 입력"/>
				<input class="inputbox" name="opposite" value="${sch.opposite}" placeholder="거래처 입력"/>
				<button class="btn-secondary" type="submit">검색</button>
			    <button class="btn-primary" id="insBtn" type="button" 
			    	onclick="location.href='${path}/hproductInsFrm.do'">자재등록</button>
			</form>
			</div>
			
			<div class="searchtab">
				<table>
				<thead>
					<tr><th>입고일자</th><th>자재코드</th><th>카테고리명</th><th>자재명</th>
						<th>거래처</th><th>단가</th><th>수량</th><th>비고</th></tr>
				</thead>
				<tbody>
					<c:forEach var="prod" items="${plist}">
			    	    <tr onclick="goDetail('${prod.productNum}')">
			    	    	<td>${prod.stockDate}</td>
			    	    	<td>${prod.productNum}</td>
			    	    	<td>${prod.category}</td>
			    	    	<td>${prod.productName}</td>
			    	    	<td>${prod.opposite}</td>
			    	    	<td><fmt:formatNumber value="${prod.price}" type='currency'/></td>
			    	    	<td>${prod.amount}</td>
			    	    	<td>${prod.remark}</td>
			    	    </tr>
			    	</c:forEach>
				</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>