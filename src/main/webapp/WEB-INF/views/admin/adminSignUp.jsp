<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #007bff;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-size: 16px;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .btn {
            width: 100%;
            padding: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>관리자 회원가입</h2>
        <form action="${contextPath}/admin/signupAction.do" method="POST">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="role">역할</label>
                <select id="role" name="role">
                    <option value="super_admin">슈퍼 관리자</option>
                    <option value="admin">일반 관리자</option>
                </select>
            </div>
            <!-- 인증번호 발급 버튼과 입력란 -->
            <div class="form-group">
                <label for="verificationCode">인증번호</label>
                <div style="display: flex;">
                    <input type="text" id="verificationCode" name="verificationCode" required style="width: 80%;">
                    <button type="button" class="btn" onclick="sendVerificationCode()">인증번호 발급</button>
                </div>
            </div>
            <button class="btn" type="submit">회원가입</button>
        </form>
    </div>

    <script>
        function sendVerificationCode() {
            const email = document.getElementById('email').value;
            
            if (!email) {
                alert('이메일을 입력해 주세요.');
                return;
            }

            // 여기에 실제 인증번호 발급 로직을 추가할 수 있습니다.
            // 예를 들어, 이메일을 서버로 보내고 인증번호를 발급받은 후,
            // 그 값을 사용자에게 보내는 등의 작업을 할 수 있습니다.

            // 인증번호 발급 완료 후 메시지 표시
            alert('인증번호가 발송되었습니다.');

            // 인증번호 임의로 설정 (예시로 '123456' 입력)
            const verificationCode = '123456'; 

            // 인증번호를 텍스트 필드에 입력
            document.getElementById('verificationCode').value = verificationCode;
        }
    </script>
</body>
</html>
