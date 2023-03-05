<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ferp 매장 관리</title>

<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="/ferp/resource/css/notice_detail.css"/>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>

</head>

<body>
    <div class="container">
        <header>  
            <div class="logo">
                <h1><a href="#"><img src="/ferp/resource/img/F.ERP.png" alt=""></a></h1>
            </div>
        </header>
        <div class="main_wrapper">
            <div class="lnb">
                <ul>
                    <li>
                        <a href="#">공지 및 문의</a>
                        <ul>
                            <li><a href="#">- 공지사항 조회</a></li>
                            <li><a href="#">- 문의글 등록</a></li>
                            <li><a href="#">- 1:1 채팅</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">직원 관리</a>
                        <ul>
                            <li><a href="#">- 직원 정보 조회</a></li>
                            <li><a href="#">- 근태 조회</a></li>
                            <li><a href="#">- 스케쥴 관리</a></li>
                            <li><a href="#">- 급여액 조회</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">재무 관리</a>
                        <ul>
                            <li><a href="#">- 전표 수기 입력</a></li>
                            <li><a href="#">- 거래 내역 조회</a></li>
                            <li><a href="#">- 손익 계산서 조회</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">물류 관리</a>
                        <ul>
                            <li><a href="#">- 발주 신청</a></li>
                            <li><a href="#">- 배송 불량 신청</a></li>
                            <li><a href="#">- 배송 불량 신청 현황</a></li>
                            <li><a href="#">- 발주 계산서 조회</a></li>
                            <li><a href="#">- 재고 관리</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">매장 관리</a>
                        <ul>
                            <li><a href="#">- 비밀번호 변경</a></li>
                            <li><a href="#">- 매출 조회</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="contents">
           	<form method="post" enctype="multipart/form-data">
           		<h2 class="notice_main">문 의 글</h2>
           		<input type="hidden" name="noticeNum" value="${qna.noticeNum}">
           		<input type="hidden" name="replyNum" value="${qna.replyNum}">
           		
           		<input type="hidden" name="title" value="${qna.title}">
           		<div class="title_line">
           			<h3 class="notice_title">${qna.title}</h3>
           			<span style="position: absolute; right: 335px;">등록일 : <fmt:formatDate value="${qna.regdte}" pattern="yyyy-MM-dd"/></span>
           			<span style="position: absolute; right: 250px;">조회수 : ${qna.readCnt}</span>
           		</div>
				
				<div class="notice_content">
					<input type="hidden" name="content" value="${qna.content}">
					<pre>${qna.content}</pre>
				</div>
		        <div class="file_line">
			        <label>첨 부 파 일</label>
			        <input id="downFile" value="${qna.fname}" type="text" placeholder="등록된 파일이 없습니다." required readonly="readonly">
				</div>
				<div class="btn_line">
				  <button id="goMain" type="button">목 록</button>
				  <button id="replyBtn" type="button">답 변</button>
		          <button id="uptBtn" type="button">수 정</button>
		          <button id="delBtn" type="button">삭 제</button>
				</div>
			</form>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	<%-- 
	
	--%>	
	console.log($("[name=noticeNum]").val())
	console.log($("pre").text())
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
				location.href = "${path}/qnaList.do"
			  }
			})	
	})
	$("#replyBtn").click(function(){
			$("[name=replyNum]").val($("[name=noticeNum]").val())
			$("[name=title]").val("RE:"+$("[name=title]").val())
			$("[name=content]").val("\n\n\n=== 이전 글 ===\n"+$("[name=content]").val())
			$("form").attr("action","${path}/qnaReply.do");
			$("form").submit()
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
				  location.href = "${path}/qnaUpdate.do?noticeNum="+'${qna.noticeNum}'
			  }
			})		
	})
	$("#delBtn").click(function(){
		  Swal.fire({
			  title: '해당 문의글을\n 삭제하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			  cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			  cancelButtonText: '취소' // cancel 버튼 텍스트 지정
			}).then((result) => {
			  if (result.value) {
				//"확인" 버튼을 눌렀을 때 작업할 내용
				location.href = "${path}/qnaDelete.do?noticeNum="+'${qna.noticeNum}'
			  }
			})	
	})
});


$('.lnb > ul > li').click(function() {
    if ( $(this).hasClass('active') ) {
        $(this).find('> ul').stop().slideUp(300);
        $(this).removeClass('active');
    }
    else {
        $(this).find('> ul').stop().slideDown(300);
        $(this).addClass('active');
    }
});

$('.lnb > ul > li').eq(0).trigger("click");
</script>
</html>