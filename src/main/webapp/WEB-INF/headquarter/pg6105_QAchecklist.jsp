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
<title>품질관리점검표</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<style>
  	#addBtn{
		color: #fff;
		background-color: #007bff;
		width:110px;
		height:39px;
		border-radius:10px;
		font-size: 19px;
		text-align: center;/*가로정렬*/
    	line-height: 39px;/*세로정렬*/
		margin: 20px 0;
	}
	#addBtn:hover {
		background-color: #0069d9;
		cursor:pointer;
	}
	#addBtn.focus, #addBtn:focus {
		box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .5)
	}
	
	
	h1#h1ck{
	    text-align: center;
    	margin-bottom: 30px;
	}
	
	.btn-danger{
		padding: 10px;
		padding: 4px 10px;
    	border-radius: 5px;		
	}
	

	table td{
		vertical-align: middle;
	}
	

</style>

</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		
			<h2>품질관리점검표 관리</h2><br><hr><br>
			
			<!-- 등록 버튼-->
			<div onclick="add()" id="addBtn">
			 + 항목추가
			</div>
			
			<h1 id="h1ck">매장위생안전점검표 전체항목</h1>
			
			<table>
				<col width="55%">
				<col width="30%">
				<col width="15%">
				<thead>
					<tr><th>항목</th><th>비고</th><th>&nbsp;</th></tr>
				</thead>
				<tbody>
					<tr><td>바닥의 청결이 유지되고 관리상태가 양호한가</td><td>비고</td><td><span class="btn-danger">비활성화</span></td></tr>
					<tr><td>바닥의 청결이 유지되고 관리상태가 양호한가</td><td>비고</td><td><span class="btn-danger">비활성화</span></td></tr>
				</tbody>
			
			</table>
		
		</div>
	</div>
</body>
<script>

	function add(){
		
	}
</script>
</html>