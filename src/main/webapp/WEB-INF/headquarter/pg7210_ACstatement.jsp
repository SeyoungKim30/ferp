<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="login" value="fakeID1111" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전표관리</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />

<script>
localStorage.setItem("pageIdx","7210")
localStorage.setItem("eqIdx","2")

$(document).ready(function(){
	var accountList=[];
	
	function fetchlist(){
		let url="/ferp/selectAccountJson.do"
	 	fetch(url).then(function(response){return response.json() }).then(function(json){
	 		accountList=json.accountList;
	 	}).catch(function(err){console.log(err)})
	}
	
	fetchlist();

	$('.acntTitle').on("keyup",function(){
		var myinput = $(this).val();
		var myresult = $(this).parents('tr').find(".acntNum")
		for(var i=0;i<accountList.length;i++){
			if(accountList[i].acntTitle==myinput){
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
		
		<form action="${path }/insertACstatement.do" method="post" id="form1">
		
		<div class="toolbox">
			<div class="toolbar">
				<div>
					<button class="btn-dark">이전전표</button>
					<button class="btn-dark">다음전표</button>
				</div>
				<div>
					<button class="btn-reset" title="저장되지 않은 내용을 모두 삭제하고 새 전표를 입력합니다." type="button">새 전표</button>
					<button class="btn-danger">삭제하기</button>
				</div>
			</div>
			<div class="toolbar">
				<div>
					<label>전표일자<input type="date" name="stmtDate" required="required" value="${fn:substring(stmtList[0].stmtDate,0,10) }"></label>
					<label>전표번호<input name="statementNum" value="${stmtList[0].statementNum }" placeholder="검색할때만 입력하세요"></label>
					<input name="frRegiNum" type="hidden" value="${login}">
					<button type="button" class="btn-search">검색</button>
				</div>
				<div><button type="button" class="btn-submit">등록</button></div>
			</div>
			</div>
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
							<td>
								<input class="lineNum" name="stmtlist[${ii.index }].lineNum" type="hidden" value="${each.lineNum}">
								<input class="acntNum" name="stmtlist[${ii.index }].acntNum" value="${each.acntNum }" required></td>
							<td><input name="stmtlist[${ii.index }].debit" class="debit" value="${each.debit }" required></td>
							<td><input class="acntTitle" placeholder="계정과목명"></td>
							<td><input name="stmtlist[${ii.index }].credit" class="credit" value="${each.credit }" required></td>
							<td><input name="stmtlist[${ii.index }].stmtOpposite" value="${each.stmtOpposite}"></td>
							<td><input name="stmtlist[${ii.index }].remark" value="${each.remark}"></td>
						</tr>
						</c:forEach>
						
						<c:if test="${empty stmtList}">
							<tr>
								<td>
									<input class="lineNum" name="stmtlist[0].lineNum" type="hidden" value="0">
									<input class="acntNum" name="stmtlist[0].acntNum" required></td>
								<td><input name="stmtlist[0].debit" class="debit" required></td>
								<td><input class="acntTitle" placeholder="계정과목명"></td>
								<td><input name="stmtlist[0].credit" class="credit" required></td>
								<td><input name="stmtlist[0].stmtOpposite"></td>
								<td><input name="stmtlist[0].remark"></td>
							</tr>
							<tr>
								<td>
									<input class="lineNum" name="stmtlist[1].lineNum" type="hidden" value="1">
									<input class="acntNum" name="stmtlist[1].acntNum" required="required"></td>
								<td><input name="stmtlist[1].debit" required="required" class="debit"></td>
								<td><input class="acntTitle" placeholder="계정과목명"></td>
								<td><input name="stmtlist[1].credit" required="required" class="credit"></td>
								<td><input name="stmtlist[1].stmtOpposite"></td>
								<td><input name="stmtlist[1].remark"></td>
							</tr>
						</c:if>
					</tbody>
					<tfoot>
						<tr><td>차변합계</td><td class="totaldebit"></td><td>대변합계</td><td class="totalcredit"></td><td>차액</td><td id="DCgap">얼마</td></tr>
					</tfoot>
				</table>
			<div style="display: none"><button id="real-submit-btn"></button></div>
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
	
	function multipathSubmit(formId,realpath){
			let formm=document.querySelector("#"+formId)
			formm.action=realpath;
			$('#real-submit-btn').click();
		}

	document.querySelector('.btn-submit').addEventListener('click',function(){
		let statementNum = $('[name=statementNum]').val();
		if(statementNum==''){
			$('[name=statementNum]').val('WR');
			multipathSubmit('form1',"${path }/insertACstatement.do");
			
		}else{
			multipathSubmit('form1',"${path }/updateACstatement.do");
		}
	})
	
	document.querySelector('.btn-search').addEventListener('click',function(){
		location.href="${path }/selectACstatement.do?stmtDate="+$('[name=stmtDate]').val()+"&statementNum="+$('[name=statementNum]').val()
	})
	
	document.querySelector('.btn-reset').addEventListener('click',function(){
		$('input').val('');
		$('.lineNum').each(function(i){
			$(this).val(i);
			$('[name=frRegiNum]').val('${login}');
		})
	})
	
	</script>
</body>
</html>