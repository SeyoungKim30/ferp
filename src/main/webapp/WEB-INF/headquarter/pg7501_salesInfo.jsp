<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>

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
   		 gap: 25px;
	}
	
	input[type=text]{
		height:30px;
	}
	
	.hdq_searchStandard{
		display:inline-flex;
		width: 80%;
		align-items: center; 
	    justify-content: space-between;
	    margin: 15px 0px;
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
		border-radius: 25px;
		border: white;
   		background: rgba( 204, 204, 204, 0.5 );
   		text-align: center;
   		color:#666666;
	}
	
</style>


<head>
<meta charset="UTF-8">
<title>본사-매장정보출력</title>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		
		
				<!-- 전체매장총매출출력칸 시작-->
				<div class="hdq_totalSalesPrt">
					<div>
					<h2>투썸플레이스 지난 달 총 매출&nbsp;&nbsp;&nbsp;&nbsp;
						<span>9@@@@@@00</span>&nbsp;원
					</h2>
					</div>
				</div>
				<!-- 전체매장총매출출력칸 끝-->
				
				
				<!-- 검색 시작 -->
				<div class="hdq_search">
					<form>
						<input id="storeSch" name=""  type="text" placeholder=" 매장명 입력"/>
						<input id="ownerSch" name=""  type="text" placeholder=" 점주명 입력"/>
						<input id="hdqmngSch" name=""  type="text" placeholder=" 담당직원 입력"/>
						<button class="frsalesSchBtn" type="submit">검색</button>
					</form>
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
						<form>
							<input id="strperiod" name="strperiod" type="month"/>
							~
							<input id="endperiod" name="endperiod" type="month"/>
					   <!-- <button value="hidden"></button> -->
							
						</form>
					</div>
				</div>
				
				<script>
				
					var today = new Date() 
					today.setDate(today.getMonth()-1)
					document.getElementById('strperiod').value=today.toISOString().slice(0,7); 
					document.getElementById('endperiod').value=today.toISOString().slice(0,7);
					//slice() 메소드를 이용하여 toISOString() 메소드로 받아온 현재 날짜 문자열의 7자리(앞에서부터)를 잘라옵니다.

					</script>
				<!-- 검색기준 끝 -->
				
				
				<!-- 정보출력표 시작 -->
				<div class="frs_salesInfo_print">
					<table>
						<thead>
							<tr><td>매장명</td><td>매장매출액</td><td>매장매입액</td><td>매장전화번호</td><td>점주명</td><td>담당직원</td><td>매장정보수정</td></tr>
						</thead>
						<tbody>
							<tr>
								<td>매장명</td><td>매장매출액</td><td>매장매입액</td><td>매장전화번호</td><td>점주명</td><td>담당직원</td>
								<td><span class="fr_uptBtn">수정</span><span class="fr_delBtn">삭제</span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 정보출력표 끝 -->
			

		
		</div>
	</div>
	
</body>
</html>