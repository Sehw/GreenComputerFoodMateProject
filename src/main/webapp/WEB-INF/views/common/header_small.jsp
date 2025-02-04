<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
<meta charset="UTF-8">
<title>상단부</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
	.h1 {
		font-family: "Noto Sans KR", serif;
	}
</style>
</head>
<body>
<div class="container-fluid bg-orange text-white py-3">
    <div class="row align-items-center justify-content-center text-center">
        <!-- 로고 구간 -->
        <div class="col-md-8 d-flex align-items-center justify-content-center">
            <a href="${contextPath}/main" class="d-flex align-items-center">
                <img id="sitelogo" src="${contextPath}/resources/images/foodmatelogo.png" alt="푸드메이트로고"  class="img-fluid me-4" style="max-width: 160px;">
            </a>
            <h1 class="display-6 mb-0 ms-2">FoodMate</h1>
        </div>
    </div>
</div>

</body>
</html>