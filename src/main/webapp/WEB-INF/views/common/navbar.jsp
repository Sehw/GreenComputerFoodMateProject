<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내비게이션 바</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');

nav {
    font-family: "Noto Sans KR", sans-serif;
}

.nav_main {
    background-color: #fa9820;
    height: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.nav_main ul {
    display: flex;
    padding: 0;
    margin: 0;
    list-style: none;
    flex-wrap: nowrap; /* 줄바꿈 방지 */
}

.nav_main li {
    margin: 0 100px;
    white-space: nowrap; /* 글자 줄바꿈 방지 */
}

.nav_main a {
    font-size: 1.25em;
    color: white;
    text-decoration: none;
}

.nav_main a.active {
    font-weight: bold;
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
            <a class="nav-link" aria-current="page" href="${contextPath}/main">메인</a>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // 현재 페이지 URL 가져오기
    let currentPage = window.location.pathname;

//    // 레시피 페이지에서 장바구니 버튼 숨김
//    if (currentPage.includes('/recipe')) {
//        document.getElementById('cartLink').style.display = 'none';
//    }

//    // 장바구니 페이지에서 레시피 버튼 숨김
//    if (currentPage.includes('/cart')) {
//        document.getElementById('recipeLink').style.display = 'none';
//    }
</script>
</body>
</html>
