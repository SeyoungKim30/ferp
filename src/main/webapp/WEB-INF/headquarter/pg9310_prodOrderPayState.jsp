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
<title>발주 정산</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<script type="text/javascript" src="${path }/resource/js/sy_fetchs.js"></script>
<style>
.main_wrapper td:nth-child(3),.main_wrapper td:nth-child(7),.main_wrapper td:nth-child(8){
	text-align:center;
}
.main_wrapper td:nth-child(4),.main_wrapper td:nth-child(5),.main_wrapper td:nth-child(6){
	text-align:right;
}
</style>

<script>
window.addEventListener('load',function(){
	fetchStoreList();
	$('[type=month]').val(new Date().toISOString().slice(0, 7));
})
</script>
</head>
<body class="container">
<script>
localStorage.setItem("pageIdx","9310")
localStorage.setItem("eqIdx","9000")
</script>
<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		<h2>발주 정산</h2><hr>	<br>


<form id="searchform">
	<div class="toolbar">
		<div>
		<label>시작월<input type="month" name="orderDateMonth" required></label>
		<label>종료월<input type="month" name="orderDate"></label>
		<label>주문지점<input name="demander" list="storeList"></label><datalist id="storeList"></datalist>
		<label>담당자<input name="supplier"></label>
		<label>결제상태<select name="paymentState"><option value="">전체 보기</option><option>정산전</option><option>청구</option><option>계산서 발행</option><option>완료</option></select></label>
		</div>
		<button class="btn-secondary">조회</button>
	</div>
</form>

<table>
<thead><tr>
<th>정산월</th><th>거래지점</th><th>담당자</th><th>공급가액</th><th>부가세</th><th>합계금액</th><th>결제상태</th><th>변경</th>
</tr></thead>
<tbody></tbody>
<tfoot></tfoot>
</table>


		</div>
	</div>
	
	
	<form id="updateForm" style="display: none;">
	<input name="orderDateMonth">
	<input name="demander">
	<input name="paymentState">
	</form>
	
<form id='prodOrderPayDetail' action="${path }/prodOrderPayDetail.do" method="post" style="display: none;">
<input name="demander" required>
<input name="orderDateMonth" type="month" required>
</form>


<script>
//form ajax로 제출해서 테이블에 출력하기
const form1= document.querySelector('#searchform')
form1.addEventListener('submit', function(e){
    e.preventDefault();	//submit 방지
	fetchSelectPromise("#searchform","${path }/selectProdOrderPayState.do?").then(function(result){
		let thislist=result.list
		thislist.sort((a, b) => (a.prodOrder.orderDateMonth > b.prodOrder.orderDateMonth) ? 1 : -1);
		let htmls='';
		let totalprice=0;
		let totaltax=0;
		thislist.forEach(function(each){
			let whichbuttonshouldiprint=''
			switch(each.prodOrder.paymentState){
				case '정산전' : whichbuttonshouldiprint=`<button id='`+each.store.frRegiNum+` `+each.prodOrder.orderDateMonth+`' class='btn-success'>청구</button>`;break;
				case '청구' : whichbuttonshouldiprint=`<button id='`+each.store.frRegiNum+` `+each.prodOrder.orderDateMonth+`' class="btn-warning">계산서 발행</button>`;break;
				case '계산서 발행' : whichbuttonshouldiprint=`<button id='`+each.store.frRegiNum+` `+each.prodOrder.orderDateMonth+`' class="btn-primary">완료</button>`;break;
				case '완료' : whichbuttonshouldiprint=`<button id='`+each.store.frRegiNum+` `+each.prodOrder.orderDateMonth+`' class='btn-danger'>취소</button>`;break;	}
			htmls+=`<tr><td title='클릭하면 정산서 조회 페이지로 이동합니다' id='`+each.store.frRegiNum+` `+each.prodOrder.orderDateMonth+`'>`+each.prodOrder.orderDateMonth
			+`</td><td title='클릭하면 정산서 조회 페이지로 이동합니다' id='`+each.store.frRegiNum+` `+each.prodOrder.orderDateMonth+`'>`+each.store.frName
			+`</td><td id="`+each.emp.ename+`">`+each.emp.ename
			+`</td><td>`+(each.product.price).toLocaleString()
			+`</td><td>`+Number(each.product.remark).toLocaleString()
			+`</td><td>`+(Number(each.product.price)+Number(each.product.remark)).toLocaleString()
			+`</td><td>`+each.prodOrder.paymentState
			+`</td><td>`+whichbuttonshouldiprint
			+`</td></tr>`
		totalprice+=Number(each.product.price);
		totaltax+=Number(each.product.remark);
		})
		document.querySelector('tbody').innerHTML=htmls;
		document.querySelector('tfoot').innerHTML=`<tr class="table-active"><th>총 공급가액</th><td>`+totalprice.toLocaleString()+`</td><th>총 부가세액</th><td>`+totaltax.toLocaleString()
		+`</td><th>총 합계금액</th><td>`+(totaltax+totalprice).toLocaleString()
		+`</td><th>`+result.prodOrder.orderDate+`<br>일괄 변경</th><td><button id='0000000000 `+result.prodOrder.orderDate+`' class="btn-sm btn-success">청구</button> `
		+` <button id='0000000000 `+result.prodOrder.orderDate+`' class="btn-sm btn-warning">계산서 발행</button></td></tr>`;
		$('tbody').find('button').on('click',updateClick)
		$('tfoot').find('button').on('click',updateAllClick)
		$('tbody').find('tr td:nth-child(1)').on('click',goDetail)
		$('tbody').find('tr td:nth-child(2)').on('click',goDetail)
	}).catch(function(error){console.error(error);})
})

function updateClick(){	//fetch하고 테이블에 있는 버튼에 적용
	let newstate=$(this).text()
	if(newstate!='취소'){
		document.querySelector('#updateForm [name=paymentState]').value = newstate;
	}else{
		document.querySelector('#updateForm [name=paymentState]').value = '계산서 발행';
	}
	document.querySelector('#updateForm [name=demander]').value = $(this).attr('id').substr(0,10)
	document.querySelector('#updateForm [name=orderDateMonth]').value = $(this).attr('id').substr(11,13)
	fetchUpdatePromise('#updateForm',"${path}/updateProdOrderPayState.do?").then(result=>{alert(result);}).catch(reject=>{console.error(reject)})
	//업뎃하고 새로고침
	$('#searchform .btn-secondary').trigger('click');
	}
	
function updateAllClick(){	//fetch하고 테이블에 있는 버튼에 적용
	let yyyymm=$(this).attr('id').substr(11,13)
	document.querySelector('#updateForm [name=paymentState]').value = $(this).text();
	document.querySelector('#updateForm [name=demander]').value = $(this).attr('id').substr(0,10)
	document.querySelector('#updateForm [name=orderDateMonth]').value = yyyymm
	let gogo=confirm(yyyymm.substr(0,4)+'년 '+yyyymm.substr(5,6)+'월 전체 정산상태를 변경할까요?');
	if(gogo){
		fetchUpdatePromise('#updateForm',"${path}/updateProdOrderPayState.do?").then(result=>{alert(result);}).catch(reject=>{console.error(reject)})
		//업뎃하고 새로고침
		 $('#searchform .btn-secondary').trigger('click');
	}else{return false;}
	}
	
function goDetail(){	//정산서 보러 가기
	let yyyymm=$(this).attr('id').substr(11,13)
	document.querySelector('#prodOrderPayDetail [name=demander]').value = $(this).attr('id').substr(0,10)
	document.querySelector('#prodOrderPayDetail [name=orderDateMonth]').value = yyyymm
	document.querySelector('#prodOrderPayDetail').submit();
}
</script>	
</body>
</html>