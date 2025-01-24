<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
        .nav-tabs .nav-link {
        	color: #74b243;  /* 기본 글자색 (파란색) */
	    }
	    .nav-tabs .nav-link.active {
	        color: #fa9820;  /* 활성화된 탭 (초록색) */
	        font-weight: bold;
	    }
	    .nav-tabs .nav-link:hover {
        	color: #74b243  /* 호버 시 (빨간색) */
	    }
	    .tab-pane {
		    display: none; /* 기본적으로 숨김 */
		}
		.tab-pane.active {
		    display: block; /* 활성화된 탭만 표시 */
		}
</style>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<div class="d-flex justify-content-center align-items-center">
    <div class="login-container ">
    <ul class="nav nav-tabs mb-3 d-flex" id="loginTab" role="tablist">
	    <li class="nav-item flex-fill text-center" role="presentation">
		    <button class="nav-link active w-100" id="home-tab" data-bs-toggle="tab" data-bs-target="#userTab" type="button" role="tab" aria-controls="userTab" aria-selected="true">사용자</button>
		  </li>
		  <li class="nav-item flex-fill text-center" role="presentation">
		    <button class="nav-link w-100" id="profile-tab" data-bs-toggle="tab" data-bs-target="#sellerTab" type="button" role="tab" aria-controls="sellerTab" aria-selected="false">판매자</button>
		  </li>
    </ul>
    <div id="userTab" class="tab-pane fade show active">
        <h2 style="color:#87c058">사용자 로그인</h2>
        <form name="frmLogin" method="post" action="${contextPath}/member/login">
            <!-- 아이디 입력 필드 -->
            <div class="mb-3">
                <label for="userID" class="form-label">아이디</label>
                <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required>
            </div>
            <!-- 비밀번호 입력 필드 -->
            <div class="mb-3">
                <label for="passwd" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
            </div>
            <!-- 로그인 버튼 -->
            <div class="d-grid">
                <button type="submit" class="btn btn-success">로그인</button>
            </div>
            <span class="mt-3 d-inline-block">
            	<a href="${contextPath}/member/idFindForm" class="link_find">아이디</a>
                            / 
                <a href="${contextPath}/member/passwdFindForm" class="link_find">비밀번호 찾기</a>
                        	/
                <a href="${contextPath}/member/signUpContactForm" class="link_find">회원가입</a>
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
    <div id="sellerTab" class="tab-pane fade">
        <h2 style="color:#87c058">판매자 로그인</h2>
        <form name="frmLogin" method="post" action="${contextPath}/member/login">
            <!-- 아이디 입력 필드 -->
            <div class="mb-3">
                <label for="userID" class="form-label">아이디</label>
                <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required>
            </div>
            <!-- 비밀번호 입력 필드 -->
            <div class="mb-3">
                <label for="passwd" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
            </div>
            <!-- 로그인 버튼 -->
            <div class="d-grid">
                <button type="submit" class="btn btn-success">로그인</button>
            </div>
            <span class="mt-3 d-inline-block">
            	<a href="${contextPath}/member/idFindForm" class="link_find">아이디</a>
                            / 
                <a href="${contextPath}/member/passwdFindForm" class="link_find">비밀번호 찾기</a>
                        	/
                <a href="${contextPath}/member/signUpContactForm" class="link_find">회원가입</a>
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
</div>
</body>
</html>