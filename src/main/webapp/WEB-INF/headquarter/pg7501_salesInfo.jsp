<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>

<!--
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css"/>
-->

<style type="text/css">

	.hdq_totalSalesPrt{
	    display: inline-flex;
	    background-color: rgba( 204, 204, 204);
	    height: 90px;
	    width: 80%;
	    text-align: center;
	    border-radius: 5px;
	    justify-content: center; 
	    align-items: center; /* 수직정렬 */
	}
	.hdq_totalSalesPrt>h2>span{
		font-size: 30px;
	}
	
	
	.hdq_search{
		display:flex;
	 	background-color: rgba( 204, 204, 204, 0.5 );
	 	height:50px;
	    width: 80%;
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
	.hdq_searchStandard{
		display:inline-flex;
		width: 80%;
		align-items: center; 
	    justify-content: space-between;
	    margin: 20px 0px;
	}
	.sort{
		display:inline-flex;	
		align-items: center; 
	    justify-content: center;
	    gap:10px;
	}
	.sort>span{
   	 	font-weight:600;
    	font-size: 18px;
	}
	.sort>ul{
		display:inline-flex;
		align-items: center; 
	    justify-content: center;	
	    gap:5px;
	}
	.sort>ul>li{
		width: 85px;
   	 	height: 30px;
    	text-align: center;
    	line-height: 30px;/*세로정렬*/
    	background-color: rgba( 204, 204, 204, 0.5 );
    	color:#666666;
    	border-radius: 25px;
    	
	}
	.period{
		display:inline-flex;
		align-items: center; 
	    justify-content: center;
	    gap: 10px;
	}
	.period>span{
		font-weight: 600;
    	font-size: 18px;
	}
	input[type=month]{
		height: 30px;
		width: 120px;
   		padding: 0 10px;
		border-radius: 25px;
		border: white;
   		background: rgba( 204, 204, 204, 0.5 );
   		text-align: center;
   		color:#666666;
	}
	
	/*검색버튼*/
	.frsalesSchBtn {
		color: #fff;
		font-size: 15px;
    	font-weight: 500;
		background-color: #007bff;
		margin-left: 10px;
   		width: 65px;
   	 	border-radius: 5px;
   	 	border:0px;
	}
	
	.frsalesSchBtn:hover {
		color: #fff;
		background-color: #0069d9;
		border-color: #0062cc
	}
	
	.frsalesSchBtn.focus, .frsalesSchBtn:focus {
		box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .5)
	}
	
	.frsalesSchBtn.disabled, .frsalesSchBtn:disabled {
		color: #fff;
		background-color: #007bff;
		border-color: #007bff
	}
	
	
	.frsalesSchBtn:not(:disabled):not(.disabled).active, .frsalesSchBtn:not(:disabled):not(.disabled):active,
		.show>.frsalesSchBtn.dropdown-toggle {
		color: #fff;
		background-color: #0062cc;
		border-color: #005cbf
	}
	
	.frsalesSchBtn:not(:disabled):not(.disabled).active:focus, .frsalesSchBtn:not(:disabled):not(.disabled):active:focus,
		.show>.frsalesSchBtn.dropdown-toggle:focus {
		box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .5)
	}
	
	
	/* 테이블 */
	#frs_salesInfo_table{
		width:80%;
	}
	table{
		width:100%;
		border:1px solid rgba( 204, 204, 204);
		border-collapse:collapse;
	}
	thead{
		background: rgba( 204, 204, 204, 0.5 );
		text-align: center;
    	font-weight: 600;
	}
	thead>tr>td{
		padding: 8px 0px;
	}
	tr,td{
		border:1px solid rgb( 204, 204, 204);
		padding: 5px 0px 5px 10px;
	}
	.frt_last_culmm{
		padding: 5px 10px;
		display:flex;
		text-align:center;
		justify-content: space-between;
		border:none;
		vertical-align: inherit;
	}
	.frt_last_culmm>span{
		height: 25px;
	    width:47%;
	    line-height:25px;/*세로정렬*/
	}

	/* 수정버튼 */
	.fr_uptBtn {
		color: #fff;
		background-color: #28a745;
		border-color: #28a745;
		border-radius: 5px;
   	 	border:0px;
	}
	
	.fr_uptBtn:hover {
		color: #fff;
		background-color: #218838;
		border-color: #1e7e34
	}
	
	.fr_uptBtn.focus, .fr_uptBtn:focus {
		box-shadow: 0 0 0 .2rem rgba(40, 167, 69, .5)
	}
	
	.fr_uptBtn.disabled, .fr_uptBtn:disabled {
		color: #fff;
		background-color: #28a745;
		border-color: #28a745
	}
	
	.fr_uptBtn:not(:disabled):not(.disabled).active, .fr_uptBtn:not(:disabled):not(.disabled):active,
		.show>.fr_uptBtn.dropdown-toggle {
		color: #fff;
		background-color: #1e7e34;
		border-color: #1c7430
	}
	
	.fr_uptBtn:not(:disabled):not(.disabled).active:focus, .fr_uptBtn:not(:disabled):not(.disabled):active:focus,
		.show>.fr_uptBtn.dropdown-toggle:focus {
		box-shadow: 0 0 0 .2rem rgba(40, 167, 69, .5)
	}
	
	/* 삭제버튼 */
	.fr_delBtn {
		color: #fff;
		background-color: #dc3545;
		border-color: #dc3545;
		border-radius: 5px;
   	 	border:0px;
	}
	.fr_delBtn:hover {
		color: #fff;
		background-color: #c82333;
		border-color: #bd2130
	}
	
	.fr_delBtn.focus, .fr_delBtn:focus {
		box-shadow: 0 0 0 .2rem rgba(220, 53, 69, .5)
	}
	
	.fr_delBtn.disabled, .fr_delBtn:disabled {
		color: #fff;
		background-color: #dc3545;
		border-color: #dc3545
	}
	
	.fr_delBtn:not(:disabled):not(.disabled).active, .fr_delBtn:not(:disabled):not(.disabled):active,
		.show>.fr_delBtn.dropdown-toggle {
		color: #fff;
		background-color: #bd2130;
		border-color: #b21f2d
	}
	
	.fr_delBtn:not(:disabled):not(.disabled).active:focus, .fr_delBtn:not(:disabled):not(.disabled):active:focus,
		.show>.fr_delBtn.dropdown-toggle:focus {
		box-shadow: 0 0 0 .2rem rgba(220, 53, 69, .5)
	}
	
</style>

<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<!--
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>
-->
<head>

<meta charset="UTF-8">
<title>본사-매장정보출력</title>

</head>

<body class="container">

	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		
				<h2>매장 정보 조회</h2><br><hr><br>
				
				<!-- 전체매장총매출출력칸 시작-->
				<div class="hdq_totalSalesPrt">
					<div>
					<h2>투썸플레이스 지난 달 총 매출&nbsp;&nbsp;&nbsp;&nbsp;
						<span>${addAllsales}</span>&nbsp;원
					</h2>
					</div>
				</div>
				<!-- 전체매장총매출출력칸 끝-->
				
				
				<!-- 검색 시작 -->
				<div class="hdq_search">
					<form method="post">
						<input class="infoSch" name="frname" value="${sch.frname}"  type="text" placeholder=" 매장명 입력"/>
						<input class="infoSch" name="frRepname" value="${sch.frRepname}"  type="text" placeholder=" 점주명 입력"/>
						<input class="infoSch" name="ename"  value="${sch.ename}" type="text" placeholder=" 담당직원 입력"/>
						<button class="frsalesSchBtn" type="submit">검색</button>
				
				</div>
				<!-- 검색칸 끝 -->
					
				
				<!-- 검색기준 시작 -->
				<div class="hdq_searchStandard">
					<div class="sort">
						<span>정렬기준</span>
						<ul>
							<li>매장명</li>
							<li>매출높은 순</li>
							<li>매출낮은 순</li>
						</ul>
					</div>
					<div class="period">
						<span>매출조회 기간</span>
						
							<input id="strperiod" name="frSchOrderdt" value="${sch.frSchOrderdt}" type="month"/>
							~
							<input id="endperiod" name="toSchOrderdt" value="${sch.toSchOrderdt}" type="month"/>
						</form>
					</div>
				</div>
				<!-- 검색기준 끝 -->
				
				
				<!-- 정보출력표 시작-->
				<div id="frs_salesInfo_table">
					<table>
						<col width="30%">
						<col width="14%">
						<col width="14%">
						<col width="13%">
						<col width="7%">
						<col width="7%">
						<col width="15%">
						<thead>
							<tr><td>매장명</td><td>매장매출액</td><td>매장매입액</td><td>매장전화번호</td><td>점주명</td><td>담당직원</td><td>매장정보수정</td></tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
				<!-- 정보출력표 끝 -->
			

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
	var frSchOrderdt = $("[name=frSchOrderdt]").val();
	var toSchOrderdt = $("[name=toSchOrderdt]").val();
	
	//ajax fetch사용
	function search(){
		let url="${path}/salesInfoJson.do?frname="+frname+"&frRepname="+frRepname+"&ename="+ename+"&frSchOrderdt="+frSchOrderdt+"&toSchOrderdt="+toSchOrderdt  //검색값 넘기기
		console.log(url);
		
		fetch(url).then(function(response){return response.json()}).then(function(json){
			console.log(json);
			var sbslist=json.sbslist;
			var trtd='';
		
			sbslist.forEach(function(each){
				trtd+="<tr><td>"+each.frname+"</td><td>"+each.frsales+"</td><td>"+each.frpurchase+"</td><td>"+each.frtel+"</td><td>"+each.frRepname+"</td><td>"+each.ename+"</td><td class='frt_last_culmm'><span class='fr_uptBtn'>수정</span><span class='fr_delBtn'>삭제</span></td></tr>"
			})
			$("table tbody").html(trtd);
			
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
		
		//날짜를 검색
		$("[type=month]").change(function(){
			frSchOrderdt = $("[name=frSchOrderdt]").val();
			toSchOrderdt = $("[name=toSchOrderdt]").val();
			if(frSchOrderdt<=toSchOrderdt){
				search();
			}else{
				alert("검색날짜에 유의하세요");
			}
		})
		
		
		// https://goddino.tistory.com/81
		
	})
	
</script>
</html>