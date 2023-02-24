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

</style>
</head>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
			<h2>매장 재고 조회</h2>
			<form>
				<div class="searchbox">
					<div class="searchbar">
						<span style="font-size: 18px; font-weight: bold;">입고일자</span>
						<input class="inputbox" name="stockdate" value="${sch.stockDate}" type="text" size="10" />
					</div>
					<div class="searchbar">
						<span style="font-size: 18px; font-weight: bold;">자재코드</span>
						<input class="inputbox" name="productnum" value="${sch.productNum}" type="text" size="10" />
					</div>
					<div class="searchbar">
						<span style="font-size: 18px; font-weight: bold;">카테고리명</span>
						<input class="inputbox" name="category" value="${sch.category}" type="text" size="10" />
					</div>
					<div class="searchbar">
						<span style="font-size: 18px; font-weight: bold;">자재명</span>
						<input class="inputbox" name="productname" value="${sch.productName}" type="text" size="10" />
					</div>
					<div class="searchbar">
						<span style="font-size: 18px; font-weight: bold;">거래처</span>
						<input class="inputbox" name="opposite" value="${sch.opposite}" type="text" size="10" />
					</div>
					<div class="searchbar">
						<span style="font-size: 18px; font-weight: bold;">발주상태</span>
						<select class="inputbox" name="auth">
							<option value="">발주상태선택</option>
							<c:forEach var="auth" items="${authCom}">
								<option>${auth}</option>
							</c:forEach>
						</select>
					</div>
					<div class="searchbar">
						<button class="btn-primary">등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>