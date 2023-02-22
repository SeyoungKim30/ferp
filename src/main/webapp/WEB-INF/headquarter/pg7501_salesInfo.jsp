<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>

	<%@ include file="/resourse/store_main_index.jsp" %>
	
	<div class="container">
		<div class="main_wrapper">
			<div class="contents">
			
				<!-- 전체매장총매출출력칸 시작-->
				<div class="hdq_totalSalesPrt">
				
				</div>
				<!-- 전체매장총매출출력칸 끝-->
				
				
				<!-- 검색 시작 -->
				<div clas="hdq_search">
				
				</div>
				<!-- 검색칸 끝 -->
				
				
				<!-- 검색기준 시작 -->
				<div class="hdq_searchStandard">
					<div class="sort">
						<h3>정렬기준</h3>
						<ul>
							<li>매장명</li>
							<li>매출높은 순</li>
							<li>매출낮은 순</li>
						</ul>
					</div>
					<div class="period">
						<h3>매출조회 기간</h3>
						<form>
							<input name="strperiod" type="date"/>
							~
							<input name="endperiod" type="date"/>
							<!-- <button type="hidden" />  -->
						</form>
					</div>
				</div>
				<!-- 검색기준 끝 -->
				
				
				<!-- 정보출력표 시작 -->
				<div class="hdq_infoprint">
					<table>
						<thead>
							<tr><td>매장명</td><td>매장매출액</td><td>매장매입액</td><td>매장전화번호</td><td>점주명</td><td>담당직원</td><td>매장정보수정</td></tr>
						</thead>
						<tbody>
							<tr>
								<td>매장명</td><td>매장매출액</td><td>매장매입액</td><td>매장전화번호</td><td>점주명</td><td>담당직원</td>
								<td><div class=""/><div class=""/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 정보출력표 끝 -->
			
			
			</div>
		</div>
	</div>

</body>
</html>