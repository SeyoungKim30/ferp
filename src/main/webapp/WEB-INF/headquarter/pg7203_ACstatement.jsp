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
<title>타이틀</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<style>
.toolbar {
	margin-top: 0px;
	margin-bottom: 1em;
	display: flex;
	justify-content: space-between;
}

.toolbar div {
	display: inline;
}
</style>
<script>
$(document).ready(function(){
	function fetchlist(){
		this.numList=[];
		let url="/ferp/selectAccountJson.do"
		var vm= this;	//vue객체의 다른 속성(모델, 메소드)을 fetch 안에서 사용하기 위해
	 	fetch(url).then(function(response){return response.json() }).then(function(json){
	 		vm.accountList=json.accountList;
	 		console.log(json.accountList);
	 	}).catch(function(err){console.log(err)})
	}
	
	fetchlist();
	
})
</script>
</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>

		<div class="contents">
			<div class="toolbar">
				<div>
					<button class="btn-dark">이전전표</button>
					<button class="btn-dark">다음전표</button>
				</div>
				<div class="search">
					<form>
					<label>전표일자<input type="date" name="stmtDate"></label>
					<label>전표번호<input placeholder="전표번호" name="statementNum"></label>
					<button>검색</button>
					</form>
				</div>
				<div>
					<button class="btn-secondary"
						title="저장되지 않은 내용을 모두 삭제하고 새 전표를 입력합니다.">새 전표</button>
					<button class="btn-danger">삭제하기</button>
				</div>
			</div>
			<hr>
			<form action="${path }/insertACstatement.do" method="post" id="insertACstatement">
				<label>전표일자<input type="date" name="stmtDate"></label>
				<input name="statementNum" type="hidden" value="A">
				<input name="frRegiNum" type="hidden" value="세션로그인번호">
				<button class="btn-primary">등록</button>
				<table>
					<thead>
						<tr>
							<th>계정코드</th>
							<th>차변금액</th>
							<th>계정명</th>
							<th>대변금액</th>
							<th>거래처</th>
							<th>적요</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input name="stmtlist[0].acntNum"></td>
							<td><input name="stmtlist[0].debit"></td>
							<td><input placeholder="계정과목명(자동완성되게)"></td>
							<td><input name="stmtlist[0].credit"></td>
							<td><input name="stmtlist[0].stmtOpposite"></td>
							<td><input name="stmtlist[0].remark"></td>
						</tr>
						<tr>
							<td><input name="stmtlist[1].acntNum"></td>
							<td><input name="stmtlist[1].debit"></td>
							<td><input value="보통예금"></td>
							<td><input name="stmtlist[1].credit"></td>
							<td><input name="stmtlist[1].stmtOpposite"></td>
							<td><input name="stmtlist[1].remark"></td>
						</tr>
						<!-- <tr>
							<td><input name="stmtlist[2].acntNum"></td>
							<td><input name="stmtlist[2].debit"></td>
							<td><input value="보통예금"></td>
							<td><input name="stmtlist[2].credit"></td>
							<td><input name="stmtlist[2].stmtOpposite"></td>
							<td><input name="stmtlist[2].remark"></td>
						</tr>
						<tr>
							<td><input name="stmtlist[3].acntNum"></td>
							<td><input name="stmtlist[3].debit"></td>
							<td><input value="보통예금"></td>
							<td><input name="stmtlist[3].credit"></td>
							<td><input name="stmtlist[3].stmtOpposite"></td>
							<td><input name="stmtlist[3].remark"></td>
						</tr> -->
					</tbody>
				</table>
			</form>
<script>
$('[name=stmtDate]').on("change",function(){
	console.log($(this).val())
})
</script>



		</div>
	</div>
</body>
</html>