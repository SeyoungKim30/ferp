<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<style>
.row{
	display:flex;
	flex-flow: row;
	justify-content:space-around;
}
.col{
}
</style>
<script>
localStorage.setItem("pageIdx","9310")
localStorage.setItem("eqIdx","9000")
</script>
</head>

<body class="container">
	%@ include file="/resource/templates/header.jsp"%
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
<h2>정산서</h2><hr><br>
<div class="toolbar">
	<div>수신 소재지 연락처 </div>
	<div>작성일 기간 담당자</div>
</div>
<div class="table">
<div class="row"><div class="col">품목번호</div><div class="col">품목명</div><div class="col">공급가액</div><div class="col">부가세액</div><div class="col">합계금액</div></div>
<div class="row"><div class="col">품목번호</div><div class="col">품목명</div><div class="col">공급가액</div><div class="col">부가세액</div><div class="col">합계금액</div></div>
</div>



		</div>
	</div>
</body>
</html>