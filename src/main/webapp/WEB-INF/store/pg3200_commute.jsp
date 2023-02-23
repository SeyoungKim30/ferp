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
<style type="text/css">
	.btns{
		display: flex;
	}
	
	.btn{
		width: 250px;
		height: 250px;
		background: #2262F3;
		border-radius: 10px;
		color: #fff;
		font-weight: 600;
		font-size: 48px;
		line-height: 250px;
		text-align: center;
	}
	
</style>
</head>

<body>
    <div class="container">
        <header>  
            <div class="logo">
                <h1><a href="#"><img src="${path}/resource/img/F.ERP.png" alt=""></a></h1>
            </div>
        </header>
        <div class="main_wrapper">
        	<div class="btns">
        		<div class="btn start_btn">출근</div>
        		<div class="btn end_btn">퇴근</div>
        	</div>
		</div>
    </div>
</body>
<script type="text/javascript">

</script>
</html>