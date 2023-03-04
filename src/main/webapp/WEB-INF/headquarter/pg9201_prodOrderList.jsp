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
<title>발주목록 조회</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<script type="text/javascript" src="${path }/resource/js/sy_fetchs.js"></script>
</head>

<script type="text/javascript">
	localStorage.setItem("pageIdx","9201")
	localStorage.setItem("eqIdx","2")

	//지점 리스트(본사일때만??)
	function fetchStoreList(){
		let url ="${path}/selectActiveStoreJson.do"
		fetch(url).then(function(response){return response.json() }).then(function(json){
			makeAccountOption(json.storeList,'frName','frRegiNum','#storeList')
	 	}).catch(function(err){console.log(err)})
	}

	//담당자 리스트
	var empList=[];
	
	//상품리스트
	var prodList=[];

$(document).ready(function(){
	fetchStoreList();
})	
</script>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
	<h2>발주 조회</h2>
	<hr>
	<br>
	<div class="toolbox">
	
	<form>
	<h3>조회 기간 선택</h3>
	<div class="toolbar" title="단일 주문일자,월별 조회, 발주번호 중 하나의 조건을 입력하세요">
		<div>
			<label>주문일자 <input type="date" name="orderDate" required></label>
			<label>월별 조회 <input type="month" name="orderDateMonth" required></label>
			<label title="발주번호를 검색조건으로 사용합니다">발주번호<input placeholder="발주번호로 검색" name="orderNum" required></label>
		</div>
	</div>
	<h3>조건으로 검색</h3>
	<div class="toolbar" title="조건은 다중적용이 가능합니다">
	<div>
	<fieldset id="noDisplayForStores">
		<label>주문지점<input name="demander" list="storeList"></label><datalist id="storeList"></datalist>
		<label>담당자<input name="supplier"></label>
	</fieldset>
		<label>상품 선택<input name="productNum"></label>
		<label>발주상태<select name="orderState"><option value="">전체 보기</option><option>요청</option><option>준비</option><option>배송</option><option>완료</option><option>조정</option><option>취소완료</option></select></label>
		<label>결제상태<select name="paymentState"><option value="">전체 보기</option><option>정산전</option><option>청구</option><option>계산서 발행</option><option>완료</option></select></label>
	</div>
	<button class="btn-secondary">발주조회</button>
	</div>
	</form>
	</div>

<table>
<thead>
<tr><th>주문일자</th><th>주문지점</th><th>담당자</th><th>상품</th><th>수량</th><th>본사 재고</th><th>배송상태 <button class="btn-sm btn-dark">전체 완료</button></th><th>결제상태</th></tr>
</thead>
<tbody>

</tbody>
</table>
		
	

		</div>
	</div>
	
	
<script>

//셋 중 하나만 입력할 수 있게
$('.toolbar').first().find('label').each(function(){
	$(this).on('click',function(){
		$('.toolbar').first().find('label').each(function(){
			$(this).find('input').attr("disabled",true);
		})
		$(this).find('input').attr("disabled",false);
		$(this).find('input').focus();
	})
})


//오늘 날짜 기본 입력
$('[type=date]').val(new Date().toISOString().slice(0, 10));
//로딩할때 날짜만 활성화되어있게
$('[type=date]').trigger("click");

//가맹점은 주문지점 담당자 선택 못하게
if(${login.frRegiNum !=9999999999}){
	$("#noDisplayForStores").css("display","none")
	$('[name=demander]').val('${login.frRegiNum}')
}
//submit 비동기로 불러와서 표에 출력하기

const form1= document.querySelector('form')
form1.addEventListener('submit', (e) => {
    e.preventDefault();
    selectProdOrderListJson();
})

function selectProdOrderListJson(){
   	let serial=$('form').serialize()
   	console.log(serial)
	fetch("${path }/productOrderListJson.do?"+serial)
		.then(function(response){return response.json() })
		.then(function(json){
			let htmls='';
			json.list.forEach(function(each){
				console.log(each)
				htmls+=`<tr><td title="`+each.prodOrder.orderDate+`">`+each.prodOrder.orderDate.substr(0,10)
					+`</td><td title="`+each.prodOrder.demander+`">`+each.store.frName
					+`</td><td title="`+each.emp.empnum+`">`+each.emp.ename
					+`</td><td title="`+each.prodOrder.productNum+`">`+each.product.productName
					+`</td><td>`+each.prodOrder.amount
					+`</td><td>`+each.stock.remainAmount
					+`</td><td>`+each.prodOrder.orderState+` <button class="btn-dark btn-sm">배송완료</button>`
					+`</td><td>`+each.prodOrder.paymentState+` <button class="btn-dark btn-sm">결제완료</button>`
					+`</td></tr>`;
			})
		document.querySelector('tbody').innerHTML=htmls
		})
	.catch(function(err){console.log(err)})
}

	</script>
</body>
</html>