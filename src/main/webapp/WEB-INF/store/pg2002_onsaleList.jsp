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
<title>판매 메뉴 등록</title>
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css"/>
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<style>
	.necessarySpan{
		color: red;
		font-weight: 600;
	}
	
	td{
		text-align: center;
	    line-height: 35px;
	}
</style>
<script type="text/javascript">
	localStorage.setItem("pageIdx","2002")
	localStorage.setItem("eqIdx","5")

	$(document).ready(function(){

	});

</script>
</head>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		<h2>판매 메뉴 삭제</h2><br><hr><br>
			<table>
				<thead>
					<tr>
						<th>이름</th><th>가격</th><th>메뉴 설명</th><th>등록</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mn" items="${showOnSale}">
						<tr>
								<td>${mn.menuName}</td>
								<td>
									<fmt:formatNumber value="${mn.price }" pattern="#,###" />￦
								</td>
								<td>${mn.info}</td>
								<td>
									<c:if test="${mn.necessary == 'N'}">
									<button class="btn-primary">삭제</button>
									</c:if>
									<c:if test="${mn.necessary == 'Y'}">
									<span class="necessarySpan">필수 판매 메뉴입니다.</span>
									</c:if>
								</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">


</script>
</html>