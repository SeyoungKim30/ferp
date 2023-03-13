<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DASHBOARD</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<script type="text/javascript" src="${path }/resource/js/sy_fetchs.js"></script>

<style type="text/css">
.notice_top{
	display: flex;
	align-items: center;
}
</style>
</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
			<div class="notice_content">
			<div class="notice_top">
				<h3 style="font-weight: bold;">공지사항</h3>
				<a href="${path}/noticeList.do" style="padding-top: 16px;cursor: pointer;">more ></a>
			</div>
			
				<div class="main_banner">
				<table>
			   	<col width="55%">
			   	<col width="10%">

				    <tbody>
				    	<c:forEach var="notice" items="${noticeCombo}">
				    	<tr>
				    		<td style="cursor: pointer;" onclick="goDetail('${notice.noticeNum}')">${notice.title}</td>
				    		<td style="text-align: center;"><fmt:formatDate value="${notice.regdte}"/></td>
				    	</tr>
						</c:forEach>
				    </tbody>	
				</table>
				</div>
			</div>
			<div class="btm_content">
				<div class="notice">
					<h3>- 매출</h3>
					<div class="boxes"></div>
				</div>
				<div class="schedule">
					<h3>- 담당매장</h3>
					<div class="boxes"></div>
				</div>
			</div>

		</div>
	</div>

</body>
<script type="text/javascript">
//상세페이지로 이동
function goDetail(noticeNum) {
	  location.href="${path}/noticeDetail.do?noticeNum="+noticeNum;
}
</script>
</html>