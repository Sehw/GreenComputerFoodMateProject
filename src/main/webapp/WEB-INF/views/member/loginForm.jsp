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
            max-width: 400px;
            width: 100%;
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #007bff;
            text-align: center;
        }
</style>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<div class="d-flex justify-content-center align-items-center">
    <div class="login-container ">
        <h2 style="color:#87c058">로그인</h2>
        <form name="frmLogin" method="post" action="${contextPath}/member/login.do">
            <!-- 아이디 입력 필드 -->
            <div class="mb-3">
                <label for="userID" class="form-label">아이디</label>
                <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required>
            </div>
            <!-- 비밀번호 입력 필드 -->
            <div class="mb-3">
                <label for="passwd" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" required>
            </div>
            <!-- 로그인 버튼 -->
            <div class="d-grid">
                <button type="submit" class="btn btn-success">로그인</button>
            </div>
            <span class="mt-3 d-inline-block">
            	<a href="${contextPath}/member/idFindForm.do" class="link_find">아이디</a>
                            / 
                <a href="${contextPath}/member/passwdFindForm.do" class="link_find">비밀번호 찾기</a>
                        	/
                <a href="${contextPath}/member/signUpContactForm.do" class="link_find">회원가입</a>
            </span>
            <div class="container mt-2 d-inline-block">
			    <div class="row">
			        <div class="col-2">
			            <a href="#"><img src="${contextPath}/resources/images/Naver.png" alt="네이버 로그인" class="img-fluid"></a>
			        </div>
			        <div class="col-2">
			            <a href="#"><img src="${contextPath}/resources/images/Kakao.png" alt="카카오 로그인" class="img-fluid"></a>
			        </div>
			        <div class="col-2">
			            <a href="#"><img src="${contextPath}/resources/images/Google.png" alt="구글 로그인" class="img-fluid"></a>
			        </div>
			        <div class="col-2">
			            <a href="#"><img src="${contextPath}/resources/images/Apple.png" alt="애플 로그인" class="img-fluid"></a>
			        </div>
			    </div>
			</div>
        </form>
    </div>
</div>
</body>
</html>