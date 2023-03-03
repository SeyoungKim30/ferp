<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ferp 매장 관리</title>

<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>
<style type="text/css">
	
	.lnb>ul>li>a:after{
	width: 18px;
	height: 16px;
	background: url(${path}/resource/img/menu_icon_down.png);
	position: absolute;
	top: 11px;
	right: 14px;
	content: "";
	}
	
	.lnb>ul>li.active>a:after{
	    background: url(${path}/resource/img/menu_icon_up.png);
	}
	
</style>
</head>

<body>
    <div class="container">
	<%@ include file="/resource/templates/header.jsp"%>
        <div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
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

<!-- eq(n) 열려 있는 사이드바 n 숫자로 조정하세요.  -->
$('.lnb > ul > li').eq(0).trigger("click");
</script>
</html>