	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<meta charset="UTF-8">
<title>시동구 찾기</title>
</head>
<body>
<form method="post" action="${contextPath}/postfind/postFind2.do">
<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-6 text-center">
	<h1 class="mb-4">시동구 찾기</h1>
	</div>
	</div>
	
	<div class="row justify-content-center">
            <div class="col-md-6">
	<table class="table table-bordered align-middle" style="max-width: 600px; margin: 0 auto;">
		<tr>
			<td width="200"><p align="right">동명칭</td>
			<td width="400"><input type="text" name="dong" id="dong"></td>
		</tr>
		<tr align="center">
			<td>${post.sigungu}</td>
			<td>${post.dong}</td>
	</tr>
	</table>
	<div class="text-center mt-4">
                <button type="submit" class="btn btn-primary me-2">검색하기</button>
                <button type="reset" class="btn btn-secondary">다시 입력</button>
            </div>
	</div>
	</div>
</div>
</form>
</body>
</html>