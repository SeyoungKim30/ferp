<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css"/>
<script type="text/javascript">
var login = '${login.frRegiNum}'
	if(login==""){
		location.href="${path}/storeLogin.do"
	}
</script>
<style>
	.headerTop{
		display: flex;
		justify-content: space-between;
	    width: 90%;
	    margin: auto;
	    padding-bottom: 20px;
	}
	
	.logout{
		font-size: 18px;
	}
	
	.nameText{
		    font-size: 20px;
    line-height: 33px;
	}
	
</style>
 <header>  
      <div class="logo">
      <a href="#"><img src="${path }/resource/img/F.ERP.png" alt=""></a>
      </div>
      <c:if test="${login.frRegiNum != '9999999999'}"> 
      	<div class="headerTop">
	      <h2 class="nameText">${login.frName }</h2>
	      <button class="logout btn-primary" onclick="location.href='${path}/storeLogin.do'">로그아웃</button>
      	</div>    
      </c:if>
      <c:if test="${login.frRegiNum == '9999999999'}">
      	<div class="headerTop">
	      <h2 class="nameText">${login.ename } 담당자</h2>
	      <button class="logout btn-primary" onclick="location.href='${path}/logoutEmp.do'">로그아웃</button>
		</div>
      </c:if>
</header>