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
<link rel="stylesheet" href="/ferp/resource/css/notice_list.css"/>
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
           		<h2 class="notice_main">문의글</h2>
           		<div class="sch_line">
           			<form method="post">
		           		<input type="text" name="title" id="title" value="${sch.title}" placeholder="제목 검색">
						<button type="button" class="schBtn">검 색</button>
						<input type="hidden" name="curPage" value="${sch.curPage}"/>
					</form>
           		</div>
				<table>
			   	<col width="15%">
			   	<col width="60%">
			   	<col width="15%">
			   	<col width="10%">
				    <thead>
				      <tr>
				        <th>NO</th>
				        <th>제목</th>
				        <th>작성일</th>
				        <th>조회수</th>
				      </tr>
    				</thead>
				    <tbody>
				    	<c:forEach var="qna" items="${qna}">
				    	<tr>
				    		<td>${qna.cnt}</td>
				    		<td class="tab_title" style="text-align: left;" onclick="goDetail('${qna.noticeNum}')">
	    		    			<c:if test="${qna.level>1}">
					    			<c:forEach begin="2" end="${qna.level}">
					    			&nbsp;&nbsp;&nbsp;
					    			</c:forEach>
				    				<img src="${path}/resource/img/re.png" width="5%" height="5%">
				    			</c:if>
				    		${qna.title}</td>
				    		<td><fmt:formatDate value="${qna.regdte}"/></td>
				    		<td>${qna.readCnt}</td>
				    	</tr>
						</c:forEach>
				    </tbody>   				
				</table>
				<div class="page_wrap">
				   <div class="page_nation">
				      <a class="arrow prev" href="javascript:goPage(${sch.startBlock-1});"></a>
				      <c:forEach var="cnt" begin="${sch.startBlock}" end="${sch.endBlock}">
				      	<a href="#" class="${sch.curPage==cnt?'active':''}" onclick="goPage(${cnt})">${cnt}</a>
				      </c:forEach>
				      <a class="arrow next" href="javascript:goPage(${sch.endBlock+1});"></a>
				   </div>
				</div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	<%-- 
	
	--%>
    var insMsg = "${insMsg}"
    if(insMsg != ""){
		  Swal.fire({
			  title: '문의글 등록 성공!',
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
			  title: '문의글 수정 성공!',
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
			  title: '문의글 삭제 성공!',
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

function goPage(cnt) {
	$("[name=curPage]").val(cnt);
	$("form").submit()
}
// 상세페이지로 이동
function goDetail(noticeNum) {
	  location.href="${path}/qnaDetail.do?noticeNum="+noticeNum;
}

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