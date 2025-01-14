<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<style>
	   .signUp-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
        }
        .card-select {
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card-select:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .card-select.active {
            border: 2px solid #007bff;
            background-color: #007bff;
            color: white;
        }

        .card-select .icon {
            font-size: 2.5rem;
        }

        .card-select .card-text {
            font-size: 1rem;
            font-weight: bold;
        }
</style>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<div class="d-flex justify-content-center align-items-center">
	<div class="signUp-container">
	    <div class="row justify-content-center">
	        <div class="col-md-8">
	            <h1 class="mb-4 text-center">회원 가입 선택</h1>
	           <div class="container mt-5">
			        <h2 class="text-center mb-4">유형 선택</h2>
			        <div class="row justify-content-center">
			            <!-- 일반 회원 -->
			            <div class="col-6 col-md-4 mb-3">
			            	<a href="${contextPath}/member/signUpForm.do" class="text-decoration-none">
			                <div class="card text-center card-select" id="general" onclick="selectCard('general')">
			                    <div class="card-body">
			                        <div class="icon mb-2">👤</div>
			                        <h5 class="card-title">일반</h5>
			                        <p class="card-text">회원가입</p>
			                    </div>
			                </div>
			                </a>
			            </div>
			
			            <!-- 시설 회원 -->
			            <div class="col-6 col-md-4 mb-3">
			            <a href="${contextPath}/member/signUpSellerForm.do" class="text-decoration-none">
			                <div class="card text-center card-select" id="facility" onclick="selectCard('facility')">
			                    <div class="card-body">
			                        <div class="icon mb-2">🛒</div>
			                        <h5 class="card-title">판매자</h5>
			                        <p class="card-text">회원가입</p>
			                    </div>
			                </div>
			              </a>
			            </div>
			        </div>
			    </div>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>