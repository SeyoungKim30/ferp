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
<link rel="stylesheet" href="/ferp/resource/css/notice_list.css"/>
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
           		<h2 class="notice_main">메 뉴 조 회</h2>
           		<div class="sch_line">
           			<form method="post">
		           		<input type="text" name="menuName" id="title" value="${sch.menuName}" placeholder="메뉴명 검색">
						<button type="button" class="schBtn">검 색</button>
					</form>
           		</div>
				<table>
			   	<col width="15%">
			   	<col width="40%">
			   	<col width="15%">
			   	<col width="30%">
				    <thead>
				      <tr>
				        <th>메뉴명</th>
				        <th>메뉴설명</th>
				        <th>가격</th>
				        <th>사진</th>
				      </tr>
    				</thead>
				    <tbody>
				    	<c:forEach var="menu" items="${menu}">
				    	<tr>
				    		<td>${menu.menuName}</td>
				    		<td>${menu.info}</td>
				    		<td><fmt:formatNumber value="${menu.price}"/></td>
				    		<td class="menu_img"><img src="/ferp/resource/img/${menu.img}"></td>
				    	</tr>
						</c:forEach>
				    </tbody>	
				</table>
				<div class="page_wrap">
				   <div class="page_nation">
				      <a class="arrow prev" href="#"></a>
				      <a href="#" class="active">1</a>
				      <a href="#">2</a>
				      <a href="#">3</a>
				      <a href="#">4</a>
				      <a href="#">5</a>
				      <a class="arrow next" href="#"></a>
				   </div>
				</div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	<%-- 
	
	--%>

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