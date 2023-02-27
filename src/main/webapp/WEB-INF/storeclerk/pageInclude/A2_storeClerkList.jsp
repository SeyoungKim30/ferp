<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<link rel="stylesheet" href="${path}/resource/css/reset.css">
<link rel="stylesheet" href="${path}/resource/css/A2_jhCSS.css">
<link rel="stylesheet" href="${path}/resource/css/A2_storeclerkJH.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
//	localStorage.setItem("empPage","empList")
	$(document).ready(function() {
		$(".regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				//localStorage.setItem("pageLoc","inDiv")
				regAjax("insStoreclerk.do")
			}
		})
		function regAjax(url) {
			$.ajax({
				type : "post",
				url : "/ferp/" + url,
				data : $("#regForm").serialize(),
				dataType : "json",
				success : function(data) {
					alert(data.msg)
					location.reload()
				},
				error : function(err) {
					console.log(err)
				}
			})
		}
		$(".firstOp").click(function(){
			//localStorage.setItem("pageLoc","inDiv")
			location.href="${path}/storeClerkList.do"
		})
		$(".secondOp").click(function(){
			//localStorage.setItem("pageLoc","inDiv")
		})
		$(".thirdOp").click(function(){
			//localStorage.setItem("pageLoc","inDiv")
		})
		$(".fourthOp").click(function(){
			//localStorage.setItem("pageLoc","inDiv")
			location.href="${path}/clerkPayList.do"
		})
	});
</script>
</head>
<body>
	<div class="containerJ">
		<div class="row">
			<div class="selectedFunction firstOp">정보 조회</div>
			<div class="unselectedFunction secondOp">근태 조회</div>
			<div class="unselectedFunction thirdOp">스케쥴 관리</div>
			<div class="unselectedFunction fourthOp">급여액 조회</div>
		</div>
		<div class="border fstCon">
			<div class="border margin">
				<form id="regForm" method="post">
					<div class="row">
						<input type="text" name="frRegiNum" class="margin regList" value="fr01" placeholder="사업자등록번호" readOnly required/>
						<input type="text" name="hourlyPay" class="margin regList" placeholder="시급" required/>
						<input type="radio" class="margin-s" name="gender" value="남" checked="checked">
							<label class="margin-s padding-up">남</label>
						<input type="radio" class="margin-s" name="gender" value="여">
							<label class="margin-s padding-up">여</label>
					</div>
					<div class="row">
						<input type="text" name="clerkName" class="margin-tn regList" placeholder="직원명" required/>
						<input type="text" name="residentNum" class="margin-tn regList" placeholder="주민등록번호" required/>
						<input type="text" name="phoneNum" class="margin-tn regList" placeholder="전화번호" required/>
					</div>
					<div class="row">
						<input type="text" name="address" class="margin-tn regList" style="width:84%;" placeholder="주소" required/>
						<button type="button" class="regBtn">등록</button>
					</div>
				</form>
				<form id="pageFrm">
					<input type="hidden" name="curPage" value="${SCsch.curPage}" />
				</form>
			</div>
			<div class="margin">
				<div class="row">
					<div class="thDiv" style="width:13%;">직원명</div>
					<div class="thDiv" style="width:5%;">성별</div>
					<div class="thDiv" style="width:15%;">전화번호</div>
					<div class="thDiv" style="width:15%;">주민등록번호</div>
					<div class="thDiv" style="width:28%;">주소</div>
					<div class="thDiv" style="width:7%;">시급</div>
					<div class="thDiv" style="width:7%;">파일</div>
					<div class="thDiv" style="width:10%;">수정/삭제</div>
				</div>
				<c:forEach var="sc" items="${scList }">
					<form id="uptForm${sc.clerkNum }" method="post">
						<div class="row reg${sc.clerkNum }">
							<div style="display: none;">
								<input type="text" name="clerkNum" value="${sc.clerkNum }"/>
							</div>
							<div class="tdDiv" style="width:13%;">
								<input type="text" class="listInput i${sc.clerkNum }" name="clerkName" value="${sc.clerkName }" disabled/>
							</div>
							<div class="tdDiv" style="width:5%;">
								<input type="text" class="listInput i${sc.clerkNum }" name="gender" style="width:100%;" value="${sc.gender }" disabled/>
							</div>
							<div class="tdDiv" style="width:15%;">
								<input type="text" class="listInput i${sc.clerkNum }" name="phoneNum" style="width:100%;" value="${sc.phoneNum }" disabled/>
							</div>
							<div class="tdDiv" style="width:15%;">
								<input type="text" class="listInput i${sc.clerkNum }" name="residentNum" style="width:100%;" value="${sc.residentNum }" disabled/>
							</div>
							<div class="tdDiv" style="width:28%;">
								<input type="text" class="listInput i${sc.clerkNum }" name="address" style="width:100%;" value="${sc.address }" disabled/>
							</div>
							<div class="tdDiv" style="width:7%;">
								<input type="text" class="listInput i${sc.clerkNum }" name="hourlyPay" style="width:100%;" value="${sc.hourlyPay }" disabled/>
							</div>
							<div class="tdDiv" style="width:7%;">
								<button class="fileBtn">파일</button>									
							</div>
							<div class="tdDiv" style="width:10%;">
								<button type="button" class="uptCfm" style="display:none;">완료</button>
								<button type="button" class="uptBtn upt${sc.clerkNum }" onclick="location.href='javascript:activateInput(${sc.clerkNum })'">수정</button>
								<button type="button" class="delBtn" onclick="location.href='javascript:delInfo(${sc.clerkNum })'">삭제</button>
							</div>
						</div>
					</form>
				</c:forEach>
				<div class="row center">
					<button name="prev" class="pgBtnPrev" onclick="location.href='javascript:goPage(${SCsch.startBlock-1});'">
						&lt;
					</button>
					<c:forEach var="cnt" begin="${SCsch.startBlock }" end="${SCsch.endBlock}">
				  		<button class="pgBtn pg${cnt}" onclick="location.href='javascript:goPage(${cnt});'">
							${cnt}
						</button>
				  	</c:forEach>
				  	<button name="next" class="pgBtnNext" onclick="location.href='javascript:goPage(${SCsch.startBlock+1});'">
						&gt;
					</button>
				</div>    
				<script type="text/javascript">
					function goPage(cnt){
						$("[name=curPage]").val(cnt);
						localStorage.setItem("sclistPg",cnt)
						//localStorage.setItem("pageLoc","inDiv")
						$("#pageFrm").submit()
					}
					if(${SCsch.curPage==1}){
						$("[name=prev]").attr("disabled",true)
					}
					if(${SCsch.curPage==SCsch.endBlock}){
						$("[name=next]").attr("disabled",true)
					}
					if(${SCsch.curPage}==localStorage.getItem("sclistPg")){
						$(".pg"+localStorage.getItem("sclistPg")).css("backgroundColor","#a4a4a4")
						$(".pg"+localStorage.getItem("sclistPg")).css("color","white")
					}
					function activateInput(i){
						if(confirm("수정하시겠습니까?")){
							$(".i"+i).attr("disabled",false)
							$(".uptCfm").css("display","inline")
							$(".uptBtn").css("display","none")
						}
						$(".uptCfm").click(function(){
							if(confirm("변경사항을 저장하시겠습니까?")){
								//localStorage.setItem("pageLoc","inDiv")
								uptAjax("uptStoreClerk.do",i)				
							}
						})
					}
					function uptAjax(url,i) {
						$.ajax({
							type : "post",
							url : "/ferp/" + url,
							data : $("#uptForm"+i).serialize(),
							dataType : "json",
							success : function(data) {
								console.log(data)
								location.reload()
							},
							error : function(err) {
							console.log($("#uptForm"+i).serialize())
							console.log($("#uptForm"+i).serialize())
								console.log(err)
							}
						})
					}
					
					function delInfo(i){
						if(confirm("직원정보를 삭제하시겠습니까?")){
							//localStorage.setItem("pageLoc","inDiv")
							delAjax("delStoreClerk.do",i)				
						}
					}
					function delAjax(url,i) {
						$.ajax({
							type : "post",
							url : "/ferp/" + url,
							data : $("#uptForm"+i).serialize(),
							dataType : "json",
							success : function(data) {
								console.log(data)
								alert(data.msg)
								location.reload()
							},
							error : function(err) {
							console.log($("#uptForm"+i).serialize())
							console.log($("#uptForm"+i).serialize())
								console.log(err)
							}
						})
					}
				</script>
			</div>
		</div>
	</div>
</body>
</html>