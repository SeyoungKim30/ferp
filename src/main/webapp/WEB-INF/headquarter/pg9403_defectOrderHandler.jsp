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
<style>
[type=checkbox]{
width:1.3em;
height: 1.3em;
}
h4{
vertical-align: bottom;
padding:0px;
margin:0px;
}
</style>
<script type="text/javascript">
	localStorage.setItem("pageIdx","9403")
	localStorage.setItem("eqIdx","9000")
</script>
</head>

<body class="container">
	%@ include file="/resource/templates/header.jsp"%
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
		<label>처리상태<select name='state'><option value="">전체 보기</option><option>대기</option>	<option>처리중</option><option>완료</option><option>취소</select></label>
		<label>처리방식<select name='methods'><option value="">전체 보기</option><option>재배송</option><option>환불</option></select></label>
	</div>
	<button>조회</button>	
</form>
</div>		

<table>
<thead>
<tr><th>신청일자</th><th>발주신청일자</th><th>신청지점</th><th>해당상품</th><th>종류</th><th>처리방식</th><th>처리상태</th></tr>
</thead>
<tbody>

</tbody>
</table>


		</div>
	</div>
	
	
<div class="modal" id='modal'><div class="modal-dialog">
<div class="modal-header"><h2 class="modal-title">불량신청건 처리</h2><button class="btn-close">&nbsp; &nbsp;</button></div>
<div class="modal-body">
<form action="${path }/updateDefectOrder.do" method="post">
	<h4>신청 상태 조정</h4>
	<div class="toolbar">
		<div><ul>
			<li>신청번호 : <span id="defNum"></span><input name='defNum' type="hidden">
			<li>신청일 : <span id="applyDate"></span>
			<li>신청지점 : <span id='frName'></span><input name='frRegiNum' type="hidden">
			<li>해당자재 : <span id='productName'></span> <input name='productNum' type="hidden">
			
		</ul></div>
		<div><ul>
			<li>종류 : <span id='type'></span>
			<li>처리방식 : <span id='methods'></span>
			<li>처리상태 <select name='state'><option>처리중</option><option>완료</option><option>취소</option></select>
		</ul></div>
	</div>

	<h4><label><input type="checkbox" checked class='stockbar'>자재 수량 조정</label></h4>
	<div class="toolbar stockbar">

		<div><label>재고변경일자<input name="stockDate" type="date"></label>
		<label>적용수량<input name="applyAmount"></label>
		<label>비고<input name="remark"></label></div>
	</div>
	<h4><label><input type="checkbox" checked class='prodOrderbar'>발주 기록 수정</label></h4>
	<div class="toolbar prodOrderbar"><div>
		<div><label>발주번호<input name='orderNum' readonly></label>
		<label>발주신청일자<input name='orderDate' readonly></label></div>
		<div><label>수량<input name="amount"></label>
		<label>발주상태<input name="orderState"></label>
		<label>비고<input name="remark"></label></div>
	</div></div>
	<button class="btn-primary">등록하기</button>
</form>
</div></div></div>


<script type="text/javascript">

/* document.querySelector('[type=checkbox].stockbar').addEventListener('change',function(self){
	console.log(self)
})
 */
function checkdis(param){
 	var selecter='.toolbar.'+param+' input, .toolbar.'+param+' select'
	var checkbox=document.querySelector('[type=checkbox].'+param)
	checkbox.addEventListener('change',function(){
		if(checkbox.checked==true){
			$(selecter).attr('disabled',false)
		}else{
			$(selecter).attr('disabled',true)
		}
	})
}
checkdis('stockbar')
checkdis('prodOrderbar')

function filltheform(dpslist){
	$('.modalOpen').on('click',function(){
		var idindex=$(this).attr('id')
		console.log(dpslist[idindex])
		$('#modal #defNum').text(dpslist[idindex].defectOrder.defNum)
		$('#modal #applyDate').text(dpslist[idindex].defectOrder.applyDate)
		$('#modal [name=defNum]').val(dpslist[idindex].defectOrder.defNum)
		$('#modal [name=frRegiNum]').val(dpslist[idindex].defectOrder.frRegiNum)
		$('#modal #frName').text(dpslist[idindex].store.frName)
		$('#modal #productName').text(dpslist[idindex].product.productName)
		$('#modal [name=productNum]').val(dpslist[idindex].defectOrder.productNum)
		$('#modal #type').text(dpslist[idindex].defectOrder.type)
		$('#modal #methods').text(dpslist[idindex].defectOrder.methods)
		$('#modal [name=orderNum]').val(dpslist[idindex].defectOrder.orderNum)
		$('#modal [name=orderDate]').val(dpslist[idindex].defectOrder.orderDate)	
	})
}

function search(){
	fetchSelectPromise("#searchForm","${path }/selectDefectOrderJSON.do?").then(function(result){
		var dpslist=result.list
		var htmls='';
		for(let i=0;i<dpslist.length;i++){
			htmls+='<tr><td>'+dpslist[i].defectOrder.applyDate.substr(0,10)
			+'</td><td>'+dpslist[i].defectOrder.orderDate.substr(0,10)
			+'</td><td>'+dpslist[i].store.frName
			+'</td><td>'+dpslist[i].product.productName
			+'</td><td>'+dpslist[i].defectOrder.type
			+'</td><td>'+dpslist[i].defectOrder.methods
			+'</td><td>'+dpslist[i].defectOrder.state+` <button class='modalOpen' id='`+i+`'>변경</button>`
			+'</td></tr>'
		}
		document.querySelector('tbody').innerHTML=htmls;
		openModal('#modal','.modalOpen')	//모달 오픈 이벤트 할당
		filltheform(dpslist)
	}).catch(function(error){console.error(error);}
)}


const searchForm = document.querySelector('#searchForm');
searchForm.addEventListener('submit', function(e){
    e.preventDefault();	//submit 방지
    search();
})

$('[type=date]').val(new Date().toISOString().slice(0, 10));
fetchActiveList()
</script>
	
</body>
</html>