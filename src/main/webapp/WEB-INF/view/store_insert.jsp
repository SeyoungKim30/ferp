<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ferp 매장 관리</title>

<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="/ferp/resource/css/store_insert.css"/>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>

</head>

<body>
    <div class="container">
        <header>  
            <div class="logo">
                <h1><a href="#"><img src="/ferp/resource/img/F.ERP.png" alt=""></a></h1>
            </div>
        </header>
        <div class="main_wrapper">
            <div class="lnb">
                <ul>
                    <li>
                        <a href="#">공지 및 문의</a>
                        <ul>
                            <li><a href="#">- 공지사항 조회</a></li>
                            <li><a href="#">- 문의글 등록</a></li>
                            <li><a href="#">- 1:1 채팅</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">직원 관리</a>
                        <ul>
                            <li><a href="#">- 직원 정보 조회</a></li>
                            <li><a href="#">- 근태 조회</a></li>
                            <li><a href="#">- 스케쥴 관리</a></li>
                            <li><a href="#">- 급여액 조회</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">재무 관리</a>
                        <ul>
                            <li><a href="#">- 전표 수기 입력</a></li>
                            <li><a href="#">- 거래 내역 조회</a></li>
                            <li><a href="#">- 손익 계산서 조회</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">물류 관리</a>
                        <ul>
                            <li><a href="#">- 발주 신청</a></li>
                            <li><a href="#">- 배송 불량 신청</a></li>
                            <li><a href="#">- 배송 불량 신청 현황</a></li>
                            <li><a href="#">- 발주 계산서 조회</a></li>
                            <li><a href="#">- 재고 관리</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">매장 관리</a>
                        <ul>
                            <li><a href="#">- 비밀번호 변경</a></li>
                            <li><a href="#">- 매출 조회</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
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
$('.lnb > ul > li').click(function() {
    if ( $(this).hasClass('active') ) {
        $(this).find('> ul').stop().slideUp(300);
        $(this).removeClass('active');
    }
    else {
        $(this).find('> ul').stop().slideDown(300);
        $(this).addClass('active');
    }
});

$('.lnb > ul > li').eq(0).trigger("click");
</script>
</html>