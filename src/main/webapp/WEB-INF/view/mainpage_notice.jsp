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
<title>공지사항 조회</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>
</head>
<script type="text/javascript">
	localStorage.setItem("pageIdx","")
	localStorage.setItem("eqIdx","")
</script>
<body class="container">
	<div class="main_wrapper">
		<div class="contents">
          	<h2 class="notice_main">공 지 사 항</h2>

			<table>
		   	<col width="15%">
		   	<col width="60%">
		   	<col width="15%">
		   	<col width="10%">
			    <thead>
			      <tr>
			        <th>NO</th>
			        <th>제목</th>
			        <th>작성일</th>
			        <th>조회수</th>
			      </tr>
   				</thead>
			    <tbody>
			    	<c:forEach var="notice" items="${noticeCombo}">
			    	<tr>
			    		<td>${notice.cnt}</td>
			    		<td class="tab_title" style="text-align: left;" onclick="goDetail('${notice.noticeNum}')">${notice.title}</td>
			    		<td><fmt:formatDate value="${notice.regdte}"/></td>
			    		<td class="numberData">${notice.readCnt}</td>
			    	</tr>
					</c:forEach>
			    </tbody>   				
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	<%-- 
	
	--%>
 

});
function goPage(cnt) {
	$("[name=curPage]").val(cnt);
	$("form").submit()
}
// 상세페이지로 이동
function goDetail(noticeNum) {
	  location.href="${path}/noticeDetail.do?noticeNum="+noticeNum;
}
</script>
</html>