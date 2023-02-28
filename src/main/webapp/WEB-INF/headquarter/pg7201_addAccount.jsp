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
<title>계정과목 생성</title>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<style>
.search{background-color:lightgray;}
</style>
<script type="text/javascript">
	localStorage.setItem("pageIdx","7201")
	localStorage.setItem("eqIdx","2")
</script>
</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		
		<div class="toolbox">
		<h3>계정과목 검색</h3>
			<form class="toolbar">
			<div>
				<label>계정코드<input placeholder="계정코드 필수입력"></label>
				<label>구분<select><option>자산</option>
							<option>자본</option>
							<option>부채</option>
							<option>비용</option>
							<option>수익</option></select></label>
				<label>계정명<input placeholder="계정명 필수입력"></label>
			</div>
				<button class="btn-search">계정검색</button>
			</form>
		</div>
			<table>
				<thead>
					<tr>
						<th>계정코드</th>
						<th>구분</th>
						<th>계정명</th>
						<th>사용여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<form action="${path }/insertAccount.do">
						<td><input name="acntNum" placeholder="새로운 계정을 등록합니다" required="required"></td>
						<td><select name="acntGroup" required>
							<option>자산</option>
							<option>자본</option>
							<option>부채</option>
							<option>비용</option>
							<option>수익</option>
							</select></td>
						<td><input name="acntTitle" placeholder="새로운 계정을 등록합니다" required></td>
						<td><input value="1" type="hidden" name="acntUsing" required><button class="btn-submit">계정등록</button></td>
					</form>
					</tr>
					<c:forEach items="${accountListtrue }" var="each">
						<tr>
							<td>${each.acntNum }</td>
							<td>${each.acntGroup }</td>
							<td>${each.acntTitle }</td>
							<td><input type="checkbox" checked="${each.acntUsing }"></td>
						</tr>
					</c:forEach>
					<c:forEach items="${accountListfalse }" var="each">
						<tr>
							<td>${each.acntNum }</td>
							<td>${each.acntGroup }</td>
							<td>${each.acntTitle }</td>
							<td><input type="checkbox"></td>
						</tr>
					</c:forEach>
					<tr>
						<td>testing</td>
						<td>자산</td>
						<td>testing</td>
						<td><input type="checkbox"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>