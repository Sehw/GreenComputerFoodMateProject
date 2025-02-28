<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>자주 묻는 질문</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
    .container { width: 100%; padding: 20px; display: flex; flex-direction: column; }
    
    /* 헤더 스타일 */
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

    /* 고객센터 메뉴 탭 */
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

    /* 검색창 스타일 */
    .search-container { display: flex; justify-content: flex-end; margin-bottom: 20px; }
    .search-bar { padding: 10px; width: 250px; border-radius: 5px; border: 1px solid #ccc; }
    .search-btn { padding: 10px 20px; background-color: #3498db; border: none; border-radius: 5px; color: white; cursor: pointer; }
    .search-btn:hover { background-color: #2980b9; }

    /* FAQ 리스트 스타일 */
    .qa-section { margin-top: 30px; }
    .qa-card { padding: 15px; border: 1px solid #ddd; border-radius: 8px; background-color: #fff; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); cursor: pointer; margin-bottom: 10px; }
    .qa-card:hover { background-color: #f1f1f1; }
    .qa-header h3 { margin-bottom: 15px; font-size: 18px; font-weight: bold; color: #333; }
    .qa-item p { display: none; font-size: 14px; color: #555; margin-top: 5px; }

    /* 답변 펼치기 스타일 */
    .qa-item.open p { display: block; }
  </style>
</head>
<body>

  <div class="container">
    <!-- 헤더 -->
    <div class="header1">
      <h2>고객센터</h2>
    </div>

    <!-- 검색창 -->
   
    <!-- 고객센터 메뉴 탭 -->
<div class="menu-container">
      <div class="categories">
        <div class="category"><a href="${contextPath}/support/inquiryLists">문의 내역</a></div>
        <div class="category active"><a href="${contextPath}/support/faq">자주 묻는 질문</a></div>
        <div class="category"><a href="${contextPath}/support/inquiryProduct">상품 문의</a></div>
        <div class="category"><a href="${contextPath}/support/inquiryService">서비스 문의</a></div>
      </div>
      <div class="contact-info">고객센터: 080-1234-5678</div>
    </div>


	 <div class="search-container">
      <input type="text" placeholder="자주 묻는 질문 검색" class="search-bar" />
      <button class="search-btn">검색</button>
    </div>
	

    <!-- FAQ 탭 -->
    <div class="categories" style="margin-top: 20px;">
      <div class="category active" id="category1" onclick="showFAQ('category1')">취소/교환/반품</div>
      <div class="category" id="category2" onclick="showFAQ('category2')">배송문의</div>
      <div class="category" id="category3" onclick="showFAQ('category3')">회원서비스</div>
      <div class="category" id="category4" onclick="showFAQ('category4')">주문/결제</div>
      <div class="category" id="category5" onclick="showFAQ('category5')">환불</div>
    </div>

    <!-- FAQ 항목 -->
    <div class="qa-section" id="category1-faq">
      <div class="qa-card">
        <div class="qa-header">
          <h3>Q: 제품이 고장났어요. 어떻게 해야 하나요?</h3>
        </div>
        <div class="qa-item">
          <p>A: 고객센터에 문의 후, 교환/환불 절차를 진행하실 수 있습니다.</p>
        </div>
      </div>
      <div class="qa-card">
        <div class="qa-header">
          <h3>Q: 주문을 취소하고 싶습니다.</h3>
        </div>
        <div class="qa-item">
          <p>A: 주문 상태에 따라 취소가 가능하며, 고객센터에 문의하시면 상세 안내를 드립니다.</p>
        </div>
      </div>
    </div>

    <div class="qa-section" id="category2-faq" style="display: none;">
      <div class="qa-card">
        <div class="qa-header">
          <h3>Q: 배송 상태는 어떻게 확인하나요?</h3>
        </div>
        <div class="qa-item">
          <p>A: 배송 상태는 '내 주문 내역'에서 확인할 수 있으며, 배송 중인 상품은 추적이 가능합니다.</p>
        </div>
      </div>
      <div class="qa-card">
        <div class="qa-header">
          <h3>Q: 배송 기간은 얼마나 걸리나요?</h3>
        </div>
        <div class="qa-item">
          <p>A: 보통 3~5일 이내에 배송되며, 지역에 따라 다를 수 있습니다.</p>
        </div>
      </div>
    </div>

    <div class="qa-section" id="category3-faq" style="display: none;">
      <div class="qa-card">
        <div class="qa-header">
          <h3>Q: 회원 가입 방법은?</h3>
        </div>
        <div class="qa-item">
          <p>A: 홈페이지 상단에서 '회원 가입' 버튼을 클릭하여 간단한 절차로 가입이 가능합니다.</p>
        </div>
      </div>
      <div class="qa-card">
        <div class="qa-header">
          <h3>Q: 비밀번호를 잊어버렸습니다.</h3>
        </div>
        <div class="qa-item">
          <p>A: 로그인 화면에서 '비밀번호 찾기'를 클릭하여 이메일로 비밀번호 재설정 링크를 받을 수 있습니다.</p>
        </div>
      </div>
    </div>

    <div class="qa-section" id="category4-faq" style="display: none;">
      <div class="qa-card">
        <div class="qa-header">
          <h3>Q: 주문 결제 방법은 무엇인가요?</h3>
        </div>
        <div class="qa-item">
          <p>A: 다양한 결제 방법(카드, 계좌이체, 모바일 결제 등)을 지원합니다.</p>
        </div>
      </div>
      <div class="qa-card">
        <div class="qa-header">
          <h3>Q: 결제 후 영수증을 받을 수 있나요?</h3>
        </div>
        <div class="qa-item">
          <p>A: 결제 완료 후 이메일로 영수증을 발송해드립니다.</p>
        </div>
      </div>
    </div>

    <div class="qa-section" id="category5-faq" style="display: none;">
      <div class="qa-card">
        <div class="qa-header">
          <h3>Q: 환불 절차는 어떻게 되나요?</h3>
        </div>
        <div class="qa-item">
          <p>A: 환불은 제품 반품 후 7일 이내에 처리됩니다. 자세한 절차는 고객센터에 문의해주세요.</p>
        </div>
      </div>
      <div class="qa-card">
        <div class="qa-header">
          <h3>Q: 환불 시에는 어떤 방법을 사용하나요?</h3>
        </div>
        <div class="qa-item">
          <p>A: 원래 결제 수단을 통해 환불이 이루어집니다.</p>
        </div>
      </div>
    </div>

  </div>

  <script>
    function showFAQ(category) {
      const allSections = document.querySelectorAll('.qa-section');
      allSections.forEach(section => section.style.display = 'none');
      
      const activeCategory = document.getElementById(category + '-faq');
      activeCategory.style.display = 'block';
      
      const allCategories = document.querySelectorAll('.category');
      allCategories.forEach(cat => cat.classList.remove('active'));
      
      document.getElementById(category).classList.add('active');
    }

    // 클릭 시 답변 펼쳐지도록
    const qaItems = document.querySelectorAll('.qa-card');
    qaItems.forEach(item => {
      item.addEventListener('click', () => {
        item.querySelector('.qa-item').classList.toggle('open');
      });
    });
  </script>

</body>
</html>
