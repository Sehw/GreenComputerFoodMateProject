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
  
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
    
    /* 헤더 스타일 */
    .header { display: flex; justify-content: space-between; align-items: center; padding: 20px; background-color: #f8f8f8; }
    .logo { font-size: 24px; font-weight: bold; color: #f39c12; }
    .search-container { display: flex; }
    .search-bar { padding: 10px; width: 250px; border-radius: 5px; border: 1px solid #ccc; }
    .search-btn { padding: 10px 20px; background-color: #f39c12; border: none; border-radius: 5px; color: white; cursor: pointer; }
	.search-btn:hover { background-color: #e67e22;}
    /* 카테고리 버튼 스타일 */
    .categories { display: flex; justify-content: space-around; margin-top: 20px; }
    .category { padding: 10px 20px; border: 1px solid #ccc; border-radius: 5px; cursor: pointer; }
    .category.active { border-color: #f39c12; color: #f39c12; }

    .qa-section { margin-top: 30px; padding: 20px; display: flex; flex-wrap: wrap; gap: 20px; }
    .qa-card { width: 100%; padding: 15px; border: 1px solid #ccc; border-radius: 8px; background-color: #fff; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); }
    .qa-header h3 { margin-bottom: 20px; font-size: 20px; font-weight: bold; }
    .qa-item { margin-bottom: 15px; }
    .qa-item strong { display: block; font-size: 16px; color: #333; }
    .qa-item p { margin: 5px 0 0; color: #555; }

    /* 1:1 문의 버튼 스타일 */
    .contact-btn {
    		width:120px;
            padding: 12px 25px;
            background-color: #f39c12;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s;       
    }
    
    .contact-btn a {
    		text-decoration:none;
    		color:#fff;
    }
    .contact-btn:hover {
   			 background-color: #e67e22;
    }
    /* 필요한 스타일 추가 */
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
    <div class="category active"><a href="${contextPath}/support/faq">자주 묻는 질문</a></div>
    <div class="category"><a href="${contextPath}/support/inquiryProduct">상품 문의</a></div>
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
