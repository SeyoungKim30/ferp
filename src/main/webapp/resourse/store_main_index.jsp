<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ferp 매장 관리</title>

<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="ferp/resourse/css/reset.css"/>
<link rel="stylesheet" href="ferp/resourse/css/store_main_index.css"/>

</head>

<body>
    <div class="container">
        <header>  
            <div class="logo">
                <h1><a href="#"><img src="ferp/resourse/img/F.ERP.png" alt=""></a></h1>
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
                <div class="main_banner">메인 슬라이더 배너 영역</div>
                <div class="btm_content">
                    <div class="notice">
                        <h3>- 공지사항</h3>
                        <div class="boxes">
                        </div>
                    </div>
                    <div class="schedule">
                        <h3>- 금일 스케쥴</h3>
                        <div class="boxes"></div>
                    </div>
                </div>
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
</script>
</html>