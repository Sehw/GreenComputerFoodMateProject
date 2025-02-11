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
            max-width: 500px;
            width: 100%;
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #007bff;
            text-align: center;
        }
</style>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<script>
	const urlParams = new URLSearchParams(window.location.search);
	const errorType = urlParams.get('error'); // error 파라미터 값 가져오기
	
	if(errorType === 'notfound'){
		alert("입력한 정보로 비밀번호 초기화 정보를 찾을수 없습니다.")
	} else if (errorType === 'exception'){
		alert("내부 오류가 발생했습니다. 나중에 다시 시도해 주세요.");
	}
</script>
<body>
<div class="d-flex justify-content-center align-items-center">
    <div class="login-container ">
        <h2 style="color:#87c058">구매자 비밀번호 찾기</h2>
        <form name="frmbyrPWFind" method="post" action="${contextPath}/member/ByrPasswordFind.do">
        	<p>가입때 사용한 이름과 아이디와 이메일을 입력해주십시오.</p>
        	<!-- 아이디 입력 필드 -->
            <div class="mb-3">
                <label for="userID" class="form-label">아이디</label>
                <input type="text" class="form-control" id="byr_id" name="byr_id" placeholder="아이디를 입력하세요" required>
            </div>
            <!-- 이름 입력 필드 -->
            <div class="mb-3">
                <label for="userName" class="form-label">이름</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요" required>
            </div>
            <!-- 이메일 입력 필드 -->
            <div class="mb-3">
                <label for="userEmail" class="form-label">이메일</label>
                <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-success">비밀번호 재설정</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>