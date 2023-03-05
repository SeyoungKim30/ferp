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
<title>매장 상세 조회</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

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
	}
	span.strifo_header {
    	font-weight: 600;
    	width:87px;
	}	
	span.strifo_rslt{
		width:400px;
	}
	
	.period{
		display: flex;
	    margin: 0px 0px 15px 5px;
	    align-items: center;
	    gap: 30px;
	}
	#detail{
		margin: 40px 0px 15px 5px;
	}
	
	
	.salesResult{
		text-align: end;
    	display: inline-block;
    	font-size: 22px;
    	font-weight: 600;
    	float: right;
    	margin-top:20px;
		
	}
	.salesResult>div{
		display: flex;
		justify-content: space-between;
		margin: 2px 5px 2px 20px;
		gap:30px;
	}
	.salesResult>div>hr{
		margin: 2px 0px;
	}
	#lastResult{
		justify-content: end;
	}
	
</style>

</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		
			<h2>매장 상세 조회</h2><br><hr><br>
			
			<!-- 이전페이지가기 버튼-->
			<div id="backBtn">
			 &lt; 전체조회페이지
			</div>
			
			<!-- 그냥 불러오기 -->
			<!-- 매장정보출력 시작 -->
			<div class="storePrint">
				<h1>매장이름</h1>
				<div><span class="strifo_header">사업자번호</span><span>${dinfo.frRegiNum }</span></div>
				<div><span class="strifo_header">개업일자</span><span>${dinfo.frOpen }</span></div>
				<div><span class="strifo_header">매장주소</span><span class="strifo_rslt">${dinfo.frAddress }</span>&nbsp;<span class="strifo_header">전화번호</span><span>${dinfo.frtel }</span></div>
				<div><span class="strifo_header">점주</span><span class="strifo_rslt">${dinfo.frRepname }</span>&nbsp;<span class="strifo_header">담당직원</span><span>${dinfo.ename }</span></div>
			</div>
			<!-- 매장정보출력 끝-->
			
			<!-- json으로 불러오기 -->
			<!-- 매출조회 시작 -->
			<div class="period">
				<h2>매매액 조회 기간</h2>
				<form method="post">
					<input id="strperiod" name="frSchOrderdt" value="${sch.frSchOrderdt}" type="month"/>
					~
					<input id="endperiod" name="toSchOrderdt" value="${sch.toSchOrderdt}" type="month"/>
				</form>
			</div>
			<table class="storeSales_table">
				<thead>
					<tr><th>날짜</th><th>매장 매출액</th><th>매장 매입액</th><th>순수익</th></tr>
				</thead>
				<tbody>
					<tr><td>날짜</td><td>100000</td><td>100000</td><td>1000</td></tr>
					<tr><td>날짜</td><td>100000</td><td>100000</td><td>1000</td></tr>
					<tr><td>날짜</td><td>100000</td><td>100000</td><td>1000</td></tr>
				</tbody>
			</table>
			<!-- 매출조회 끝 -->
			
			
			<!-- 매출상세내역 시작 -->
			<h2 id="detail">조회기간 상세판매내역</h2>
			<table class="storeDetailSales_table">
				<thead>
					<tr><th>판매메뉴</th><th>가격</th><th>판매개수</th><th>총 판매액</th></tr>
				</thead>
				<tbody>
					<tr><td>아메리카노</td><td>40000</td><td>100000</td><td>4000000</td></tr>
					<tr><td>아메리카노</td><td>40000</td><td>100000</td><td>4000000</td></tr>
					<tr><td>아메리카노</td><td>40000</td><td>100000</td><td>4000000</td></tr>
					<tr><td>아메리카노</td><td>40000</td><td>100000</td><td>4000000</td></tr>
				</tbody>
			</table>
			<!-- 매출상세내역 끝 -->
			
			
			<!-- 결과값출력 시작 -->
			<div class="salesResult">
				<div><span>총 매출액</span><span>100000 원</span></div>
				<div><span>총 매입액</span><span>40000 원</span></div>
				<hr>
				<div id="lastResult"><span>총 수익 &nbsp;60000 원</span></div>
			</div>
			<!-- 결과값출력 끝 -->
			
		</div>
	</div>
</body>
<script type="text/javascript">

// https://wouldyou.tistory.com/21
/*
	//ajax fetch사용
	function print(){
		let url="${path}/salesInfoJson.do?frRegiNum="+frRegiNum+"&frSchOrderdt="+frSchOrderdt+"&toSchOrderdt="+toSchOrderdt  //검색값 넘기기
		console.log(url);
		
		fetch(url).then(function(response){return response.json()}).then(function(json){
			
			console.log(json);
			var dinfoList=json.sbslist;
			var trtd='';
		
			sbslist.forEach(function(each){
				trtd+="<tr><td>"+each.frname+"</td><td>"+each.frsales+"</td><td>"+each.frpurchase+"</td><td>"+each.frtel+"</td><td>"+each.frRepname+"</td><td>"+each.ename+"</td><td class='frt_last_culmm'><span class='fr_uptBtn'>수정</span><span class='fr_delBtn'>삭제</span></td></tr>"
			})
			$("table tbody").html(trtd);
			
		}).catch(function(err){console.log(err)})	
	
	}
*/
</script>
</html>