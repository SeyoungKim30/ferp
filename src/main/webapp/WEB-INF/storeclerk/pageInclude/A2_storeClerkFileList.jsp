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
<link rel="stylesheet" href="${path}/resource/css/A2_fileCss.css">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".fileBtn").click(function(){
			$.ajax({
				url:"${path}/fileListAjaxSch.do",
				type:"post", 
				data:"clerkNum="+$("#clerknum").text()+"&frRegiNum="+${login.frRegiNum}, 
				dataType:"json", 
				success:function(data){
					var flist = data.flist
					var show=""
					$(flist).each(function(i,f){
						console.log(f)
						console.log(i)
						show+='<form id="fileFrm'+f.cnt+'" class="fileFrm" method="post">'
						show+='<div class="row">'
						show+='<div class="tdDiv" style="width: 5%;">'
						show+='<input type="text" value="'+f.cnt+'" readOnly disabled>'
						show+='</div>'
						show+='<div class="tdDiv" style="width: 30%;">'
						show+='<input type="text" name="fname" value="'+f.fname+'" readOnly />'
						show+='</div>'
						show+='<div class="tdDiv" style="width: 15%;">'
						show+='<input type="text" value="'+f.regDte+'" readOnly disabled>'
						show+='</div>'
						show+='<div class="tdDiv" style="width: 15%;">'
						show+='<input type="text" value="'+f.uptDte+'" readOnly disabled>'
						show+='</div>'
						show+='<div class="tdDiv" style="width: 15%;">'
						if(f.fileInfo == null){
							show+='<input type="text" name="fileInfo" value="" />'							
						}else{
							show+='<input type="text" name="fileInfo" value="'+f.fileInfo+'" />'
						}
						show+='</div>'
						show+='<div class="tdDiv" style="width: 10%;">'
						show+='<button type="button" class="uptBtn fileUpt" onclick="fileUpt('+f.cnt+')">??????</button>'
						show+='</div>'
						show+='<div class="tdDiv" style="width: 10%;">'
						show+='<button type="button" class="delBtn fileDel" onclick="fileDel('+f.cnt+')">??????</button>'
						show+='</div>'
						show+='<input name="clerkNum" value="'+f.clerkNum+'" type="hidden">'
						show+='<input name="frRegiNum" value="${login.frRegiNum }" type="hidden">'
						show+='</div>'
						show+='</form>'
						
					})
					$(".listDiv").html(show)
				},
				error:function(err){
					console.log(err)
				}
			})
		})
	});
</script>
</head>
<body>
	<div class="row">
		<div class="thDiv" style="width: 5%;">??????</div>
		<div class="thDiv" style="width: 30%;">?????????</div>
		<div class="thDiv" style="width: 15%;">?????????</div>
		<div class="thDiv" style="width: 15%;">?????????</div>
		<div class="thDiv" style="width: 15%;">????????????</div>
		<div class="thDiv" style="width: 10%;">??????</div>
		<div class="thDiv" style="width: 10%;">??????</div>
	</div>
	<div class="listDiv">
	</div>
</body>
<script type="text/javascript">
	function fileUpt(i){
		if(confirm("?????????????????????????")){
			$("#fileFrm"+i).attr("action","${path}/uptClerkFile.do").submit();
		}
	}
	function fileDel(i){
		if(confirm("?????????????????????????")){
			$("#fileFrm"+i).attr("action","${path}/delClerkFile.do").submit();
		}
	}
</script>
</html>