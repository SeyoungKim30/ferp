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
<title>담당 매장 점검</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />

<style>
	/*매장사이드바*/
	ul#storeSideBar{
		list-style-type:none;
		width:300px;
		padding:0;
		margin:0;
		position:fixed;
		height:100%;
		overflow:auto;
		border-top: 2px solid #525252;
	}
	.inchrgStore{
		display:block;
		background-color:#DDD;
		padding:8px 15px;
		font-weight:600;
		font-size:20px;
		border: 2px solid #525252;
		border-top: none;
		border-right: none;
		margin: 10px 0;
	}
	.inchrgStore:hover{
		background-color: #BDBDBD;
		cursor:pointer;
	}
	.inchrgStore:focus{
	/*
		box-shadow: 0 0 0 .2rem rgba(189, 189, 189, .5)
	*/	
		box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .5)
	}
	
	
	div#thatStrInspctList{
		border: 2px solid #525252;
		position:fixed;
		margin-left: 298.5px;
		padding:30px 20px;
		height: 60%;
    	width: 54%;
    	min-width: 700px;
		
	}
	
	
	/* 이번달배정일 */
	#thisMonthInspect{
		background-color:#75B9EE;
		font-size:25px;
		font-weight: 600;
		display:flex;
		justify-content: space-between;
		text-align: center;
		vertical-align: middle;
		height: 60px;
		line-height:60px;
   		border-radius: 10px;
    	width: 90%;
    	min-width:600px;
    	padding: 10px 60px;
    	margin: 0 auto;

	}
	#thisMonthInspect>div{
		align-self: center;
	}
	.assignDt{
		padding-left:20px;
		font-weight:800;
		font-size:30px;
	}
	.btn-primary{
		width:70px;
		height:35px;
		line-height: 35px;
		border-radius:10px;
	}
	
	
	
	
	#pastInsepctList{
		display:inline-block;
		margin-top: 30px;
    	font-size: 20px;
    	font-weight: 600;
	}
	
	.pastInsepctRecord{
		display:flex;
		justify-content: space-between;
		text-align: center;
		vertical-align: middle;
	}
	

</style>


</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
			
			<h2>이달의 점검결과 조회</h2><br><hr><br>
			
			<!-- 왼쪽 사이드 바 시작 -->
			<ul id="storeSideBar">
				<c:forEach var="ics" items="${icStrlist}">
					<li onclick="strQAInfo('${ics.frRegiNum}')"><div class="inchrgStore">${ics.frName }</div></li>
				</c:forEach>
								
			</ul>
			<!-- 왼쪽 사이드 바 끝 -->
			
			
			<!-- 해당 매장점검일 목록 시작  -->
			<div id="thatStrInspctList">
				
				
				<!-- 이번달점검일안내 -->
				<div id="thisMonthInspect">
					<!--  
					<div>이번 달 점검일</div> 
					<div class="assignDt">2023.03.02</div> 
					<div class="btn-primary">등록</div>
					-->
				</div>
				
				<!-- 지난점검일조회 -->
				<div id="pastInsepctList">
					<h3>조회하려는 담당매장을 선택하세요</h3>
					<!--  
					<div class="pastInsepctRecord">
						<div class="pIspctDt">2023년 1월</div>
						<div class="pIspctAssignDt">배정일&nbsp;2023.01.23</div>
						<div class="pIspctRegDt">등록일&nbsp;2023.01.25</div>
						<div class="pIspctRslt">19/20</div>
						<div>조회</div>
					</div>
					<div class="pastInsepctRecord">
						<div class="pIspctDt">2023년 1월</div>
						<div class="pIspctAssignDt">배정일&nbsp;2023.01.23</div>
						<div class="pIspctRegDt">등록일&nbsp;2023.01.25</div>
						<div class="pIspctRslt">19/20</div>
						<div>조회</div>
					</div>
					-->
				
				</div>
			
			
			</div>
			<!-- 해당 매장점검일 목록 끝 -->
			
		</div>
	</div>
</body>

<script>
	function strQAInfo(frRegiNum){
		
		let url="${path}/InchargeStrQA.do"
			
			fetch(url).then(function(response){return response.json()}).then(function(json){
				
				var firstJs=json.sQAinfo[0]; //첫째행만 따로 출력
				console.log("firstJs   "+firstJs)
				/*
				
				var thisDiv="<div>이번 달 점검일</div><div class='assignDt'>2023.03.02</div><div onclick='goInspect("")' class='btn-primary'>등록</div>"	
				
				*/
				$("#thisMonthInspect").html(thisDiv)
				var sQAinfo=json.sQAinfo.slice(1);
				var divs='';
				
				sQAinfo.forEach(function(each){		
					divs+="<div class='pastInsepctRecord'>"
						+"<div class='pIspctDt'>"+each.inspectDte+"</div>"
						+"<div class='pIspctAssignDt'>배정일&nbsp;"+each.inspectDte+"</div>"
						+"<div class='pIspctRegDt'>등록일&nbsp;"+each.regDte+"</div>"
						+"<div class='pIspctRslt'>"+each.ycnt+"/"+each.qncnt+"</div>"
						+"<div class='btn-secondary'>조회</div></div>"				
				})
				$("#pastInsepctList").html(divs);
				
			}).catch(function(err){console.log(err)})	
		
	}
	
	
	// 지난달 점검결과조회페이지는 모달로 만들고
	// 등록은 페이지 이동할까

</script>
</html>