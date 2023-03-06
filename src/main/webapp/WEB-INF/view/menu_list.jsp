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
<title>메뉴 조회</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="/ferp/resource/css/notice_list.css"/>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>
</head>
<script type="text/javascript">
	localStorage.setItem("pageIdx","4104")
	localStorage.setItem("eqIdx","7")
</script>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
          	<h2 class="notice_main">메 뉴 조 회</h2>
         	<div class="sch_line">
         		<form method="post">
	           		<input type="text" name="menuName" id="title" value="${sch.menuName}" placeholder="메뉴명 검색">
					<button type="button" class="schBtn">검 색</button>
				</form>
         	</div>
			<table>
		   	<col width="15%">
		   	<col width="50%">
		   	<col width="15%">
		   	<col width="20%">
			    <thead>
			      <tr>
			        <th>메뉴명</th>
			        <th>메뉴설명</th>
			        <th>가격</th>
			        <th>사진</th>
			      </tr>
   				</thead>
			    <tbody>
			    	<c:forEach var="menu" items="${menu}">
			    	<tr>
			    		<td>${menu.menuName}</td>
			    		<td>${menu.info}</td>
			    		<td><fmt:formatNumber value="${menu.price}"/></td>
			    		<td><img style="width: 100px; height: 100px;" src="${path}/resource/img/${menu.img}"></td>
			    	</tr>
					</c:forEach>
			    </tbody>	
			</table>
			<div class="page_wrap">
			   <div class="page_nation">
			      <a class="arrow prev" href="#"></a>
			      <a href="#" class="active">1</a>
			      <a href="#">2</a>
			      <a href="#">3</a>
			      <a href="#">4</a>
			      <a href="#">5</a>
			      <a class="arrow next" href="#"></a>
			   </div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

</script>
</html>