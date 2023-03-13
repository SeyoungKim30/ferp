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
<script type="text/javascript" src="${path }/resource/js/sy_fetchs.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style type="text/css">
.notice_top{
	display: flex;
	align-items: center;
}
</style>
</head>
<script type="text/javascript">
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
					<h3>- 매출</h3>
					<div class="boxes">
						<div>
						  <canvas id="myChart" height="200%"></canvas>
						</div>
					</div>
				</div>
				<div class="schedule">
					<h3>- 담당매장</h3>
					<div class="boxes">
						<div>
							<c:forEach var="sg" items="${salesGraph }">
								<script type="text/javascript">
									
								</script>
							</c:forEach>
						</div>
					</div>
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
<c:forEach var="sg" items="${salesGraph }">
	arr.push({tot:"${sg.tot}", orderdate:"${sg.orderdate}"})
</c:forEach>
	console.log(arr)
	console.log(arr[0].tot)
	console.log(arr[0].orderdate)
	console.log(new Date(arr[0].orderdate).getMonth()+1)
	console.log(new Date(arr[0].orderdate).getDate())
	
const labels = [	
	(new Date(arr[6].orderdate).getMonth()+1)+"/"+new Date(arr[6].orderdate).getDate(),
	(new Date(arr[5].orderdate).getMonth()+1)+"/"+new Date(arr[5].orderdate).getDate(),
	(new Date(arr[4].orderdate).getMonth()+1)+"/"+new Date(arr[4].orderdate).getDate(),
	(new Date(arr[3].orderdate).getMonth()+1)+"/"+new Date(arr[3].orderdate).getDate(),
	(new Date(arr[2].orderdate).getMonth()+1)+"/"+new Date(arr[2].orderdate).getDate(),
	(new Date(arr[1].orderdate).getMonth()+1)+"/"+new Date(arr[1].orderdate).getDate(),
	(new Date(arr[0].orderdate).getMonth()+1)+"/"+new Date(arr[0].orderdate).getDate()
];

const data = {
	labels: labels,
	datasets: [
		{
			label: '${login.frName}',
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
</script>
</html>