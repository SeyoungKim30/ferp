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
<title>매장 오픈시간 조회</title>

<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />

<style type="text/css">

	.hdq_search{
		display:flex;
	 	background-color: rgba( 204, 204, 204, 0.2 );
	 	height:50px;
	    border-radius: 5px;
	    align-items: center; 
	    margin-top: 5px;
	    justify-content: center;
	}
	.hdq_search>form{
		 display: inline-flex;
		 width: 80%;
		 justify-content: space-between;
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
	
	tbody tr{
		cursor:pointer;
	}
	

</style>

</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
			<h2>오픈시간 조회</h2><br><hr><br>
			
			
			<!-- 검색 시작 -->
			<div class="hdq_search">
				<form method="post">
					<input class="infoSch" name="frname" value="${sch.frname}"  type="text" placeholder=" 매장명 입력"/>
					<input class="infoSch" name="frRepname" value="${sch.frRepname}"  type="text" placeholder=" 점주명 입력"/>
					<input class="infoSch" name="ename"  value="${sch.ename}" type="text" placeholder=" 담당직원 입력"/>
					<button class="frsalesSchBtn" type="submit">검색</button>
			</div>
			<!-- 검색칸 끝 -->
			
			
			<!-- 정보출력표 시작-->
			<div id="frs_Opentime_table">
				<table>
					<col width="35%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<thead>
						<tr><th>매장명</th><th>오픈시간</th><th>매장전화번호</th><th>점주명</th><th>담당직원</th><th>매장정보수정</th></tr>
					</thead>
					<tbody>
						<tr><td>645</td><td>645</td><td>645</td><td>645</td><td>645</td></tr>
						<tr><td>34</td><td>645</td><td>645</td><td></td><td></td></tr>
						<tr><td>345</td><td>645</td><td>645</td><td></td><td></td></tr>
						<tr><td>35</td><td>645</td><td>645</td><td></td><td></td></tr>
					</tbody>
				
				</table>
			</div>
			<!-- 정보출력표 시작-->
			

		</div>
	</div>
</body>
<script>

	//사이드바에 번호 매긴 것 
	/*
	localStorage.setItem("pageIdx","7501") //id값
	localStorage.setItem("eqIdx","3")
	*/
	
	var frname = $("[name=frname]").val();
	var frRepname = $("[name=frRepname]").val();
	var ename = $("[name=ename]").val();
	
	//ajax fetch사용
	function search(){
		let url="${path}/salesInfoJson.do?frname="+frname+"&frRepname="+frRepname+"&ename="+ename+"&frSchOrderdt="+frSchOrderdt+"&toSchOrderdt="+toSchOrderdt  //검색값 넘기기
		//console.log(url);
		
		fetch(url).then(function(response){return response.json()}).then(function(json){
			//console.log(json);
			var sbslist=json.sbslist;
			var trtd='';
		
			sbslist.forEach(function(each){
				trtd+="<tr ondblclick='goDetail("+each.frRegiNum+")'><td>"+each.frname+"</td><td class='numdata'>"+each.frsales.toLocaleString()+"</td><td class='numdata'>"+each.frpurchase.toLocaleString()+"</td><td>"+each.frtel+"</td><td>"+each.frRepname+"</td><td>"+each.ename+"</td><td class='frt_last_culmm'><span class='btn-secondary'>수정</span><span class='btn-danger'>삭제</span></td></tr>"
			})
			$("table tbody").html(trtd);
			//console.log(trtd);
		}).catch(function(err){console.log(err)})	

	}

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
		location.href="${path}/salesDetail.do?frRegiNum="+frRegiNum+"&frSchOrderdt="+frSchOrderdt+"&toSchOrderdt="+toSchOrderdt
	}

</script>
</html>