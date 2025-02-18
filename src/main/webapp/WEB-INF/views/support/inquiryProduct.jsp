<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>문의 내역</title>
  <style>
  <style>
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; }

    .category a {
      color: inherit; /* 기본 링크 색상을 상속하도록 설정 */
      text-decoration: none; /* 밑줄 제거 */
    }
    /* 전체 레이아웃 */
    .container { width: 100%; padding: 20px; display: flex; flex-direction: column; }

    /* 고객센터 제목과 검색창을 포함한 상단 공간 */
    .header1 {
      background-color: #3498db; /* 파란색 배경 */
      color: white; /* 흰색 텍스트 */
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-radius: 5px;
      margin-bottom: 0; /* 두 영역 간의 간격 제거 */
    }
    .header1 h2 {
      margin: 0;
      font-size: 24px;
    }
    .search-container {
      display: flex;
      gap: 10px;
    }
    .search-bar { padding: 10px; width: 250px; border-radius: 5px; border: 1px solid #ccc; }
    .search-btn { padding: 10px 20px; background-color: #f39c12; border: none; border-radius: 5px; color: white; cursor: pointer; }
    .search-btn:hover { background-color: #e67e22; }

    /* 고객센터 메뉴탭 영역 (네비게이션 바 스타일) */
    .menu-container {
      background-color: transparent; /* 배경 투명 처리 */
      display: flex;
      justify-content: space-between; /* 메뉴탭 왼쪽, 전화번호 오른쪽 */
      align-items: center;
      padding: 10px 20px;
      margin: 0; /* 두 영역 간의 간격 제거 */
    }
    .categories {
      display: flex;
      gap: 0px; /* 메뉴탭 간 간격 */
    }
    .category {
      padding: 0px 5px;
      background-color: #fff; /* 메뉴탭의 배경을 흰색으로 설정 */
      border: none; /* 경계선 제거 */
      border-radius: 5px;
      cursor: pointer;
      color: black; /* 기본 글씨 색은 검은색 */
      text-decoration: none; /* 링크의 밑줄 제거 */
      transition: color 0.3s, border-bottom 0.3s;
    }
    .category a:hover {
      color: #3498db; /* 호버 시 파란색 글씨 */
      text-decoration: underline; /* 호버 시 밑줄 추가 */
    }
    
    .category.active {
      color: #3498db; /* 활성화된 메뉴탭의 색상 변경 */
    }
    
    /* 현재 활성화된 메뉴탭 스타일 */
    .category.active a {
      color: #3498db; /* 파란색 텍스트 */
      text-decoration: underline; /* 파란색 밑줄 추가 */
    }
    .contact-info {
      font-size: 16px;
      font-weight: bold;
    }

    /* 문의 내역 */
    .inquiry-list { margin-top: 20px; }
    .inquiry-item { padding: 10px; border: 1px solid #ddd; margin-bottom: 10px; }
  </style>
</head>
<body>
  <h2>문의 내역</h2>
<div class="faq-container">
  <div class="search-container">
    <input type="text" placeholder="자주 묻는 질문 검색" class="search-bar" />
    <button class="search-btn">검색</button>
  </div>

  <!-- 고객센터 메뉴 탭 -->
  <div class="categories">
    <div class="category"><a href="${contextPath}/support/inquiryLists">문의 내역</a></div>
    <div class="category"><a href="${contextPath}/support/faq">자주 묻는 질문</a></div>
    <div class="category active"><a href="${contextPath}/support/inquiryProduct">상품 문의</a></div>
    <div class="category"><a href="${contextPath}/support/inquiryService">서비스 문의</a></div>
  </div>
</div>
  <div class="inquiry-list">
    <div class="inquiry-item">
      <strong>Q: 제품이 고장났어요. 어떻게 해야 하나요?</strong>
      <p>A: 고객센터에 문의 후, 교환/환불 절차를 진행하실 수 있습니다.</p>
    </div>
    <div class="inquiry-item">
      <strong>Q: 주문한 상품을 취소하고 싶습니다.</strong>
      <p>A: 주문 상태에 따라 취소가 가능하며, 고객센터에 문의하시면 상세 안내를 드립니다.</p>
    </div>
    <!-- 더 많은 문의 내역 추가 -->
  </div>
</body>
</html>
