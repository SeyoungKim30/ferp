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
<title>주문하기</title>

<!-- remixicon cdn -->
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>

<!-- 알럿창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style type="text/css">
	.wrap_container{
				max-width: 1200px;
				width: 100%;
				margin: 0 auto;
			}
		
	.headerTop{
		width: 100%;
		height: 90px;
		text-align: center;
		color: #fff;
		background: #2262F3;
		line-height: 90px;
	    font-size: 35px;
    	font-weight: 600;
	}
	
	.howbox{
		text-align: center;
		cursor: pointer;
	}
	
	.howtoPay{
		display: flex;
		justify-content: center;
	    gap: 140px;
	    padding: 50px 0;
	}
	
	.howbox>span{
	    font-size: 20px;
    	line-height: 45px;
	}
</style>
</head>

<body>
	<div class="wrap_container">
		<div class="headerTop">
			결제하기
		</div>
		<div class="howtoPay">
			<div class="howbox kakao">
				<img alt="" src="${path}/resource/img/kakao.png"><br>
				<span>카카오페이</span>
			</div>
			<div class="howbox card">
				<img alt="" src="${path}/resource/img/card.png"><br>
				<span>카드 결제</span>
			</div>
			<div class="howbox cash">
				<img alt="" src="${path}/resource/img/cash.png"><br>
				<span>현금 결제</span>
			</div>
		</div>
		<p>${orderNum}</p>
	</div>	
</body>
<script type="text/javascript">
'use strict';

</script>
</html>