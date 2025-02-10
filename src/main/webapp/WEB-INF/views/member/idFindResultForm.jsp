<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<style>
	   .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 410px;
            width: 100%;
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #007bff;
            text-align: center;
        }
      	
	    .result-text {
	        font-size: 18px; /* 글씨 크기 조정 */
	        font-weight: bold; /* 굵기 적용 */
	        text-align: center; /* 가운데 정렬 */
	        margin: 10px 0; /* 위아래 여백 추가 */
	    }
	    .result-highlight {
	        font-size: 22px; /* 아이디 크기 더 크게 */
	        font-weight: bold;
	        color: #2E7D32; /* 진한 녹색으로 강조 */
	        text-align: center;
	    }
</style>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>
<div class="d-flex justify-content-center align-items-center">
    <div class="login-container ">
        <h2 style="color:#87c058">아이디 찾기 결과</h2>
        	<p class="result-text">${name}님의 아이디는</p>
            <p class="result-highlight">${foundId}</p>
            <p class="result-text">입니다.</p>
            <div class="d-grid">
                <button type="button" class="btn btn-success" onclick="location.href='${contextPath}/member/loginForm'">로그인</button>
            </div>
    </div>
</div>
</body>
</html>