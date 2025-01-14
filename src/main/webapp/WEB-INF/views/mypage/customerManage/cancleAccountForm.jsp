<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style>
	   .signUp-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
</style>
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">회원 탈퇴</h5>
    </div>
    <div class="signUp-container">
			<div class="row justify-content-start">
				<div class="d-flex flex-column align-items-center mb-3">
				    <!-- 닉네임 입력 -->
				    <div class="text-center" style="width: 100%; max-width: 300px;">
				    	<h5>회원 탈퇴</h5>
				    	<p>정말로 회원을 탈퇴하시겠습니까? 탈퇴시 모든 포인트 및 쿠폰은 즉시 삭제되며 현재 아이디는 로그인이 불가해집니다. 탈퇴를 원한다면 비밀번호를 입력후 회원탈퇴를 누르십시오.</p>
				        <label class="form-label">비밀번호 입력</label>
				        <input name="nickname" type="text" class="form-control" placeholder="nickname">
				    </div>
				    <div class="mt-3 row">
						<div class="col-12 text-center">
							<input type="submit" class="btn btn-danger" value="회원탈퇴">
							<input type="reset" class="btn btn-secondary" value="취소">
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
</body>
</html>