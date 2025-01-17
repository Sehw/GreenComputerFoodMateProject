<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>고객센터 Q&A</title>
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
  </style>
</head>
<body>
  <div class="header">
    <div class="logo">❓ Q&A</div>
    <div class="search-container">
      <input type="text" placeholder="자주 묻는 질문 검색" class="search-bar" />
      <button class="search-btn">검색</button>
    </div>
  </div>

  <div class="categories">
    <div class="category active">회원서비스</div>
    <div class="category">반품/교환/환불</div>
    <div class="category">주문/결제/배송</div>
    <div class="category">상품 관련</div>
  </div>

  <div class="qa-section">
    <div class="qa-card">
      <h3>회원서비스</h3>
      <div class="qa-item">
        <strong>Q: 회원 가입은 어떻게 하나요?</strong>
        <p>A: 회원 가입은 로그인 화면에서 '회원가입' 버튼을 클릭한 후, 필요한 정보를 입력하여 가입할 수 있습니다.</p>
      </div>
      <div class="qa-item">
        <strong>Q: 비밀번호를 잊어버렸습니다. 어떻게 해야 하나요?</strong>
        <p>A: 로그인 페이지에서 '비밀번호 재설정'을 클릭하여 사용자 인증을 통해 비밀번호를 재설정할 수 있습니다.</p>
      </div>
      <div class="qa-item">
        <strong>Q: 이메일 인증이 안됩니다. 어떻게 해야 하나요?</strong>
        <p>A: 이메일이 수신되지 않으면 스팸함을 확인하시고, 재발송을 요청할 수 있습니다.</p>
      </div>
      <div class="qa-item">
        <strong>Q: 로그인할 수 없습니다. 어떻게 해결하나요?</strong>
        <p>A: 로그인 시 오류가 발생하면, 아이디와 비밀번호를 다시 확인하고, 비밀번호를 재설정해보세요.</p>
      </div>
      <div class="qa-item">
        <strong>Q: 회원탈퇴는 어떻게 하나요?</strong>
        <p>A: '내 계정' 메뉴에서 회원탈퇴 신청을 할 수 있으며, 신청 후에는 일정 기간 내 처리됩니다.</p>
      </div>
      <div class="qa-item">
        <strong>Q: 내 정보 수정은 어떻게 하나요?</strong>
        <p>A: '마이페이지'에서 이메일, 전화번호 등을 수정할 수 있습니다.</p>
      </div>
      <div class="qa-item">
        <strong>Q: 포인트 사용 내역을 확인하려면 어떻게 하나요?</strong>
        <p>A: '마이페이지' -> '내 포인트' 메뉴에서 포인트 사용 내역을 확인할 수 있습니다.</p>
      </div>
      <div class="contact-btn"><a href="${contextPath}/main10.do">1:1 문의</a></div>
    </div>
  </div>


</body>
</html>
