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
<title>배송 불량 신청 관리</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<script type="text/javascript" src="${path }/resource/js/sy_fetchs.js"></script>
<script type="text/javascript" src="${path }/resource/js/sy_modal.js"></script>
<script type="text/javascript">
	localStorage.setItem("pageIdx","9403")
	localStorage.setItem("eqIdx","9000")
</script>
</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
<h2>배송 불량 신청 관리</h2><hr>	<br>
<div class="toolbar">
<form id="searchForm">
	<div>
		<label>조회시작 신청일<input name='applyDate' type='date' required value='${defectOrder.applyDate }'></label>
		<label>조회종료 신청일<input name='orderDateMonth' type='date' value='${defectOrder.orderDateMonth }'></label>
		<label>신청번호<input name='defNum' value='${defectOrder.defNum}'></label>
		<label title="사업자번호를 입력하세요">주문지점<input name='frRegiNum' list="storeList" value='${defectOrder.frRegiNum}'></label><datalist id='storeList'></datalist>
		<label title="사원번호를 입력하세요">담당자<input name='category' list="empList" value='${defectOrder.category }'></label><datalist id='empList'></datalist>
		<label>처리상태<select name='state'><option value="">전체 보기</option><option>처리 대기</option>	<option>처리중</option><option>처리 완료</option></select></label>
		<label>처리방식<select name='methods'><option value="">전체 보기</option><option>재배송</option><option>환불</option></select></label>
	</div>
	<button>조회</button>	
</form>
</div>		

<table>
<thead>
<tr><th>신청일자</th><th>주문일자</th><th>신청지점</th><th>해당상품</th><th>종류</th><th>처리방식</th><th>처리상태</th></tr>
</thead>
<tbody>

</tbody>
</table>


		</div>
	</div>
	
	
<div class="modal" id='modal'><div class="modal-dialog">
<div class="modal-header"><h3 class="modal-title">불량신청건 처리</h3><button class="btn-close">&nbsp; &nbsp;</button></div>
<div class="modal-body">
<form>
	<div class="toolbar">
		<label>신청번호<input name='defNum' readonly="readonly"></label>
		<label>상품번호<input name='defNum' readonly="readonly"></label>
		<label>처리상태<select name='state'><option>처리 대기</option><option>처리중</option><option>처리 완료</option></select></label>
		<label>처리방식<select name='methods'><option>재배송</option><option>환불</option></select></label>
	</div>
	
	<button class="btn-primary">등록하기</button>
</form>
</div></div></div>

<script type="text/javascript">
openModal('#modal','.modalOpen')
$('[type=date]').val(new Date().toISOString().slice(0, 10));
fetchActiveList()

const searchForm = document.querySelector('#searchForm');
searchForm.addEventListener('submit', function(e){
    e.preventDefault();	//submit 방지
	fetchSelectPromise("#searchForm","${path }/defectOrderHandler.do?").then(function(result){
		console.log(result)
	}).catch(function(error){console.error(error);})
})
</script>
	
</body>
</html>