<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link rel="stylesheet" href="${path}/resource/css/A2_modalCSS.css">
<link rel="stylesheet" href="${path}/resource/css/A2_defectCSS.css">
<link rel="stylesheet" href="${path}/resource/css/A2_fileCss.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".monthDiv").click(function() {
			$("[name=orderDateMonth]").val(this.innerText)
			$("#reqSchFrm").submit()
		})
		$("#schFrmBtn").click(function() {
			if (!$("#monthCheck").is(':checked')) {
				$("[name=orderDateMonth]").val("")
			}
			$("#reqSchFrm").submit()
		})
		$("#rstFrmBtn").click(function() {
			$("[name=orderDateMonth]").val("")
			$("[name=productName]").val("")
			$("[name=category]").val("")
			$("#reqSchFrm").submit()
		})
		$("div.monthDiv").filter(function() {
			return $(this).text() === '${dSch.orderDateMonth}';
		}).css({
			"backgroundColor" : "#007bff",
			"color" : "white",
			"borderColor" : "#007bff"
		})
		
		let params = new URL(document.location).searchParams;
		let orNm = params.get("orderNum")
		let prNm = params.get("productNum")
		let orDt = params.get("orderDate")
		let prodN = params.get("productNameFrm")
		$(".productNameFrm").val(prodN)
		if(orNm==null || prNm==null || orDt==null || prodN==null){
			$("[name=orderNum], .productNameFrm, [name=type], [name=methods], [name=file], .regBtn, .upload-name").attr("disabled",true)
		}
	});
</script>
</head>
<!--  
?????? ?????? ??????, ????????? ??????, ??????(??????/?????????/??????) ??????, ?????? ??????(??????/?????????) ??????, ????????? ??????(?????? ???)
-->
<body>
	<h2 class="h2Title">?????? ?????? ??????</h2>
	<br>
	<div>
		<div class="toolbox">
		<h3>??????/?????????/?????? ?????? ?????? ??????</h3>
			<form id="regForm" method="post" enctype="multipart/form-data" action="${path }/insDefectProd.do">
				<br>
				<div class="row">
					<input type="hidden" name="frRegiNum" value="${login.frRegiNum }"/>
					<input type="hidden" name="orderDate" value="${param.orderDate }" required/>
					<div class="col margin-tn w20">
						<label>?????? ??????</label> 
						<input type="text" name="orderNum" value="${param.orderNum }" class="margin-tln regList" required />
					</div>
					<div class="col margin-tn w20">
						<label>?????????</label> 
						<input type="text" class="margin-tln regList productNameFrm" required />
						<input type="hidden" name="productNum" value="${param.productNum }" class="margin-tln regList" placeholder="" required />
					</div>
					<div class="col margin-tn w20">
						<label>??????</label> 
						<select name="type" class="regList" required>
							<option value="">---</option>
							<option>?????????</option>
							<option>??????</option>
							<option>??????</option>
						</select>
					</div>
					<div class="col margin-tn w20">
						<label>????????????</label> 
						<select name="methods" class="regList" required>
							<option value="">---</option>
							<option>??????</option>
							<option>?????????</option>
						</select>
					</div>
				</div>
				<div class="filebox">
					<div class="margin-sm fileInput" style="margin-left:20px;">
						<input class="upload-name" style="width:84%;" value="????????????" placeholder="????????????"><label for="file">????????????</label> 
						<input type="file" id="file" name="file" onchange="filename()">
					</div>
				</div>
				<div class="right">
					<button type="submit" class="regBtn" style="margin-right: 80px;">??????</button>
				</div>
			</form>
			<br>
		</div>
		<div>
			<br>
			<h2 class="h2Title">?????? ?????? ?????? ??????</h2>
			<br>
			<div class="toolbox">
				<div class="row margin-sm">
					<div class="col left">
						<div class="row" style="margin-top: 7px;">
							<input type="checkbox" id="monthCheck" checked> 
							<label>??? ??????</label>
						</div>
						<div class="row">
							<c:forEach var="i" begin="1" end="12">
								<div class="monthDiv">${i }???</div>
							</c:forEach>
						</div>
					</div>
					<div>
						<form id="reqSchFrm" method="post">
							<div class="row schDiv schDiv-padding">
								<div class="col left">
									<label>????????????</label> <select name="category">
										<option value="${dSch.category }">${dSch.category }</option>
										<option disabled>-----</option>
										<c:forEach var="c" items="${category }">
											<option>${c.category}</option>
										</c:forEach>
									</select>
								</div>
								&nbsp;&nbsp;&nbsp;
								<div class="col left">
									<label>?????????</label> 
									<input type="text" name="productName" value="${dSch.productName }">
								</div>
								<button type="button" id="schFrmBtn">??????</button>
								<button type="button" id="rstFrmBtn">?????????</button>
							</div>
							<input type="hidden" name="orderDateMonth" value="${dSch.orderDateMonth }"> 
							<input type="hidden" name="frRegiNum" value="${login.frRegiNum}">
						</form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="thDiv" style="width: 15%;">????????????</div>
				<div class="thDiv" style="width: 20%;">?????????</div>
				<div class="thDiv" style="width: 20%;">?????????</div>
				<div class="thDiv" style="width: 15%;">??????</div>
				<div class="thDiv" style="width: 10%;">????????????</div>
				<div class="thDiv" style="width: 10%;">????????????</div>
				<div class="thDiv" style="width: 10%;">??????</div>
			</div>
			<c:forEach var="dl" items="${defectlist }">
				<form id="uptForm${dl.defNum}" method="post" class="">
					<div class="row reg" onclick="showImg('${dl.defNum}')" onmouseout="hideImg('${dl.defNum}')">
						<div style="display: none;"></div>
						<div class="tdDiv" style="width: 15%;">${dl.defNum}</div>
						<div class="tdDiv" style="width: 20%;">${dl.productName }</div>
						<div class="tdDiv left" style="width: 20%;">${dl.applyDate }</div>
						<div class="tdDiv" style="width: 15%;">${dl.type }</div>
						<div class="tdDiv" style="width: 10%;">${dl.methods }</div>
						<div class="tdDiv" style="width: 10%;">${dl.state }</div>
						<div class="tdDiv" style="width: 10%;">
							<button type="button" class="delBtn" onclick="delDefect('${dl.defNum}')">??????</button>
						</div>
						<input type="hidden" name="defNum" value="${dl.defNum}"/>
						<input type="hidden" name="img" value="${dl.img}"/>
					</div>
					<div>
						<img src="${path }/resource/img/defectOrder/${dl.img}" class="defectImg defectImg${dl.defNum}" onerror="this.onerror=null;this.src='${path }/resource/img/noimg.png'" />
					</div>
				</form>
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript">
		function showImg(i) {
			$(".defectImg" + i).css("display", "block")
		}
		function hideImg(i) {
			$(".defectImg" + i).css("display", "none")
		}
		function filename(){
			var fileInput = document.getElementById("file");
			var files = fileInput.files;
			var i = files.length
			if(i == 1){
				$('.upload-name').val($("#file").val())			
			}else{
				$('.upload-name').val($("#file").val()+" ??? "+parseInt(i-1) + "???")			
			}
		}
		function delDefect(i){
			if(confirm("?????????????????????????")){
				$("#uptForm"+i).attr("action","${path}/delDefectProd.do").submit();
			}
		}
	</script>
</body>
</html>