<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 손 안의 백화점, 가인</title>
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="/ferp/resourse/css/store_insert.css"/>
<style type="text/css">



/* 
	↑↑↑ 위에 css 지워야 함 ↑↑↑
	
	위에 css는 섹션 위치 확인하시라고 
	높이값이랑 색깔값 넣었어요
	위치만 확인하고 지워주세요!
	
	1) 헤더는 로그인 세션 처리할 때 c:if로 바꿀 예정
	
	2) <div class="main_wrapper"> 안에만 내용 넣어 주세요.
			해당 div는 1200px이라서 안에 크기는 px로 조절하시면 됩니다.
			
	3) reset.css를 꼭 link로 걸어주시고 수정 절대 금지!
	-> 수정하면 모든 페이지가 다 바뀝니다!
			<link rel="stylesheet" href="/Gain/markup/reset.css"/>
			
	4) 제이쿼리는 CDN으로 넣었어요. 최신 버전으로 넣었는데 문제 생기면 말씀해주세요!
			<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

 */
 


</style>
</head>

<body>


	<section>
	<!-- 여기서부터 작업 -->
        <div class="main_wrapper">
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
						<option value="100">김개똥</option>
					</select>				
					<input type="text" name="frAddress" placeholder="주소 입력">
				</div>					
						
				<div class="submit_line">
					<button type="button" class="insBtn">등 록</button>
				</div>	
			</form>		
			</div>
        </div>
    <!-- 여기까지만 작업 -->
    </section>


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