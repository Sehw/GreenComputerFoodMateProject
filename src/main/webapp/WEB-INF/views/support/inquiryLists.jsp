<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="requestURI" value="${pageContext.request.requestURI}"/>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>문의 내역</title>
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
  <div class="container">
    <!-- 고객센터 제목과 검색창을 포함한 상단 영역 -->
    <div class="header1">
      <h2>고객센터</h2>
      <div class="search-container">
        <input type="text" placeholder="자주 묻는 질문 검색" class="search-bar" />
        <button class="search-btn">검색</button>
      </div>
    </div>

<!-- 고객센터 메뉴탭 영역 -->
<div class="menu-container">
  <div class="categories">
    <!-- 문의 내역 메뉴탭에만 active 클래스 추가 -->
    <div class="category active">
      <a href="${contextPath}/support/inquiryLists">문의 내역</a>
    </div>
    <div class="category">
      <a href="${contextPath}/support/faq">자주 묻는 질문</a>
    </div>
    <div class="category">
      <a href="${contextPath}/support/inquiryProduct">상품 문의</a>
    </div>
    <div class="category">
      <a href="${contextPath}/support/inquiryService">서비스 문의</a>
    </div>
  </div>
  <div class="contact-info">
    고객센터: 080-1234-5678
  </div>
</div>

 <!-- 문의 내역 내용 -->
    <div class="inquiry-list">
      <!-- 문의 내역이 없을 경우 처리 -->
      <c:if test="${empty inquiries}">
        <div class="no-inquiries">
          현재 문의 내역이 없습니다.
        </div>
      </c:if>

      <!-- 문의 내역이 있을 경우 출력 -->
      
      
      <!--<c:forEach var="inquiry" items="${inquiries}">
        <div class="inquiry-item">          
          <div><strong>카테고리:</strong> ${inquiry.getCategoryValue()}</div> <!-- getCategory()를 통해 카테고리 출력 -->
      <!-- 
          <div><strong>상태:</strong> ${inquiry.status}</div>
          <div><strong>작성일:</strong> <fmt:formatDate value="${inquiry.createdDate}" pattern="yyyy.MM.dd" /></div>
          <!-- 답변이 있는 경우에만 답변 내용 표시 -->
         <!-- <div>
            <c:choose>
              <c:when test="${not empty inquiry.responseContent}">
                <strong>답변:</strong> ${inquiry.responseContent}<br>
                <strong>답변일시:</strong> <fmt:formatDate value="${inquiry.responseDate}" pattern="yyyy.MM.dd" /><br>
                <c:choose>
                  <c:when test="${not empty inquiry.sellerId}">
                    <strong>판매자:</strong> ${inquiry.sellerId}
                  </c:when>
                  <c:otherwise>
                    <strong>관리자:</strong> ${inquiry.adminId}
                  </c:otherwise>
                </c:choose>
              </c:when>
              <c:otherwise>
                답변 대기 중
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </c:forEach>  --> 
      
      
      
      <c:forEach var="inquiry" items="${inquiries}">
  <div class="inquiry-item">
    <div><strong>카테고리:</strong> ${inquiry.getCategoryValue()}</div>
    <div><strong>내용:</strong> ${inquiry.content}</div>
    <div><strong>상태:</strong> ${inquiry.status}</div>
    <div><strong>작성일:</strong> <fmt:formatDate value="${inquiry.createdDate}" pattern="yyyy.MM.dd" /></div>

    <!-- "답변 보기" 버튼을 클릭하면 해당 문의에 대한 답변을 확장하여 보여주기 -->
    <button class="toggle-detail-btn" data-inquiry-id="${inquiry.inquiryId}">답변 보기</button>

    <!-- 답변 내용이 보여질 부분, 기본적으로 숨겨짐 -->
    <div class="inquiry-detail" id="detail-${inquiry.inquiryId}" style="display:none;">
      <!-- Ajax로 로드된 답변 내용이 여기에 추가됨 -->
    </div>
  </div>
</c:forEach>

<script>
  // 각 '답변 보기' 버튼을 클릭했을 때 Ajax 요청을 보내는 함수
  document.querySelectorAll('.toggle-detail-btn').forEach(function(button) {
    button.addEventListener('click', function() {
      var inquiryId = this.getAttribute('data-inquiry-id');
      var detailDiv = document.getElementById('detail-' + inquiryId);

      // 이미 내용이 로드되었는지 확인
      if (detailDiv.style.display === "none") {
        // Ajax 요청으로 상세 답변을 가져오기
        fetch('getResponseDetail.jsp?inquiryId=' + inquiryId)
          .then(response => response.text())
          .then(data => {
            detailDiv.innerHTML = data;  // 가져온 데이터를 표시
            detailDiv.style.display = "block";  // 상세 정보를 보이도록 설정
          });
      } else {
        detailDiv.style.display = "none";  // 이미 보이면 숨김
      }
    });
  });
</script>
    </div>
  </div>
</body>
</html>
