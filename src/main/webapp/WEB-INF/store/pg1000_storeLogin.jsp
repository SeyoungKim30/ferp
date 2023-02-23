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
        	<form method="post" id="loginForm">
				<input type="text" name="frRegiNum" placeholder="'-'는 제외하고 입력하세요.">
				<input type="password" name="frPass">
				<button type="submit" class="loginBtn">로그인</button>
        	</form>
		</div>
    </div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		var loginState = "${loginState}";
		if(loginState == "틀림"){
			alert("아이디 혹은 비밀번호를 확인하세요.")
		}
	})
</script>
</html>