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
</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
			<input placeholder="계정코드"> <select><option>자산</option></select>
			<input placeholder="계정명"> <input type="submit" value="계정검색">

			<table class="table m-3">
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
						<td><input class="form-control"></td>
						<td><input class="form-control"></td>
						<td><input class="form-control"></td>
						<td><button class="btn btn-primary">계정등록</button></td>
					</tr>
					<c:forEach items="${accountList }" var="each">
						<tr>
							<td>${each.acntNum }</td>
							<td>${each.acntGroup }</td>
							<td>${each.acntTitle }</td>
							<td><input type="checkbox" checked="${each.acntUsing }"></td>
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