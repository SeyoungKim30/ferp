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
<title>본사 재고 관리 조회</title>
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css"/>
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<style>
.inputbox{
	width: 200px;
}
.searchtab{
	border: 1px solid lightgray;
	margin-top: 10px;
}
#insertForm select,
#insertForm input[type="hidden"],
#insertForm input[type="number"],
#insertForm button {
    display: inline-block;
    vertical-align: middle;
    margin-right: 10px;
}
#insertForm select {
    width: 200px; /* 선택한 값의 길이에 따라 조절 */
}
#insertForm button {
    margin-right: 0; /* 버튼과 인풋 요소 사이의 간격 없앰 */
}
</style>
<script type="text/javascript">
	localStorage.setItem("pageIdx","8201")
	localStorage.setItem("eqIdx","3")
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.udButton').each(function() {
		    var applyAmount = parseInt($(this).closest('tr').find('td:nth-child(6)').text().trim());
		    if (!isNaN(applyAmount) && applyAmount >= 0) {
				$(this).hide();
			} else {
				$(this).show();
			}
		});
		$("#insBtn").click(function(){
			var isInValid = false
			for(var idx=0;idx<$(".ckValid").length;idx++){
				if($(".ckValid").eq(idx).val()==""){
					alert("입력하여야 등록 가능합니다.")
					$(".ckValid").eq(idx).focus()
					isInValid = true
					break;
				}
			}
			if(isInValid){
				return
			}
			$("form").submit()
		})
	});
</script>
</head>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		<h2>매장 재고 관리 조회</h2><br><hr><br>
		<div class="toolbox">
		<h3>매출 내역 등록</h3><br>
			<form action="${path}/sinoutIns.do" id='insertForm'>
				<select name="productNum" required>
			    	<option value="">자재코드선택</option>
			    	<c:forEach var="productNum" items="${productNumCom}">
			    		<option>${productNum}</option>
			    	</c:forEach>
			    </select>
			    <input type="hidden" name="frRegiNum" value="${login.frRegiNum}" id="frRegiNum">
				<input type="number" name="applyAmount" value="${param.applyAmount}"
					class="ckValid"	id="applyAmount" placeholder="수량 입력" min="0" 
					oninput="if(this.value < 0) alert('음수는 입력할 수 없습니다.')" required>
				<button id="insBtn" class="btn-primary" type="button">등록</button>
			</form>
		</div>
			<div class="searchtab">
				<table>
				<thead>
					<tr><th>자재코드</th><th>카테고리명</th><th>자재명</th>
						<th>일자</th><th>단가</th><th>수량</th><th>수정/삭제</th></tr>
				</thead>
				<tbody>
					<c:forEach var="prod" items="${list}">
			    	    <tr>
			    	    	<td style="text-align:center">${prod.productNum}</td>
			    	    	<td style="text-align:center">${prod.category}</td>
			    	    	<td>${prod.productName}</td>
			    	    	<td style="text-align:center">${prod.stockDate}</td>
			    	    	<td style="text-align:right"><fmt:formatNumber value="${prod.price}" type='currency'/></td>
			    	    	<td style="text-align:center">${prod.applyAmount}</td>
					        <td style="text-align:center">
					            <button class="udButton" type="button">수정/삭제</button></td>
			    	    </tr>
			    	</c:forEach>
				</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>