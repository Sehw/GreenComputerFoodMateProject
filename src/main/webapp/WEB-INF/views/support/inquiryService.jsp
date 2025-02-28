<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>기타 문의</title>
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

    /* 기타 문의 폼 스타일 */
    .inquiry-form { width: 100%; max-width: 600px; margin: 20px auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #fff; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); }
    .form-group { margin-bottom: 15px; }
    .form-group label { display: block; font-weight: bold; margin-bottom: 5px; }
    .form-group input, .form-group select, .form-group textarea { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; }
    .form-group textarea { height: 150px; }
    .form-group button { padding: 10px 20px; background-color: #3498db; color: white; border: none; border-radius: 5px; cursor: pointer; }
    .form-group button:hover { background-color: #2980b9; }
  </style>
</head>
<body>
  <div class="container">
    <div class="header1">
      <h2>기타 문의 작성</h2>
    </div>

    <div class="inquiry-form">
      <!-- multipart/form-data 방식으로 파일 업로드 처리 -->
      <form action="${pageContext.request.contextPath}/support/submitGeneralInquiry" method="POST" enctype="multipart/form-data">
    <div class="form-group">
      <label for="inquiryType">문의 유형</label>
      <select id="inquiryType" name="inquiryType" required>
        <option value="">문의 유형을 선택해주세요</option>
        <option value="1">사이트</option>
        <option value="2">기타</option>
        <option value="3">기타 (정해지지 않음)</option>
      </select>
    </div>
    
    <!-- 비밀글 여부 설정 -->
    <div class="form-group">
      <label for="isSecret">비밀글 여부</label>
      <select id="isSecret" name="isSecret" required>
        <option value="N">비밀글 아님</option>
        <option value="Y">비밀글</option>
      </select>
    </div>

    <div class="form-group">
      <label for="content">문의 내용</label>
      <textarea id="content" name="content" required></textarea>
    </div>

    <!-- 이미지 업로드 섹션 추가 -->
    <div class="form-group">
      <label for="images">이미지 첨부</label>
      <input type="file" id="images" name="images" accept="image/*" multiple />
    </div>

    <div class="form-group">
      <button type="submit">문의 작성</button>
    </div>
</form>

    </div>
  </div>
</body>
</html>
