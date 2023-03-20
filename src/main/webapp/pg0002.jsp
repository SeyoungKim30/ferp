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
<link rel="stylesheet" href="${path}/resource/css/A2_jhCSS.css" />
<script type="text/javascript" src="${path }/resource/js/sy_fetchs.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style type="text/css">
.notice_top{
	display: flex;
	align-items: center;
}
.clerkPage2, .prev{
	display: none;
}
.next, .prev{
	position:relative;
	background-color:white;
	height: 50px;
    border: 1px solid #a4a4a4;
    top: 170px;
    right: -250px;
}
</style>
</head>
<script type="text/javascript">
	localStorage.setItem("pageIdx","0002")
	localStorage.setItem("eqIdx","0002")
	var arr = []
	
</script>
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
					<h3>매출</h3>
					<div class="boxes">
						<div>
						  <canvas id="myChart" height="200%"></canvas>
						</div>
					</div>
				</div>
				<div class="schedule">
					<div class="row">
						<h3>매장직원 : <span class="todayDate"></span>일</h3>
						<button type="button" class="next" onclick="goNext()">&gt;</button>
						<button type="button" class="prev" onclick="goPrev()">&lt;</button>
					</div>
						<div class="row clerkPage1">
							<div class="boxes-clerk">
								<c:forEach var="ct" items="${clerkToday }" begin="0" end="9">
									<div class="row">
										<div class="clerkOntime">${ct.clerkName }</div>
										<div class="clerkOntime">
											<c:if test="${ct.ontime != null && ct.offtime == null }"><span style="color:blue;">출근 : ${ct.ontime }</span></c:if>
											<c:if test="${empty ct.ontime }"><span style="color:red;">출근 전</span></c:if>
											<c:if test="${ct.offtime != null }"><span style="color:green;">퇴근 : ${ct.offtime }</span></c:if>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="boxes-clerk">
								<c:forEach var="ct" items="${clerkToday }" begin="10" end="19">
									<div class="row">
										<div class="clerkOntime">${ct.clerkName }</div>
										<div class="clerkOntime">
											<c:if test="${ct.ontime != null && ct.offtime == null }"><span style="color:blue;">출근 : ${ct.ontime }</span></c:if>
											<c:if test="${empty ct.ontime }"><span style="color:red;">출근 전</span></c:if>
											<c:if test="${ct.offtime != null }"><span style="color:green;">퇴근 : ${ct.offtime }</span></c:if>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="row clerkPage2">
							<div class="boxes-clerk">
									<c:forEach var="ct" items="${clerkToday }" begin="20" end="29">
										<div class="row">
											<div class="clerkOntime">${ct.clerkName }</div>
											<div class="clerkOntime">
												<c:if test="${ct.ontime != null && ct.offtime == null }"><span style="color:blue;">출근 : ${ct.ontime }</span></c:if>
												<c:if test="${empty ct.ontime }"><span style="color:red;">출근 전</span></c:if>
												<c:if test="${ct.offtime != null }"><span style="color:green;">퇴근 : ${ct.offtime }</span></c:if>
											</div>
										</div>
									</c:forEach>
							</div>
							<div class="boxes-clerk">
									<c:forEach var="ct" items="${clerkToday }" begin="30" end="39">
										<div class="row">
											<div class="clerkOntime">${ct.clerkName }</div>
											<div class="clerkOntime">
												<c:if test="${ct.ontime != null && ct.offtime == null }"><span style="color:blue;">출근 : ${ct.ontime }</span></c:if>
												<c:if test="${empty ct.ontime }"><span style="color:red;">출근 전</span></c:if>
												<c:if test="${ct.offtime != null }"><span style="color:green;">퇴근 : ${ct.offtime }</span></c:if>
											</div>
										</div>
									</c:forEach>
							</div>
						</div>
					
				</div>
				<div class="right">
					<button onclick="location.href='${path}/storeSet2.do'" class="refreshBtn"><span class="refreshText">⟲</span></button>
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
var todayDate = new Date().getDate()
$(".todayDate").text(todayDate)
<c:forEach var="sg" items="${salesGraph }">
	arr.push({tot:"${sg.tot}", orderdate:"${sg.orderdate}"})
</c:forEach>
	
const labels = [	
	(new Date(arr[6].orderdate).getMonth()+1)+"/"+new Date(arr[6].orderdate).getDate(),
	(new Date(arr[5].orderdate).getMonth()+1)+"/"+new Date(arr[5].orderdate).getDate(),
	(new Date(arr[4].orderdate).getMonth()+1)+"/"+new Date(arr[4].orderdate).getDate(),
	(new Date(arr[3].orderdate).getMonth()+1)+"/"+new Date(arr[3].orderdate).getDate(),
	(new Date(arr[2].orderdate).getMonth()+1)+"/"+new Date(arr[2].orderdate).getDate(),
	(new Date(arr[1].orderdate).getMonth()+1)+"/"+new Date(arr[1].orderdate).getDate(),
	(new Date(arr[0].orderdate).getMonth()+1)+"/"+new Date(arr[0].orderdate).getDate()
];
	var login = '${login.frRegiNum}'

const data = {
	labels: labels,
	datasets: [
		{
			backgroundColor: [ 
				'rgba(255, 99, 132,0.2)',
				'rgba(54, 162, 235,0.2)',
				'rgba(255, 206, 86,0.2)',
				'rgba(75, 192, 192,0.2)',
				'rgba(153, 102, 255,0.2)',
				'rgba(255, 159, 64,0.2)',
				'rgba(205, 69, 102,0.2)'
			],
			borderColor: [
				'rgba(255, 99, 132,1)',
				'rgba(54, 162, 235,1)',
				'rgba(255, 206, 86,1)',
				'rgba(75, 192, 192,1)',
				'rgba(153, 102, 255,1)',
				'rgba(255, 159, 64,1)',
				'rgba(205, 69, 102,1)'
			],
			borderWidth:2,
			data: [arr[6].tot,arr[5].tot,arr[4].tot,arr[3].tot,arr[2].tot,arr[1].tot,arr[0].tot],
		}
	]
};

const config = {
	type: 'bar',
	data,
	options: {
		plugins:{
            legend: {
                display: false
            }
        }
	}
};

const myChart = new Chart(
	document.getElementById('myChart'),
	config
);

function goNext(){
	$(".clerkPage1").css("display","none")
	$(".clerkPage2").css("display","flex")
	$(".next").css("display","none")
	$(".prev").css("display","inline-block")
}
function goPrev(){
	$(".clerkPage1").css("display","flex")
	$(".clerkPage2").css("display","none")
	$(".next").css("display","inline-block")
	$(".prev").css("display","none")
}
</script>
</html>