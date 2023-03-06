<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />


<style type="text/css">

	.hdq_totalSalesPrt{
	    display: inline-flex;
	    width: 100%;
	    background-color: rgba( 204, 204, 204, 0.5);
	    height: 90px;
	    text-align: center;
	    border-radius: 5px;
	    justify-content: center; 
	    align-items: center; /* 수직정렬 */
	}
	.hdq_totalSalesPrt>h2>span{
		font-size: 35px;
	}
	
	
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
	
	.hdq_searchStandard{
		display:inline-flex;
		width: 100%;
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
		cursor:pointer;
	}
	
	.numdata{
		text-align: end;
	}
	tbody tr{
		cursor:pointer;
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
	
	
	.frt_last_culmm{
		display:flex;
		text-align:center;
		justify-content: space-between;
		border:none;
		vertical-align: inherit;
	}
	.frt_last_culmm>span{
		height: 25px;
	    width:46%;
	    line-height:25px;/*세로정렬*/
	}

	
	/* 수정버튼 */
	.btn-secondary{
		border-radius: 5px;
	}
	/* 삭제버튼 */
	.btn-danger {
		border-radius: 5px;
	}
	
</style>

<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

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
						<span>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${addAllsales}" />
						</span>&nbsp;원
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
						<col width="20%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
						<col width="10%">
						<col width="15%">
						<thead>
							<tr><th>매장명</th><th>매장매출액</th><th>매장매입액</th><th>매장전화번호</th><th>점주명</th><th>담당직원</th><th>매장정보수정</th></tr>
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

	})
	
			
	function goDetail(frRegiNum){
		location.href="${path}/salesDetail.do?frRegiNum="+frRegiNum+"&frSchOrderdt="+frSchOrderdt+"&toSchOrderdt="+toSchOrderdt
	}

	
	
</script>
</html>