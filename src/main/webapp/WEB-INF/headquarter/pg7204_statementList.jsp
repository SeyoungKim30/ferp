<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="login" value="fakeID1111" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />

</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">

	<div class="toolbar">
		<form action="${path }/statementList.do" method="post">
		<div>
				<input type="hidden" name="frRegiNum" value="${login }">
				<div><label>시작일자<input name="stmtDate" type="date" value="${stmt.stmtDate }" required></label></div>
				<div><label>종료일자<input name="stmtDate2" type="date" value="${stmt.stmtDate2 }"></label></div>
				<div><label>거래처<input name="stmtOpposite" value="${stmt.stmtOpposite }"></label></div>
				<div><label>계정과목<select name="acntNum">
					<c:forEach items="${accountList }" var="ii">
						<option <c:if test="${ii.acntNum==stmt.acntNum }">selected="selected"</c:if> 
							value="${ii.acntNum }">${ii.acntTitle }</option>
					</c:forEach>
					</select>
					</label></div>
		</div>
		<div>
		<button id="byDate" type="button">일자별 조회</button>
		<button id="byEach">건별 조회</button>
		<input type="hidden" name="howtosearch" value="1">
		</div>
		</form>
	</div>
<table>
<thead>
<tr><th>일자</th><th>금액</th><th>거래처</th><th>적요</th></tr>
</thead>
<tbody>
<tr class="table-active"><td>전체 기간내</td><td class="totalPrice">452,100</td><td></td><td></td></tr>
<c:forEach items="${stmtList}" var="ii">
	<tr><td>${ii.stmtDate }</td>
	<td class="debit"><fmt:formatNumber type="number" maxFractionDigits="3" value="${ii.debit}" /></td>
	<td>${ii.stmtOpposite }</td><td>${ii.remark }</td></tr>
</c:forEach>
</tbody>
</table>
		
		
		
		</div>
	</div>
	
	
<script>
var totalPrice=0;
$('.debit').each(function(){
	let thisnum=$(this).text().replace(/,/g, "")
	totalPrice+=Number(thisnum)
})
$('.totalPrice').text(totalPrice.toLocaleString())

$('#byDate').on('click',function(){
	$('[name=howtosearch]').val(2)
	$('#byEach').click();
})
</script>

</body>
</html>