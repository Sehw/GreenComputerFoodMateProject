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
			    <a href="${contextPath}/main.do" class="d-flex align-items-center">
			        <img src="${contextPath}/resources/images/logo.png" alt="Logo" class="img-fluid me-2" style="max-width: 130px;"/>
			    </a>
			    <h1 class="display-6 mb-0">FoodMate</h1>
			    <div class="input-group mx-5" style="max-width: 600px;">
					   <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					        검색 옵션
					    </button>
					    <ul class="dropdown-menu">
					        <li><a class="dropdown-item" href="#">Action</a></li>
					        <li><a class="dropdown-item" href="#">Another action</a></li>
					        <li><a class="dropdown-item" href="#">Something else here</a></li>
					        <li><hr class="dropdown-divider"></li>
					        <li><a class="dropdown-item" href="#">Separated link</a></li>
					    </ul>
					  <input type="text" class="form-control custom-input" aria-label="검색창" aria-describedby="button-addon2">
					  <button class="btn btn-outline-secondary custom-button" type="button" id="button-addon2" style="background-color: #74b243;"><i class="fas fa-search"></i></button>
				</div>
			</div>
        <div class="col-md-2 text-end">
        	<c:choose>
        		<c:when test="${isLogOn == true && member != null }">
        			<h3>환영합니다. ${member.name }님!</h3>
        			<a href="${contextPath}/member/logout.do" class="btn btn-light btn-sm">로그아웃</a>
        		</c:when>
        		<c:otherwise>
        			<a href="${contextPath}/member/loginForm.do" class="btn"><i class="fas fa-user"></i></a>
        			<a href="${contextPath}/mypage/mypageForm.do" class="btn"><i class="fas fa-pen"></i></a>
        			<a href="${contextPath}/cart/cartForm.do" class="btn"><i class="fas fa-cart-shopping"></i></a>
        		</c:otherwise>
        	</c:choose>
         </div>
</div>
</div>
</body>
</html>