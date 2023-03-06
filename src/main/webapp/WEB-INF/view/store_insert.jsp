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
<title>매장정보 등록</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="/ferp/resource/css/store_insert.css"/>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>
</head>
<script type="text/javascript">
	localStorage.setItem("pageIdx","4001")
	localStorage.setItem("eqIdx","3")
</script>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
    	    <h2 class="insert_product">매 장 정 보 등 록</h2>
        	<div class="content">
        	<form method="post">
				<div class="first_line">
					<h3 class="store_num">사업자번호</h3>
					<h3 class="store_pass">비밀번호</h3>
				</div>
				<div class="second_line">
					<input type="text" name="frRegiNum" placeholder="사업자번호 입력">
					<input type="text" name="frPass" placeholder="비밀번호 입력">
				</div>
				<div class="third_line">
					<h3 class="store_name">매장명</h3>
					<h3 class="store_open">오픈시간</h3>
					
				</div>
				<div class="fourth_line">
					<input type="text" name="frName" placeholder="매장명 입력">
					<input type="text" name="frOpen" placeholder="오픈시간 입력">
				</div>
				<div class="fifth_line">
					<h3 class="store_opertime">운영시간</h3>
					<h3 class="store_closeDte">휴무일</h3>
					
				</div>
				<div class="sixth_line">
					<input type="text" name="frOperTime" placeholder="운영시간 입력">				
					<input type="text" name="frClosedDte" placeholder="휴무일 입력">

				</div>
				<div class="seventh_line">
					<h3 class="store_repName">대표자명</h3>
					<h3 class="store_tel">전화번호</h3>
					
				</div>
				<div class="eighth_line">
					<input type="text" name="frRepName" placeholder="대표자명 입력">				
					<input type="text" name="frTel" placeholder="전화번호 입력">

				</div>	
				<div class="ninth_line">
					<h3 class="store_eno">담당직원</h3>
					<h3 class="store_address">주소</h3>
				</div>
				<div class="tenth_line">
					<select name="eno">
						<option disabled="disabled" selected="selected">담당직원 선택</option>
						<c:forEach var="emp" items="${empCombo}">
							<option value="${emp.eno}">${emp.ename}</option>
						</c:forEach>
					</select>				
					<input type="text" name="frAddress" placeholder="주소 입력">
				</div>					
						
				<div class="submit_line">
					<button type="button" class="insBtn">등 록</button>
				</div>	
			</form>		
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
    $(".insBtn").click(function(){
		  Swal.fire({
			  title: '등록하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			  cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			  cancelButtonText: '취소' // cancel 버튼 텍스트 지정
			}).then((result) => {
			  if (result.value) {
				  if($("[name=frRegiNum]").val() == ""){
					  Swal.fire({
						  title: '사업자번호를 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=frRegiNum]").focus()
						      return;
						  }
					  })
				  }
				  else if($("[name=frPass]").val() == ""){
					  Swal.fire({
						  title: '비밀번호를 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=frPass]").focus()
						      return;
						  }
					  })
				  }
				  else if($("[name=frOpen]").val() == ""){
					  Swal.fire({
						  title: '오픈시간을 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=frOpen]").focus()
						      return;
						  }
					  })
				  }
				  else if($("[name=frOperTime]").val() == ""){
					  Swal.fire({
						  title: '운영시간을 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=frOperTime]").focus()
						      return;
						  }
					  })
				  }
				  else if($("[name=frClosedDte]").val() == ""){
					  Swal.fire({
						  title: '휴무일을 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=frClosedDte]").focus()
						      return;
						  }
					  })
				  }
				  else if($("[name=frRepName]").val() == ""){
					  Swal.fire({
						  title: '대표자명를 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=frRepName]").focus()
						      return;
						  }
					  })
				  }
				  else if($("[name=frTel]").val() == ""){
					  Swal.fire({
						  title: '전화번호를 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=frTel]").focus()
						      return;
						  }
					  })
				  }
				  else if($("[name=eno]").val() == ""){
					  Swal.fire({
						  title: '담당직원을 선택해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
						      return;
						  }
					  })
				  }
				  else if($("[name=frAddress]").val() == ""){
					  Swal.fire({
						  title: '주소를 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=frAddress]").focus()
						      return;
						  }
					  })
				  }
				  else{
					  $("form").submit();
				  }
				  
			  }
			})	    	
  	})


});
</script>
</html>