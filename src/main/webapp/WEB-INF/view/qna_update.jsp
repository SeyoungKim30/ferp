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
<link rel="stylesheet" href="/ferp/resource/css/qna_insert.css"/>
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
	        	<div>
	        	<form enctype="multipart/form-data" method="post">
	     	        <h2 class="insert_product">문의글 수정</h2>
	     	        <input type="hidden" name="noticeNum" value="${qna.noticeNum}">
	        	</div>
		
	        	<div class="content">
					<div class="first_line">
						<h3 class="qna_title">제목</h3>
						<h3 class="qna_category">문의유형</h3>
					</div>
					<div class="second_line">
						<input type="text" name="title" value="${qna.title}" placeholder="제목 입력">
						<input type="hidden" name="categoryHidden" value="${qna.category}">
						<select name="category">
						<c:if test="${qna.replyNum eq '0'}">
							<c:forEach var="category" items="${noticeCategoryCombo}">
								<option>${category}</option>
							</c:forEach>
						</c:if>
						<c:if test="${qna.replyNum ne '0'}">
							<option>${qna.category}</option>
						</c:if>
						</select>
					</div>
					<div class="third_line">
						<h3 class="menu_info">내용</h3>
					</div>
					<div class="fourth_line">
						<textarea name="content" rows="15" cols="70" placeholder="문의글 내용 입력">${qna.content}</textarea>
					</div>
					<div class="fifth_line">
						<h3 class="menu_img">첨부파일</h3>
					</div>
					<div class="sixth_line">
						<div class="block">
							<div class="img_block">
								<input class="upload-name" type="text" value="${notice.fname}" readonly="readonly" style="width: 290px;">
								
				              	<label for="input_file">업로드</label> 
	             				<input type="file" name="multipartfile" id="input_file" class="upload-hidden" > 
							</div>
						</div>
					</div>
					<div class="submit_line">
						<button type="button" class="uptBtn">수 정</button>
					</div>	
				</form>		
				</div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
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

$(document).ready(function(){
	var replyNum = '${qna.replyNum}'
	if(replyNum == '0'){
		$("[name=category] option").each(function(idx, opt){
			if( $("[name=categoryHidden]").val() == $(this).val() ){
				$(this).attr("selected", "selected");
			}
		})
	}

    $(".uptBtn").click(function(){
		  Swal.fire({
			  title: '수정하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			  cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			  cancelButtonText: '취소' // cancel 버튼 텍스트 지정
			}).then((result) => {
			  if (result.value) {
				  if($("[name=title]").val() == ""){
					  Swal.fire({
						  title: '제목을 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=title]").focus()
						      return;
						  }
					  })
				  }
				  else if($("[name=category]").val() == ""){
					  Swal.fire({
						  title: '카테고리를 선택해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=category]").focus()
						      return;
						  }
					  })
				  }
				  else if($("[name=content]").val() == ""){
					  Swal.fire({
						  title: '내용을 입력해주세요.',
						  icon: 'warning',
						  showCancelButton: false,
						  confirmButtonColor: '#3085d6',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
							  $("[name=content]").focus()
						      return;
						  }
					  })
				  }

				  else{
					  $("form").submit();
				  }
				  
			  }
			})	    	
  	})

   var fileTarget = $('.img_block .upload-hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            // 파일명 추출
            var filename = $(this)[0].files[0].name;
        } 

        else {
            // Old IE 파일명 추출
            var filename = $(this).val().split('/').pop().split('\\').pop();
        };

        $(this).siblings('.upload-name').val(filename);
    });

    //preview image 
    var imgTarget = $('.img_block .upload-hidden');

    imgTarget.on('change', function(){
        var parent = $(this).parent();
        parent.children('.upload-display').remove();

        if(window.FileReader){
            //image 파일만
            if (!$(this)[0].files[0].type.match(/image\//)) return;
            
            var reader = new FileReader();
            reader.onload = function(e){
                var src = e.target.result;
                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }

        else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

            var img = $(this).siblings('.upload-display').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
        }
    });
    
    

});
</script>
</html>