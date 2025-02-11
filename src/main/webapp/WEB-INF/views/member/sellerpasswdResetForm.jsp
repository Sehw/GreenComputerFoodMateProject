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
</style>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
</head>
<script>
	function prepareFormSubmission() {
		
		if(document.frmpasswdreset.password.value != document.frmpasswdreset.password_confirm.value){
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
	    return true;
	}
</script>
<body>
<div class="d-flex justify-content-center align-items-center">
    <div class="login-container ">
        <h2 style="color:#87c058">판매자 비밀번호 재설정</h2>
        <form name="frmpasswdreset" method="post" action="${contextPath}/member/sellerPasswordReset" onsubmit="return prepareFormSubmission()">
        	<p>새로 설정하실 비밀번호를 입력해주십시오.</p>
            <!-- 비밀번호 입력 필드 -->
            <div class="mb-3">
                <label for="password" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required>
            </div>
            <!-- 비밀번호확인 입력 필드 -->
            <div class="mb-3">
                <label for="passwordCheck" class="form-label">비밀번호 확인</label>
                <input type="password" class="form-control" id="password_confirm" name="password_confirm" placeholder="비밀번호 확인" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-success">비밀번호 재설정</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>