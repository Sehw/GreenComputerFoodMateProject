<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내비게이션 바</title>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');

.navbar a.nav-link {
  font-family: "Noto Sans KR", serif;
  font-optical-sizing: auto;
  font-weight: 500;
  font-size: 1.25rem;
  color: white !important;
}

.navbar a.nav-link:hover, 
.navbar a.nav-link.active {
  color: #ffcc99 !important;
}

.navbar-inner {	
    max-width: 1000px;
    height: 50px;
    margin: 0 auto;   
}

.navbar {
    background-color: #fa9820;
}


</style>
</head>

<body>
<nav class="navbar navbar-expand-lg p-0">
  <div class="container-fluid">
    <div class="navbar-inner w-100 d-flex justify-content-between">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mb-2 mb-lg-0 w-100 d-flex justify-content-between">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${contextPath}/main">메인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextPath}/recipe/recipe_list">레시피</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextPath}/product_list">식재료</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${contextPath}/support/Q&A">고객센터</a>
          </li>
          
          <li class="nav-item dropdown">
			  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    개발중인 메뉴
			  </a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="${contextPath}/product_compare">상품비교</a></li>
			    <li><hr class="dropdown-divider"></li>
			    <li><a class="dropdown-item" href="${contextPath}/mypage/mypageForm">마이페이지 구매자</a></li>
			    <li><a class="dropdown-item" href="${contextPath}/mypage_seller/mypage_sell_main">마이페이지 판매자</a></li>
			    <li><a class="dropdown-item" href="${contextPath}/admin/adminMain">마이페이지 관리자</a></li>
			  </ul>
			</li>
          
          
        </ul>
      </div>
    </div>
  </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>