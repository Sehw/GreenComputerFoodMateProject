<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="requestURI" value="${pageContext.request.requestURI}"/>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>문의 내역</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
    .container { width: 100%; padding: 20px; display: flex; flex-direction: column; }
    .header1 {
      background-color: #3498db; 
      color: white;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-radius: 5px;
      margin-bottom: 0;
    }
    .header1 h2 { margin: 0; font-size: 24px; }
    .menu-container { display: flex; justify-content: space-between; align-items: center; padding: 10px 20px; margin: 0; }
    .categories { display: flex; gap: 10px; }
    .category {
      padding: 10px 20px;
      background-color: #fff;
      border-radius: 5px;
      cursor: pointer;
      color: black;
      transition: color 0.3s;
    }
    .category:hover { background-color: #3498db; color: white; }
    .category.active { background-color: #3498db; color: white; }
    .contact-info { font-size: 16px; font-weight: bold; }
    .inquiry-list { margin-top: 20px; }
    .inquiry-item { padding: 10px; border: 1px solid #ddd; margin-bottom: 10px; }
    .tab-content { padding-top: 10px; }
  </style>
</head>
<body>
  <div class="container">
    <div class="header1">
      <h2>고객센터</h2>
    </div>

    <!-- 메뉴탭 영역 -->
    <div class="menu-container">
      <div class="categories">
        <div class="category active"><a href="${contextPath}/support/inquiryLists">문의 내역</a></div>
        <div class="category"><a href="${contextPath}/support/faq">자주 묻는 질문</a></div>
        <div class="category"><a href="${contextPath}/support/inquiryProduct">상품 문의</a></div>
        <div class="category"><a href="${contextPath}/support/inquiryService">서비스 문의</a></div>
      </div>
      <div class="contact-info">고객센터: 080-1234-5678</div>
    </div>

    <!-- 문의 내역 내용 -->
    <div class="inquiry-list">
      <c:if test="${empty inquiries}">
        <div class="no-inquiries">현재 문의 내역이 없습니다.</div>
      </c:if>

      <c:forEach var="inquiry" items="${inquiries}">
        <div class="inquiry-item">
          <div><strong>카테고리:</strong> ${inquiry.getCategoryValue()}</div>
          <div><strong>내용:</strong> ${inquiry.content}</div>
          <div><strong>상태:</strong> ${inquiry.status}</div>
          <div><strong>작성일:</strong> <fmt:formatDate value="${inquiry.createdDate}" pattern="yyyy.MM.dd" /></div>

          <!-- 답변 내용 부분 (자동으로 보여짐) -->
          <div class="tab-content">
            <c:choose>
              <c:when test="${not empty inquiry.responseContent}">
                <div><strong>답변:</strong> ${inquiry.responseContent}</div>
                <div><strong>답변일시:</strong> <fmt:formatDate value="${inquiry.responseDate}" pattern="yyyy.MM.dd" /></div>
              </c:when>
              <c:otherwise>
                <div>답변 대기 중</div>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</body>
</html>
