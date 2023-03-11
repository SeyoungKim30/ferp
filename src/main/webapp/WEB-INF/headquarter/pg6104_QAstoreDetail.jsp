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
<title>점검결과 상세 조회</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<style type="text/css">

	#backBtn{
		color: #fff;
		background-color: #007bff;
		width:140px;
		height:33px;
		border-radius:50px;
		text-align: center;/*가로정렬*/
    	line-height: 33px;/*세로정렬*/
	}
	#backBtn:hover {
		background-color: #0069d9;
		cursor:pointer;
	}
	#backBtn.focus, #backBtn:focus {
		box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .5)
	}
	
	
	.storePrint{
		margin:30px 0px 40px 5px;
	}
	.storePrint>div{
	    margin: 10px 3px;
	    font-size: 18px;
	    font-weight: 500;
	    display:flex;
	    gap: 10px;
	}.storePrint>h1{
		margin-bottom:15px;
	}
	span.strifo_header {
    	font-weight: 600;
    	width:100px;
	}	
	span.strifo_rslt{
		width:400px;
	}
	#qaRslt{
		display:flex;
		gap:20px;
	}
	#qaRslt>span{
		
	}
	
	.ctrdata{
		text-align: center;
	}

</style>
</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
			
			<h2>QA결과 상세 조회</h2><br><hr><br>
			
			<!-- 이전페이지가기 버튼-->
			<div onclick="back()" id="backBtn">
			 &lt; 전체조회페이지
			</div>
			
			<!-- 매장정보간단출력 시작 -->
			<div class="storePrint">
				<h1>${otdetail.frName }</h1>
				<div><span class="strifo_header">매장전화번호</span><span class="strifo_rslt">${otdetail.frTel }</span></div>
				<div><span class="strifo_header">점검예정일자</span><span class="strifo_rslt">${otdetail.frRepName }</span>&nbsp;<span class="strifo_header">점검등록일자</span><span>${otdetail.ename }</span></div>
				<div><span class="strifo_header">점주</span><span class="strifo_rslt">${otdetail.frRepName }</span>&nbsp;<span class="strifo_header">담당직원</span><span>${otdetail.ename }</span></div>
			</div>
			<!-- 매장정보간단출력 끝-->
			
			<!-- 결과표 시작 -->
			<div id="qaRslt"><span>점검결과:</span><span id="QAresult">이상없음</span></div>
			<table>
				<col width="60%">
			    <col width="10%">
			    <col width="30%">
				<thead>
					<tr><th>항목</th><th>이상없음</th><th>비고</th></tr>
				</thead>
				<tbody>
					<tr><td></td><td class="ctrdata">ckimg</td><td></td></tr>
				</tbody>
				
			
			</table>
			<!-- 결과표 끝 -->
		</div>
	</div>
</body>

<script>
	//이전페이지가기 클릭
	function back(){
		history.back();
	}
</script>

</html>