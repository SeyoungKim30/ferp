<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 손 안의 백화점, 가인</title>
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="/ferp/resourse/css/insertPage.css"/>
<style type="text/css">



/* 
	↑↑↑ 위에 css 지워야 함 ↑↑↑
	
	위에 css는 섹션 위치 확인하시라고 
	높이값이랑 색깔값 넣었어요
	위치만 확인하고 지워주세요!
	
	1) 헤더는 로그인 세션 처리할 때 c:if로 바꿀 예정
	
	2) <div class="main_wrapper"> 안에만 내용 넣어 주세요.
			해당 div는 1200px이라서 안에 크기는 px로 조절하시면 됩니다.
			
	3) reset.css를 꼭 link로 걸어주시고 수정 절대 금지!
	-> 수정하면 모든 페이지가 다 바뀝니다!
			<link rel="stylesheet" href="/Gain/markup/reset.css"/>
			
	4) 제이쿼리는 CDN으로 넣었어요. 최신 버전으로 넣었는데 문제 생기면 말씀해주세요!
			<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

 */
 


</style>
</head>

<body>


	<section>
	<!-- 여기서부터 작업 -->
        <div class="main_wrapper">
        	<div>
     	        <h2 class="insert_product">메 뉴 등 록</h2>
	        	<input type="checkbox" id="necessary" >
	        	<span>선택가능여부</span>
        	</div>

        	<div class="content">
        	<form enctype="multipart/form-data" method="post">
				<div class="first_line">
					<h3 class="menu_name">메뉴명</h3>
					<h3 class="menu_price">가격</h3>
				</div>
				<div class="second_line">
					<input type="text" name="menuName" placeholder="메뉴명 입력">
					<input type="number" name="price" placeholder="판매가 입력">
				</div>
				<div class="third_line">
					<h3 class="menu_info">메뉴설명</h3>
					<h3 class="menu_category">카테고리</h3>
				</div>
				<div class="fourth_line">
					<input type="text" name="info" placeholder="메뉴설명 입력">
					<input type="text" name="category" placeholder="카테고리 입력">
				</div>
				<div class="fifth_line">
					<h3 class="menu_img">메뉴사진</h3>
				</div>
				<div class="sixth_line">
					<div class="block">
						<div class="img_block">
							<input class="upload-name" type="text" value="파일선택" disabled="disabled" style="width: 290px;">
							
			              	<label for="input_file">업로드</label> 
             				<input type="file" name="multipartfile" id="input_file" class="upload-hidden" > 
						</div>
					</div>
				</div>
				<div class="submit_line">
					<button type="button" class="insBtn">등 록</button>
				</div>	
			</form>		
			</div>
        </div>
    <!-- 여기까지만 작업 -->
    </section>


</body>
<script type="text/javascript">
$(document).ready(function(){
	    $(".insBtn").click(function(){
			  Swal.fire({
				  title: '등록하시겠습니까?',
				  icon: 'question',
				  showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
				  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
				  cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
				  confirmButtonText: '확인', // confirm 버튼 텍스트 지정
				  cancelButtonText: '취소' // cancel 버튼 텍스트 지정
				}).then((result) => {
				  if (result.value) {
					  if($("[name=menuName]").val() == ""){
						  Swal.fire({
							  title: '메뉴명을 입력해주세요.',
							  icon: 'warning',
							  showCancelButton: false,
							  confirmButtonColor: '#3085d6',
							  confirmButtonText: '확인'
							}).then((result) => {
							  if (result.value) {
								  $("[name=menuName]").focus()
							      return;
							  }
						  })
					  }
					  else if($("[name=price]").val() == ""){
						  Swal.fire({
							  title: '판매가를 입력해주세요.',
							  icon: 'warning',
							  showCancelButton: false,
							  confirmButtonColor: '#3085d6',
							  confirmButtonText: '확인'
							}).then((result) => {
							  if (result.value) {
								  $("[name=price]").focus()
							      return;
							  }
						  })
					  }
					  else if($("[name=info]").val() == ""){
						  Swal.fire({
							  title: '메뉴설명을 입력해주세요.',
							  icon: 'warning',
							  showCancelButton: false,
							  confirmButtonColor: '#3085d6',
							  confirmButtonText: '확인'
							}).then((result) => {
							  if (result.value) {
								  $("[name=info]").focus()
							      return;
							  }
						  })
					  }
					  else if($("[name=category]").val() == ""){
						  Swal.fire({
							  title: '카테고리를 입력해주세요.',
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