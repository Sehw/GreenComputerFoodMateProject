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
</head>
<body>
<div class="container-fluid bg-green text-white py-3">
	<div class="row align-items-center">
		<div class="col-md-1 text-center"> <!-- 로고구간 -->
			
		</div>
			<div class="col-md-8 d-flex align-items-center justify-content-start">
			    <a href="${contextPath}/admin/adminMain.do" class="d-flex align-items-center">
			        <img src="${contextPath}/resources/images/logo.png" alt="Logo" class="img-fluid me-2" style="max-width: 130px;"/>
			    </a>
			    <h1 class="display-6 mb-0">FoodMate</h1>
			    
			</div>
        <div class="col-md-2 text-end">
        <a href="${contextPath}/main.do" class="btn btn-primary text-white">사용자 페이지</a>
        <span>관리자 ID : 장원영 </span>
        <a href="#" class="btn btn-danger text-white">로그아웃</a> 
      </div>
</div>
</div>
</body>
</html>