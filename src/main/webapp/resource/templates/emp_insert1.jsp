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
<title>타이틀</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="/ferp/resource/css/emp_insert.css"/>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />

</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
        	<form method="post">
     	        <h2 class="insert_emp">직원 등록</h2>
	
        	<div class="content">
				<div class="first_line">
					<h3 class="emp_ename">사원명</h3>
				</div>
				<div class="second_line">
					<input type="text" name="ename" placeholder="사원명 입력">
				</div>
				<div class="third_line">
					<h3 class="emp_pass">비밀번호</h3>
				</div>
				<div class="fourth_line">
					<input type="text" name="pass" placeholder="비밀번호 입력">
				</div>
				<div class="fifth_line">
					<h3 class="emp_dname">부서명</h3>
				</div>
				<div class="sixth_line">
					<input type="text" name="dname" placeholder="부서명 입력">				
				</div>					

				<div class="submit_line">
					<button type="button" class="insBtn">등 록</button>
				</div>	
			</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
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
				  if($("[name=ename]").val() == ""){
					  Swal.fire({
						  title: '사원명을 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=ename]").focus()
						      return;
						  }
					  })
				  }
				  else if($("[name=pass]").val() == ""){
					  Swal.fire({
						  title: '비밀번호를 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=pass]").focus()
						      return;
						  }
					  })
				  }
				  else if($("[name=dname]").val() == ""){
					  Swal.fire({
						  title: '부서명을 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=dname]").focus()
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