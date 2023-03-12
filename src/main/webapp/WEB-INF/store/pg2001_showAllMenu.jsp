<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 메뉴 등록</title>
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css"/>
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<style>
	.necessarySpan{
		color: red;
		font-weight: 600;
	}
	
	td{
		text-align: center;
	    line-height: 35px;
	}
	
	.infoTextTd{
		text-align: left;
	}
</style>
<script type="text/javascript">
	localStorage.setItem("pageIdx","2001")
	localStorage.setItem("eqIdx","2000")

	$(document).ready(function(){

	});

</script>
</head>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		<h2>판매 메뉴 등록</h2><br><hr><br>
           <form class="menuSchForm">
            	<input type="text" placeholder="메뉴명을 입력하세요." name="menuName" value="${sch.menuName}">
            	<button class="menuSch" type="submit">검색</button>
            </form>
			<table>
				<thead>
					<tr>
						<th>이름</th><th>가격</th><th>메뉴 설명</th><th>등록</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="mn" items="${showAllMenu}">
						<tr>
							<td>${mn.menuName}</td>
							
							<td>
								<fmt:formatNumber value="${mn.price }" pattern="#,###" />￦
							</td>
							<td class="infoTextTd">${mn.info}</td>
							<td>
								<input name="menuNum" type="hidden" value="${mn.menuNum}">
								<c:if test="${mn.necessary == 'N'}">
								<button class="addMenu btn-primary">등록</button>
								</c:if>
								<c:if test="${mn.necessary == 'Y'}">
								<span class="necessarySpan">필수 판매 메뉴입니다.</span>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	
	var fn = ${login.frRegiNum};
	
	
	$(".addMenu").click(function () {
		var menuNum = $(this).closest('tr').find('input[name="menuNum"]').val();
		console.log(menuNum);
		  Swal.fire({
			  title: '메뉴를 추가하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#2262F3',
			  cancelButtonColor: '#888',
			  confirmButtonText: '등록',
			  cancelButtonText: '취소'
			}).then((result) => {
				if(result.value){				
					location.href='${path}/insOnsale.do?menuNum='+menuNum+'&frRegiNum='+fn;
				}
			});
	});
	
});

</script>
</html>