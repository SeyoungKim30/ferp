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
<title>주문 확인</title>

<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css"/>
<style type="text/css">
	.container{
		padding: 60px 0;
	}
	.topText, .btmText{
		display: flex;
		justify-content: center;
		gap: 50px;
	}
	
	.topCom, .btmCom{
		line-height: 100px;
	    width: 500px;
	    height: 100px;
	    background: #2262F3;
	    color: #fff;
	    font-size: 42px;
	    text-align: center;
	}
	
	.btmText ul{
	    width: 500px;
	    border: 5px solid #2262F3;
	    padding: 40px 0;
	}
	
	.btmText li{
	    font-size: 50px;
	    text-align: center;
	}

</style>
</head>

<body>
    <div class="container">
		<div class="topText">
			<div class="topCom">제조 완료</div>
			<div class="btmCom">제조 중</div>
		</div>
		<div class="btmText">
			<div class="com">
				<ul>
					<li>1001</li>
				</ul>
			</div>
			<div class="ing">
				<ul>
					<li>1002</li>
				</ul>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

</script>
</html>