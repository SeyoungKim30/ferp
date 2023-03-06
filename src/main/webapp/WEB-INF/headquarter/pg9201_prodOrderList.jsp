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
	localStorage.setItem("eqIdx","9000")

	//지점 리스트(본사일때만??)
	function fetchStoreList(){
		let url ="${path}/selectActiveStoreJson.do"
		fetch(url).then(function(response){return response.json() }).then(function(json){
			makeOptions(json.storeList,'frName','frRegiNum','#storeList')
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
	
	<form id="searchform">
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
	<c:if test="${login.frRegiNum == 9999999999 }">
	<tr><th>주문일자</th><th>주문지점</th><th>담당자</th><th>상품</th><th>수량</th><th>본사 재고</th><th>배송상태</th><th>결제상태</th></tr>
	</c:if>
	
	<c:if test="${login.frRegiNum != 9999999999 }">
	<tr><th>주문일자</th><th>상품</th><th>수량</th><th>배송상태</th><th>결제상태</th></tr>
	</c:if>
</thead>
<tbody>

</tbody>
</table>

<div class="modal" id="modalByProd">
<div class="modal-dialog">

 <div class="modal-header">
        <h3 class="modal-title">상품별 수량</h3>
        <button class="btn-close">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16"><path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/></svg>
		완료
		</button>
      </div>
 <div class="modal-body">
<form id="orderStateForm">
<input name="orderNum">
<input name="orderDate">
<input name="demander">
<input name="supplier">담당자
<input name="productNum" placeholder="productNum">
<input name="orderState">
<input name="paymentState">
<input name="orderStateUpdate" placeholder="orderStateUpdate">
	<table><thead><th>자재코드</th><th>자재명</th><th>총 수량</th><th>상태 일괄 변경</th></thead>
	<tbody></tbody>
	</table>
</form>


</div>
</div>
</div>


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

//submit 비동기로 불러와서 표에 출력하기
const form1= document.querySelector('form')
form1.addEventListener('submit', (e) => {
    e.preventDefault();
    selectProdOrderListJson();
})


//fetch받아서 전체 목록 출력하고 상품별 수량 모달 만들기
function selectProdOrderListJson(){
   	let serial=$('#searchform').serialize()
 	var resultlist=[];
	fetch("${path }/productOrderListJson.do?"+serial)
		.then(function(response){return response.json() })
		.then(function(json){
			let htmls='';
			resultlist=json.list
			resultlist.forEach(function(each){
				console.log(each)
				htmls+=`<tr><td title="`+each.prodOrder.orderDate+`">`+each.prodOrder.orderDate.substr(0,10)
					+`</td><td title="`+each.prodOrder.demander+`">`+each.store.frName
					+`</td><td title="`+each.emp.empnum+`">`+each.emp.ename
					+`</td><td title="클릭하면 상품별 수량을 확인할 수 있습니다(`+each.prodOrder.productNum+`)">`+each.product.productName
					+`</td><td>`+each.prodOrder.amount
					+`</td><td>`+each.stock.remainAmount
					+`</td><td>`+each.prodOrder.orderState
					+`</td><td>`+each.prodOrder.paymentState
					+`</td></tr>`;
			})
			printTotalAmountbyProd(resultlist,(json.prodOrder.orderDate!=null||json.prodOrder.orderNum!=null));
		document.querySelector('tbody').innerHTML=htmls
		openModal();
		$('#modalByProd [name=orderNum]').val(json.prodOrder.orderNum)
		$('#modalByProd [name=orderDate]').val(json.prodOrder.orderDate)
		$('#modalByProd [name=demander]').val(json.prodOrder.demander)
		$('#modalByProd [name=supplier]').val(json.prodOrder.supplier)
		$('#modalByProd [name=productNum]').val(json.prodOrder.productNum)
		$('#modalByProd [name=orderState]').val(json.prodOrder.orderState)
		$('#modalByProd [name=paymentState]').val(json.prodOrder.paymentState)
		})
	.catch(function(err){console.log(err)})
}

//fetch함수 내부에서 실행시킴 
function openModal(){
	//모달 닫기버튼으로 닫기
	$('.btn-close').on('click',function(){
		$('#modalByProd').addClass('modal')
		$('#modalByProd').removeClass('modal-open')
	})
	//4번째 열 누르면 모달 열리게
	$('tr td:nth-child(4)').on('click',function(){
		$('#modalByProd').addClass('modal-open')
		$('#modalByProd').removeClass('modal')
	})
}

//fetch결과로 상품별 총 주문량 보여주기(모달에 출력)
function printTotalAmountbyProd(resultlist,isDaily){
	var jsonprodAmount=[]
	resultlist.forEach(function(each){
		let nullornot = jsonprodAmount.find(v => v.num === each.prodOrder.productNum)
		if(nullornot!=null){
			let amnt=nullornot.amount
			nullornot.amount= amnt+each.prodOrder.amount
		}else{
			let prodjson=new Object();
			prodjson.num = each.prodOrder.productNum;
			prodjson.name = each.product.productName;
			prodjson.amount=each.prodOrder.amount
			prodjson.orderState=each.prodOrder.orderState
			jsonprodAmount.push(prodjson)
		}
	})
	//여기까지 json 배열 생성한거, 아래서 출력하기
	let htmls='';
	jsonprodAmount.forEach(function(each){
		if(isDaily){
			htmls+=`<tr><td>`+each.num+`</td><td>`+each.name+`</td><td>`+each.amount+`</td><td title="조회한 조건에 따라 발주 상태가 변경됩니다."><button type="button" class="btn-primary btn-sm" id="`+each.num+`">배송중</button> <button type="button" class="btn-success btn-sm" id="`+each.num+`">배송완료</button></td></tr>`
		}else{
			htmls+=`<tr><td>`+each.num+`</td><td>`+each.name+`</td><td>`+each.amount+`</td><td>일자별 조회시 일괄변경 가능</td></tr>`
		}
	})
	$('#modalByProd tbody').html(htmls)
	$('#orderStateForm .btn-sm').on('click',function(){
		//fetchUpdate('#orderStateForm','${path}/updateOrderState.do?')
var _promise = function (param) {
  return new Promise(function (resolve, reject) {
    fetchUpdate('#orderStateForm', '${path}/updateOrderState.do?')
      .then(function(result) {
        resolve(result);
      })
      .catch(function(error) {
        reject(error);
      });
  });
};

_promise(true)
.then(function(result) {
  alert(`배송상태 변경 `+result);
})
.catch(function(error) {
  console.error(error);
});
		//alert(`배송상태 변경 `+fetchUpdateReturn)
		
		
	})
}


$(function(){
	//오늘 날짜 기본 입력
	$('[type=date]').val(new Date().toISOString().slice(0, 10));
	//로딩할때 날짜만 활성화되어있게
	$('[type=date]').trigger("click");

	//가맹점은 주문지점 담당자 선택 못하게
	if(${login.frRegiNum !=9999999999}){
		$("#noDisplayForStores").css("display","none")
		$('[name=demander]').val('${login.frRegiNum}')
	}
	//로딩하자마자 오늘거 리스트
	selectProdOrderListJson();
	
});
</script>
</body>
</html>