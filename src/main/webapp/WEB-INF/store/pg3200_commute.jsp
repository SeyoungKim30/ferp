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
	.btns{
		display: flex;
	    gap: 80px;
	    width: 100%;
	    justify-content: center;
        padding: 60px 0;
	}
	
	.btn{
		width: 200px;
		height: 200px;
		background: #2262F3;
		border-radius: 10px;
		color: #fff;
		font-weight: 600;
		font-size: 48px;
		line-height: 200px;
		text-align: center;
		cursor: pointer;
	}
	
	header h2{
		text-align: center;
	    font-size: 25px;
	    line-height: 74px;
    }
    
    .logo{
		padding: 70px 0 10px;
    }
    
    .main_wrapper{
    	display: block;
    }
	
</style>
</head>

<body>
    <div class="container">
        <header>  
            <div class="logo">
                <h1><a href="#"><img src="${path}/resource/img/F.ERP.png" alt=""></a></h1>
            </div>
           	<h2>프랜차이즈 매장 관리 시스템</h1>
        </header>
        <div class="main_wrapper">
        	<div class="btns">
        		<div class="btn start_btn">출근</div>
        		<div class="btn end_btn">퇴근</div>
        	</div>
        		<select>
        			<option>직원1</option>
        			<option>직원2</option>
        			<option>세션처리후</option>
        			<option>직원이름 쭉 가져올 거임</option>
        			<option>임시임</option>
        			<option>작업 전임</option>
        		</select>
		</div>
    </div>
</body>
<script type="text/javascript">

</script>
</html>