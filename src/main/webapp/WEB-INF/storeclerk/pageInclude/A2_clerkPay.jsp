<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel="stylesheet" href="${path}/resource/css/reset.css" >
<link rel="stylesheet" href="${path}/resource/css/A2_jhCSS.css" >
<link rel="stylesheet" href="${path}/resource/css/A2_storeclerkJH.css">
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	
</script>
</head>

<body>
	<div class="containerJ">
		<h2 class="h2Title">급여액 조회</h2>
		<br>
		<div>
			<div>
				<div>
					<div class="schDiv toolbox" style="margin-left: 85%;">
						<form id="frm01" method="post">
							<input type="text" name="clerkName" value="${SCsch.clerkName}"/>
							<input type="hidden" name="curPage" value="${SCsch.curPage}" />
							<button type="submit" class="schBtn">조회</button>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="thDiv" style="width:15%;">직원번호</div>
					<div class="thDiv" style="width:15%;">직원명</div>
					<div class="thDiv" style="width:5%;">성별</div>
					<div class="thDiv" style="width:10%;">시급</div>
					<div class="thDiv" style="width:10%;">지급액</div>
					<div class="thDiv" style="width:45%;">비고</div>
				</div>
				<c:forEach var="sc" items="${scList }">
					<div class="row">
						<div class="tdDiv" style="width:15%;">
							<input type="text" class="listInput" name="clerkNum" style="width:100%;" value="${sc.clerkNum }" disabled/>
						</div>
						<div class="tdDiv" style="width:15%;">
							<input type="text" class="listInput" name="clerkName" style="width:100%;" value="${sc.clerkName }" disabled/>
						</div>
						<div class="tdDiv" style="width:5%;">
							<input type="text" class="listInput" name="gender" style="width:100%;" value="${sc.gender }" disabled/>
						</div>
						<div class="tdDiv" style="width:10%;">
							<input type="text" class="listInput" name="hourlyPay" style="width:100%;" value="${sc.hourlyPay }" disabled/>
						</div>
						<div class="tdDiv" style="width:10%;">
							<input type="text" class="listInput" name="totPay" style="width:100%;" value="" disabled/>
						</div>
						<div class="tdDiv" style="width:45%;">
							<input type="text" class="listInput" name="comments" style="width:100%;" value="" disabled/>
						</div>
					</div>
				</c:forEach>
				<div class="row center">
					<button name="prev" class="pgBtnPrev" onclick="location.href='javascript:goPage(${SCpsch.startBlock-1});'">
						&lt;
					</button>
					<c:forEach var="cnt" begin="${SCpsch.startBlock }" end="${SCpsch.endBlock}">
				  		<button class="pgBtn pg${cnt}" onclick="location.href='javascript:goPage(${cnt});'">
							${cnt}
						</button>
				  	</c:forEach>
				  	<button name="next" class="pgBtnNext" onclick="location.href='javascript:goPage(${SCpsch.startBlock+1});'">
						&gt;
					</button>
				</div>
				<form id="pageFrm">
					<input type="hidden" name="curPage" value="${SCpsch.curPage}" />
				</form>
			</div>
		</div>
	</div>	
</body>
<script type="text/javascript">
function goPage(cnt){
	$("[name=curPage]").val(cnt);
	localStorage.setItem("scplistPg",cnt)
	$("#pageFrm").submit()
}
if(${SCpsch.curPage==1}){
	$("[name=prev]").attr("disabled",true)
}
if(${SCpsch.curPage==SCpsch.endBlock}){
	$("[name=next]").attr("disabled",true)
}
if(${SCpsch.curPage}==localStorage.getItem("scplistPg")){
	$(".pg"+localStorage.getItem("scplistPg")).css("backgroundColor","#a4a4a4")
	$(".pg"+localStorage.getItem("scplistPg")).css("color","white")
}
</script>
</html>