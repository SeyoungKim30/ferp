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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="/ferp/resource/css/emp_insert.css"/>
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
	        	<form method="post">
	     	        <h2 class="insert_emp">비밀번호 변경</h2>
	     	        <input type="hidden" name="empNum" value="23031002">
		
	        	<div class="content">
					<div class="first_line">
						<h3 class="emp_ename">현재 비밀번호</h3>
					</div>
					<div class="second_line">
						<input type="password" name="nowPass" placeholder="현재 비밀번호 입력">
						<p class="nowPass"></p>
					</div>
					<div class="third_line">
						<h3 class="emp_pass">변경할 비밀번호</h3>
					</div>
					<div class="fourth_line">
						<input type="password" name="pass" placeholder="비밀번호 입력">
						<p class="comment"></p>
					</div>
					<div class="fifth_line">
						<h3 class="emp_dname">비밀번호 확인</h3>
					</div>
					<div class="sixth_line">
						<input type="password" name="passChk" placeholder="비밀번호 재입력">	
						<p class="commentChk"></p>			
					</div>					

					<div class="submit_line">
						<button type="button" class="uptBtn">변 경</button>
					</div>	
					
				</div>
				</form>	
            </div>
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
	$("[name=nowPass]").keyup(function(){
		if($(this).val() != '1234'){
			$(this).addClass("isNotPass")
			$(".nowPass").text("비밀번호가 다릅니다.")
		}else{
			$(this).removeClass("isNotPass")
			$(".nowPass").text("")
			$(this).addClass("isPass")
		}
	})
	
	var isPass1 = false;
	var isPass2 = false;
	$("[name=pass]").keyup(function chPW(){
		var pw = $(this).val();
		var number = pw.search(/[0-9]/g);
		var english = pw.search(/[a-z]/ig);
		var spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

        if (pw.length < 8 || pw.length > 20) {
        	$(this).addClass("isNotPass")
            $(".comment").text("8자리 ~ 20자리 이내로 입력해주세요.")

        } else if (pw.search(/\s/) != -1) {
        	$(this).removeClass("isNotPass")
        	$(".comment").text("비밀번호는 공백 없이 입력해주세요.")
        	$(this).addClass("isNotPass")

        } else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
        	$(this).removeClass("isNotPass")
        	$(".comment").text("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.")
        	$(this).addClass("isNotPass")        	

        } else if (/(\w)\1\1\1/.test(pw)) {
        	$(this).removeClass("isNotPass")
        	$(".comment").text("같은 문자를 4번 이상 사용하실 수 없습니다.")
        	$(this).addClass("isNotPass")       	

        }else {
        	$(this).removeClass("isNotPass")
        	$(".comment").text("");
        	$(this).addClass("isPass") 
        	isPass1 = true;
        }		
	})
	
	$("[name=passChk]").keyup(function(){
		var pass = $("[name=pass]").val()
		var passChk = $(this).val()
		
		if(pass != passChk){
        	$(this).addClass("isNotPass")
        	$(".commentChk").text("비밀번호가 다릅니다.");
		}else{
			$(this).removeClass("isNotPass")
			$(".commentChk").text("");
			$(this).addClass("isPass")
			isPass2 = true;
		}
	})
	
	
    $(".uptBtn").click(function(){
		  Swal.fire({
			  title: '변경하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			  cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			  cancelButtonText: '취소' // cancel 버튼 텍스트 지정
			}).then((result) => {
			  if (result.value) {
				  if(!isPass1 || !isPass2){
					  Swal.fire({
						  title: '비밀번호를 다시 확인해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
						      return;
						  }
					  })
				  }else{
					  $("form").submit();
				  }

				  
			  }
			})	    	
  	})

    
    

});
</script>
</html>