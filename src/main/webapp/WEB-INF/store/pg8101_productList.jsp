<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="now" value="<%= new java.util.Date() %>" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 재고 조회</title>
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
		$("[name=stockDate]").val("${sch.stockDate}");
		$("[name=productNum]").val("${sch.productNum}");
		$("[name=category]").val("${sch.category}");
		$("[name=productName]").val("${sch.productName}");
		$("[name=opposite]").val("${sch.opposite}");
		$("[name=orderState]").val("${sch.orderState}");	
	});
	
</script>
</head>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
			<h2>매장 재고 조회</h2>
			<form method="post">
				<input class="inputbox" type="date" name="stockDate" value="<fmt:formatDate value="${now}" pattern = "yyyy-MM-dd"/>"/>
				<input class="inputbox" name="productNum" value="${sch.productNum}" placeholder="자재코드 입력"/>
				<input class="inputbox" name="category" value="${sch.category}" placeholder="카테고리명 입력"/>
				<input class="inputbox" name="productName" value="${sch.productName}" placeholder="자재명 입력"/>
				<input class="inputbox" name="opposite" value="${sch.opposite}" placeholder="거래처 입력"/>
					<select name="orderState">
				    	<option value="">발주상태선택</option>
				    	<c:forEach var="orderState" items="${orderStateCom}">
				    	<option>${orderState}</option>
				    	</c:forEach>
				    </select>
				<button class="btn-secondary" type="submit">검색</button>
			</form>
			<div class="searchtab">
				<table>
				<thead>
					<tr><th>입고일자</th><th>자재코드</th><th>카테고리명</th><th>자재명</th><th>거래처</th>
						<th>단가</th><th>수량</th><th>발주상태</th><th>비고</th></tr>
				</thead>
				<tbody>
					<c:forEach var="prod" items="${plist}">
			    	    <tr ondblclick="goDetail(${prod.productNum})">
			    	    	<td>${prod.stockDate}</td>
			    	    	<td>${prod.productNum}</td><td>${prod.category}</td>
			    	    	<td>${prod.productName}</td><td>${prod.opposite}</td>
			    	    	<td>${prod.price}</td><td>${prod.amount}</td>
			    	    	<td>${prod.orderState}</td><td>${prod.remark}</td>
			    	    </tr>
			    	</c:forEach>
				</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>