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
	var accountList=[];
	
	function fetchlist(){
		let url="/ferp/selectAccountJson.do"
	 	fetch(url).then(function(response){return response.json() }).then(function(json){
	 		accountList=json.accountList;
	 		console.log("함수내부 : " + accountList);
	 	}).catch(function(err){console.log(err)})
	}
	
	fetchlist();

	$('.acntTitle').on("keyup",function(){
		var myinput = $(this).val();
		var myresult = $(this).parents('tr').find(".acntNum")
		for(var i=0;i<accountList.length;i++){
			if(accountList[i].acntTitle==myinput){
				console.log('일치');
				myresult.val(accountList[i].acntNum);
				break;
			}else{
				myresult.val('');
			}
		}
	})
	
	$('.acntNum').on("keyup",function(){
		var myinput = $(this).val();
		var myresult = $(this).parents('tr').find(".acntTitle")
		for(var i=0;i<accountList.length;i++){
			if(accountList[i].acntNum==myinput){
				console.log('일치');
				myresult.val(accountList[i].acntTitle);
				break;
			}else{
				myresult.val('');
			}
		}
	})	
	
	totalcalculator('.debit','.totaldebit');
	totalcalculator('.credit','.totalcredit');
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
					<form action="${path }/selectACstatement.do">
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
				<label>전표일자<input type="date" name="stmtDate" required="required"></label>
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
						<c:forEach varStatus="ii" items="${stmtList}" var="each" >
						<tr>
							<td><input class="acntNum" name="stmtlist[${ii.index }].acntNum" required="required" value="${each.acntNum }"></td>
							<td><input name="stmtlist[${ii.index }].debit" required="required" class="debit" value="${each.debit }"></td>
							<td><input class="acntTitle" placeholder="계정과목명"></td>
							<td><input name="stmtlist[${ii.index }].credit" required="required" class="credit" value="${each.credit }"></td>
							<td><input name="stmtlist[${ii.index }].stmtOpposite" value="${each.stmtOpposite}"></td>
							<td><input name="stmtlist[${ii.index }].remark" value="${each.remark}"></td>
						</tr>
						</c:forEach>
						
						<c:if test="${empty stmtList}">
						<c:forEach varStatus="ii" begin="0" end="10" >
							<tr>
								<td><input class="acntNum" name="stmtlist[${ii.index }].acntNum" required="required"></td>
								<td><input name="stmtlist[${ii.index }].debit" required="required" class="debit"></td>
								<td><input class="acntTitle" placeholder="계정과목명"></td>
								<td><input name="stmtlist[${ii.index }].credit" required="required" class="credit"></td>
								<td><input name="stmtlist[${ii.index }].stmtOpposite"></td>
								<td><input name="stmtlist[${ii.index }].remark"></td>
							</tr>
						</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr><td>차변합계</td><td class="totaldebit"></td><td>대변합계</td><td class="totalcredit"></td><td>차액</td><td id="DCgap">얼마</td></tr>
					</tfoot>
				</table>
			
			</form>

		</div>
	</div>
	<script>

	function totalcalculator(whichone,whichtotal){
		let totalsum=0;
		let debitlist=document.querySelectorAll(whichone);
		for(var i=0;i<debitlist.length;i++){
			totalsum+=Number(debitlist[i].value);
		}
		$(whichtotal).text(totalsum);
	}
	$('.credit').on('keyup',function(){
		totalcalculator('.credit','.totalcredit');
	})
	
	$('.debit').on('keyup',function(){
		totalcalculator('.debit','.totaldebit');
	})	
	
	</script>
</body>
</html>