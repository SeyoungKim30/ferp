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
<title>점검결과조회</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<style>
	.hdq_search{
		display:flex;
	 	background-color: rgba( 204, 204, 204, 0.2 );
	 	height:70px;
	    border-radius: 5px;
	    align-items: center; 
	    margin: 20px 0;
	    justify-content: center;
	}
	.hdq_search>form{
		 display: inline-flex;
		 width: 80%;
		 justify-content: space-between;
		 align-items: center;
	}	
	input[type=text]{
		height:30px;
		width: 25%;
	}
	/*검색버튼*/
	.frsalesSchBtn {
		font-size: 15px;
    	font-weight: 500;
		margin-left: 10px;
   		width: 65px;
   	 	border-radius: 5px;
   	 	border:0px;
	}
	
	
	#h3title{
		margin: 35px 0px 8px 5px;
	}
		   
	tbody tr{
		cursor:pointer;
	}
	tbody tr td{
		text-align: center;
	}
	.leftdata{
		text-align: left;
	}
	
</style>
</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
			
			<h2>이달의 점검결과 조회</h2><br><hr><br>
			
			<!-- 검색 시작 -->
			<div class="hdq_search">
				<form method="post">
					<input class="infoSch" name="frname" value="${sch.frName}"  type="text" placeholder=" 매장명 입력"/>
					<input class="infoSch" name="frRepname" value="${sch.frRepName}"  type="text" placeholder=" 점주명 입력"/>
					<input class="infoSch" name="ename"  value="${sch.ename}" type="text" placeholder=" 담당직원 입력"/>
					<button class="frsalesSchBtn" type="submit">검색</button>
				</form>
			</div>
			<!-- 검색칸 끝 -->
			
			<!-- 정보출력표 시작-->
			<div>
			<h3 id="h3title">이번 달 매장점검 결과</h3>
				<table>
					<col width="21%">
					<col width="13%">
					<col width="13%">
					<col width="13%">
					<col width="20%">
					<col width="20%">
					<thead>
						<tr><th>매장명</th><th>매장번호</th><th>점주명</th><th>담당직원</th><th>점검예정일자</th><th>점검등록일자</tr>
					</thead>
					<tbody>
						<tr>
							<td class="leftdata">wefgkfekl;</td><td>wefgkfekl;</td><td>wefgkfekl;</td><td>wefgkfekl;</td><td>wefgkfekl;</td><td>wefgkfekl;</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 정보출력표 끝 -->
			
			
			
			
		</div>
	</div>
</body>
<script>

	//사이드바에 번호 매긴 것 
	/*
	localStorage.setItem("pageIdx","6202") //id값
	localStorage.setItem("eqIdx","7000")
	*/

	$(document).ready(function(){
	
		search();
	
		//엔터검색
		$("input").on({
			keyup:function(){
				if(event.keyCode==13){
					search();
				}
			}
		});
	
	})
	
			
	function goDetail(frRegiNum){
		location.href="${path}/openTimeCalendar.do?writer="+frRegiNum
	}
	
</script>
</html>