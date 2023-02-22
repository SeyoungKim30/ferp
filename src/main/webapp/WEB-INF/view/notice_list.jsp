<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{
		text-align:center;
		cursor: pointer;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>
	    var insMsg = "${insMsg}"
	    if(insMsg != ""){
			  Swal.fire({
				  title: '공지사항 등록 성공!',
				  icon: 'success',
				  showCancelButton: false, // cancel버튼 보이기. 기본은 원래 없음
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				}).then((result) => {
				  if (result.value) {
					//"확인" 버튼을 눌렀을 때 작업할 내용
				  }
				})	
	    }
	    var uptMsg = "${uptMsg}"
	    if(uptMsg != ""){
			  Swal.fire({
				  title: '공지사항 수정 성공!',
				  icon: 'success',
				  showCancelButton: false, // cancel버튼 보이기. 기본은 원래 없음
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				}).then((result) => {
				  if (result.value) {
					//"확인" 버튼을 눌렀을 때 작업할 내용
				  }
				})	
	    }
	    var delMsg = "${delMsg}"
	    if(delMsg != ""){
			  Swal.fire({
				  title: '공지사항 삭제 성공!',
				  icon: 'success',
				  showCancelButton: false, // cancel버튼 보이기. 기본은 원래 없음
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				}).then((result) => {
				  if (result.value) {
					//"확인" 버튼을 눌렀을 때 작업할 내용
				  }
				})	
	    }
	});
	// 상세페이지로 이동
	function goDetail(noticeNum) {
		  location.href="${path}/noticeDetail.do?noticeNum="+noticeNum;
	}
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>공지사항</h2>

</div>
<div class="container">
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" name="title" placeholder="제목 입력" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="15%">
   	<col width="60%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="notice" items="${list}">
    	<tr>
    		<td>${notice.noticeNum}</td>
    		<td onclick="goDetail('${notice.noticeNum}')">${notice.title}</td>
    		<td><fmt:formatDate value="${notice.regdte}"/></td>
    		<td>${notice.readCnt}</td>
    	</tr>
		</c:forEach>
    </tbody>
	</table>    
    
</div>

</body>
</html>