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
<title>매장 재고 조회</title>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="/resource/css/store_main_index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h2>매장 재고 조회</h2>
	<div class="container">
	<input placeholder="계정코드">
	<select><option>자산</option></select>
	<input placeholder="계정명">
	<input type="submit" value="계정검색">
	<table class="table m-3">
		<thead>
			<tr><th>계정코드</th><th>구분</th><th>계정명</th><th>사용여부</th></tr>
		</thead>
		<tbody>
			<tr><td><input class="form-control"></td>
				<td><input class="form-control"></td>
				<td><input class="form-control"></td>
				<td><button class="btn btn-primary">계정등록</button></td></tr>
			<tr><td>10100</td><td>자산</td><td>현금</td><td><input type="checkbox"></td></tr>
			<tr><td>10100</td><td>자산</td><td>현금</td><td><input type="checkbox"></td></tr>
			<tr><td>10100</td><td>자산</td><td>현금</td><td><input type="checkbox"></td></tr>
			<tr><td>10100</td><td>자산</td><td>현금</td><td><input type="checkbox"></td></tr>
		</tbody>
	</table>
	</div>
</body>
</html>