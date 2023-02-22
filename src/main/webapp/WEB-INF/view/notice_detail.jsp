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
	td{text-align:center;}
</style>
  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
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
		$("#downFile").click(function(){
			  Swal.fire({
				  title: '파일을 다운로드\n 하시겠습니까?',
				  icon: 'question',
				  showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				  cancelButtonText: '취소' // cancel 버튼 텍스트 지정
				}).then((result) => {
				  if (result.value) {
					//"확인" 버튼을 눌렀을 때 작업할 내용
					location.href = "${path}/download.do?fname="+$(this).val()
				  }
				})	
		})
		$("#goMain").click(function() {
			  Swal.fire({
				  title: '조회페이지로 이동하시겠습니까?',
				  icon: 'question',
				  showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				  cancelButtonText: '취소' // cancel 버튼 텍스트 지정
				}).then((result) => {
				  if (result.value) {
					//"확인" 버튼을 눌렀을 때 작업할 내용
					location.href = "${path}/noticeList.do"
				  }
				})	
		})
		$("#uptBtn").click(function(){
			  Swal.fire({
				  title: '수정페이지로\n 이동하시겠습니까?',
				  icon: 'question',
				  showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				  cancelButtonText: '취소' // cancel 버튼 텍스트 지정
				}).then((result) => {
				  if (result.value) {
					//"확인" 버튼을 눌렀을 때 작업할 내용
					location.href = "${path}/noticeUpdate.do?noticeNum="+${notice.noticeNum}
				  }
				})	
		})
		$("#delBtn").click(function(){
			  Swal.fire({
				  title: '해당 공지사항을\n 삭제하시겠습니까?',
				  icon: 'question',
				  showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				  cancelButtonText: '취소' // cancel 버튼 텍스트 지정
				}).then((result) => {
				  if (result.value) {
					//"확인" 버튼을 눌렀을 때 작업할 내용
					location.href = "${path}/noticeDelete.do?noticeNum="+${notice.noticeNum}
				  }
				})	
		})
	});
</script>
</head>

<body>
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">공지사항 상세</h4>
        <form method="post" enctype="multipart/form-data" class="validation-form" novalidate>
  
          <div class="mb-3">
            <label for="title">제목</label>
            <input name="title" value="${notice.title}" type="text" class="form-control ckValid" id="subject" placeholder="제목 입력" required>
		  </div>
          <div class="row">      
	          <div class="col-md-6 mb-3">
	            <label for="writer">작성자</label>
	            <input type="text" name="writer"
	            	 value="${notice.writer}"  class="form-control ckValid" id="writer" placeholder="작성자를 입력" readonly="readonly" required>
	          </div> 
	          <div class="col-md-6 mb-3">
	            <label for="readcnt">조회수</label>
	            <input type="text" name="readcnt"
	            	 value="${notice.readCnt}" readonly class="form-control ckValid" id="readcnt"  required>
	            <div class="invalid-feedback">
	              입력해주세요.
	            </div>
	          </div> 	          
          </div> 
        
          <div class="mb-3">
            <label for="content">내용</label>
            <textarea name="content"  class="form-control ckValid" id="content" placeholder="내용 입력" required rows="5" >${notice.content}</textarea>

          </div>
          <div class="mb-3">
            <label >첨부파일</label>
            <input id="downFile" value="${notice.fname}" type="text" class="form-control" placeholder="첨부 입력" required readonly="readonly">
		  </div>
		  

		  <script type="text/javascript">

		  
		  </script>      
          
          <div class="mb-4"></div>
          <button id="uptBtn" class="btn btn-warning btn-lg btn-block" type="button">게시물 수정</button>
          <button id="delBtn" class="btn btn-danger btn-lg btn-block" type="button">게시물 삭제</button>
          <button id="goMain" class="btn btn-info btn-lg btn-block" type="button">조회 화면</button>
        </form>
      </div>
    </div>
</body>
</html>