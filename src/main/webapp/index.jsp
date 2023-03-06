<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FERP</title>

</head>

<body class="container">
<c:if test="${login == null }">
fhrmdlswjdqh djqtdma
</c:if>
<c:if test="${login != null }">
<c:if test="${login.frRegiNum == '9999999999' }">
본사메인으로 이동
<c:redirect url="p0001.jsp"/>

</c:if>
<c:if test="${login.frRegiNum == '9999999999' }">
<c:redirect url="p0002.jsp" />
</c:if>
</c:if>
</body>
</html>