<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전표입력</title>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />

<script type="text/javascript" src="${path }/resource/js/sy_fetchs.js"></script>
	
<script>
localStorage.setItem("pageIdx","7210")
localStorage.setItem("eqIdx","1")
</script>

</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		<h2>전표 입력</h2>
		<hr><br>
		<form action="${path }/insertACstatement.do" method="post" id="form1">
		
		<div class="toolbox">
			<div class="toolbar">
				<div>
					<button class="btn-dark" type="button">이전전표</button>
					<button class="btn-dark" type="button">다음전표</button>
				</div>
				<div>
					<button class="btn-reset" title="저장되지 않은 내용을 모두 삭제하고 새 전표를 입력합니다." type="button">새 전표</button>
					<button class="btn-danger">삭제하기</button>
				</div>
			</div>
			<div class="toolbar">
				<div title="전표번호가 비어있으면 새로운 전표로 입력하고, 그렇지 않으면 기존 전표가 수정됩니다.">
					<label>전표일자<input type="date" name="stmtDate" required="required" value="${fn:substring(stmtList[0].stmtDate,0,10) }"></label>
					<label>전표번호<input name="statementNum" value="${stmtList[0].statementNum }" placeholder="검색할때만 입력하세요"></label>
					<input name="frRegiNum" type="hidden" value="${login.frRegiNum }">
					<button type="button" class="btn-secondary">검색</button>
				</div>
				<div><button type="button" class="btn-primary">등록</button></div>
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
								<input class="acntNum" name="stmtlist[${ii.index }].acntNum" value="${each.acntNum }" required list="numList"></td>
							<td><input name="stmtlist[${ii.index }].debit" class="debit" value="${each.debit }" required></td>
							<td><input class="acntTitle" placeholder="계정과목명" list="titleList"></td>
							<td><input name="stmtlist[${ii.index }].credit" class="credit" value="${each.credit }" required></td>
							<td><input name="stmtlist[${ii.index }].stmtOpposite" value="${each.stmtOpposite}"></td>
							<td><input name="stmtlist[${ii.index }].remark" value="${each.remark}"></td>
						</tr>
						</c:forEach>
						
						<c:if test="${empty stmtList}">
							<tr>
								<td>
									<input class="lineNum" name="stmtlist[0].lineNum" type="hidden" value="0">
									<input class="acntNum" name="stmtlist[0].acntNum" required list="numList"></td>
								<td><input name="stmtlist[0].debit" class="debit" required></td>
								<td><input class="acntTitle" placeholder="계정과목명" list="titleList"></td>
								<td><input name="stmtlist[0].credit" class="credit" required></td>
								<td><input name="stmtlist[0].stmtOpposite"></td>
								<td><input name="stmtlist[0].remark"></td>
							</tr>
							<tr>
								<td>
									<input class="lineNum" name="stmtlist[1].lineNum" type="hidden" value="1">
									<input class="acntNum" name="stmtlist[1].acntNum" required="required" list="numList"></td>
								<td><input name="stmtlist[1].debit" required="required" class="debit"></td>
								<td><input class="acntTitle" placeholder="계정과목명" list="titleList"></td>
								<td><input name="stmtlist[1].credit" required="required" class="credit"></td>
								<td><input name="stmtlist[1].stmtOpposite"></td>
								<td><input name="stmtlist[1].remark"></td>
							</tr>
						</c:if>
					</tbody>
					<tfoot>
						<tr><td>차변합계</td><td class="totaldebit"></td><td>대변합계</td><td class="totalcredit"> </td><td>차액</td><td id="DCgap">0</td></tr>
					</tfoot>
				</table>
			<div style="display: none"><button id="real-submit-btn"></button></div>
<datalist id="numList"></datalist>
<datalist id="titleList"></datalist>
			</form>
		</div>
	</div>
	
	
<script>
	
function totalcalculator(whichone,whichtotal){
	let totalsum=0;
	let onelist=document.querySelectorAll(whichone);
	for(var i=0;i<onelist.length;i++){
		totalsum+=Number(onelist[i].value);
	}	//차변or대변 합계구하기
		$(whichtotal).text(totalsum);	//구한거 두번째변수에 넣음
	let tc = Number($('.totalcredit').text());
	let td = Number($('.totaldebit').text());
	$('#DCgap').text(tc-td)		//차변-대변 값 넣기
	}
	
totalcalculator('.debit','.totaldebit');	//로딩할때 합계계산
totalcalculator('.credit','.totalcredit');
	
	//새로 입력할때마다 합계 계산
	$('.credit').on('keyup',function(){
		totalcalculator('.credit','.totalcredit');
	})
	
	$('.debit').on('keyup',function(){
		totalcalculator('.debit','.totaldebit');
	})	
	
	//제출 눌렀을때 전표번호가 없으면 insert,있으면 update로 real-submit-btn 누르기
	document.querySelector('.btn-primary').addEventListener('click',function(){
		let statementNum = $('[name=statementNum]').val();
		if(statementNum==''){
			$('[name=statementNum]').val('WR');
			multipathSubmit('form1',"${path }/insertACstatement.do");
			
		}else{
			multipathSubmit('form1',"${path }/updateACstatement.do");
		}
	})
	
	//검색하기 눌렀을때는 쿼리스트링으로 제출
	document.querySelector('.btn-secondary').addEventListener('click',function(){
		location.href="${path }/selectACstatement.do?stmtDate="+$('[name=stmtDate]').val()+"&statementNum="+$('[name=statementNum]').val()+"&frRegiNum="+$('[name=frRegiNum]').val()
	})
	
	//리셋누르면 다 없어지고 라인넘버 순서대로 채움, 사업자번호 채우기
	document.querySelector('.btn-reset').addEventListener('click',function(){
		$('input').val('');
		$('.lineNum').each(function(i){
			$(this).val(i);
			$('[name=frRegiNum]').val('${login.frRegiNum}');
		})
	})


	//fetch로 계정받아와서 데이터리스트 만들기
	function fetchlist(){
		let url="/ferp/selectAccountJson.do"
	 	fetch(url).then(function(response){return response.json() }).then(function(json){
	 		accountList=json.accountList;
	 		makeAccountOption(accountList);
	 		$('.acntNum').each(function(){	//불러와진 전표번호에 맞춰서 전표명 입력
	 			var myinput = $(this).val();
	 			var myresult = $(this).parents('tr').find(".acntTitle")
	 			for(var i=0;i<accountList.length;i++){
	 				if(accountList[i].acntNum==myinput){
	 					myresult.val(accountList[i].acntTitle);
	 					break;
	 				}else{
	 					myresult.val('');
	 				}
	 			}
	 		})
	 	}).catch(function(err){console.log(err)})
	}
	
	fetchlist();
	
	
	//계정목록 가져온거 입력할때마다 적용되게 하기
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
</script>

</body>
</html>