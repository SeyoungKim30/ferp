<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="login" value="fakeID1111" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주목록 조회</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />

</head>

<script type="text/javascript">
	localStorage.setItem("pageIdx","9201")
	localStorage.setItem("eqIdx","3")

	//지점 리스트(본사일때만??)
	function fetchStoreList(){
		let url ="${path}/selectActiveStoreJson.do"
		fetch(url).then(function(response){return response.json() }).then(function(json){
			let storeList=json.storeList;
			let options='';
			storeList.forEach(function(each){
				options+=`<option label='`+each.frName +`' value='`+each.frRegiNum+`'>`;
			})
			$("#storeList").html(options);
	 	}).catch(function(err){console.log(err)})
	}

	//담당자 리스트
	var empList=[];
	
	//상품리스트
	var empList=[];

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
	<div class="toolbox">
	
	<h3>조회 기간 선택</h3>
	<div class="toolbar" title="단일 주문일자,월별 조회, 발주번호 중 하나의 조건을 입력하세요">
		<div><label>주문일자 <input type="date" name="orderDate" required></label><label>월별 조회 <input type="month" name="orderDate" required></label>
			<label title="발주번호를 검색조건으로 사용합니다">발주번호<input placeholder="발주번호로 검색" name="orderNum" required></label>
		</div>
	</div>
	<h3>조건으로 검색</h3>
	<div class="toolbar" title="조건은 다중적용이 가능합니다">
	<div>
		<label>주문지점<input name="demander" list="storeList"></label><datalist id="storeList"></datalist>
		<label>담당자<select><option>김물류</option><option>전체 보기</option></select></label>
		<label>상품 선택<select name="productNum"><option>전체 보기</option><option>에티오피아1kg</option><option>딸기</option><option>매일우유 바리스타 1L*10</option></select></label>
		<label>발주상태<select><option>전체 보기</option><option>요청</option><option>준비</option><option>배송</option><option>완료</option><option>조정</option><option>취소완료</option></select></label>
		<label>결제상태<select><option>전체 보기</option><option>정산전</option><option>청구</option><option>계산서 발행</option><option>완료</option></select></label>
	</div>
	<input type="submit" class="btn-secondary" value="발주 조회">
	</div>
	</div>

<table>
<thead>
<tr><th>주문일자</th><th>주문지점</th><th>상품</th><th>수량</th><th>본사 재고</th><th>상태 <button>전체 체크</button></th></tr>
</thead>
<tbody>
<tr><td>2023-02-18</td><td>홍대입구9번출구점</td><td>에티오피아1kg</td><td>12</td><td>170</td><td>배송전 <button>배송체크</button></td></tr>
<tr><td>2023-02-18</td><td>홍대입구9번출구점</td><td>매일우유 1L*5</td><td>14</td><td>20</td><td>배송전 <button>배송체크</button></td></tr>
<tr><td>2023-02-18</td><td>홍대입구9번출구점</td><td>딸기5kg(음료용)</td><td>24</td><td>19</td><td>배송전 <button>배송체크</button></td></tr>

</tbody>
</table>
		
	

		</div>
	</div>
	
	
<script>
$('[type=date]').val(new Date().toISOString().slice(0, 10));
$('.toolbar').first().find('label').each(function(){
	$(this).on('click',function(){
		$('.toolbar').first().find('label').each(function(){
			$(this).find('input').attr("disabled",true);
		})
		$(this).find('input').attr("disabled",false);
		$(this).find('input').focus();
	})
})
	</script>
</body>
</html>