<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
<style>
	.container-fluid h3 a {
	    text-decoration: none; /* 링크 밑줄 제거 */
	    color: white; /* 텍스트 색상 */
	}
	
	.container-fluid h3 a:hover {
	    text-decoration: underline; /* hover 상태에서 밑줄 표시 */
	    transition: border-bottom 0.2s;
	}
</style>
<meta charset="UTF-8">
<title>상단메뉴</title>
</head>
<div class="container-fluid bg-green2 text-white py-3 d-flex align-items-center justify-content-between shadow-sm">
    <div class="d-flex justify-content-center gap-5 flex-grow-1">
        <h3><a href="${contextPath}/main.do">추천</a></h3>
        <h3><a href="#">분류</a></h3>
        <h3><a href="#">상품 구매</a></h3>
        <h3><a href="#">커뮤니티</a></h3>
    </div>
    <h3 class="me-3"><a href="#">메이트스토어</a></h3>
</div>
<body>
</body>
</html>