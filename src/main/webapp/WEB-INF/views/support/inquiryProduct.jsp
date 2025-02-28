<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.FileUploadException" %>
<%@ page import="java.nio.file.Paths" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상품 문의 작성</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
    .container { width: 100%; padding: 20px; display: flex; flex-direction: column; }
    .header1 { background-color: #3498db; color: white; padding: 20px; display: flex; justify-content: space-between; align-items: center; border-radius: 5px; margin-bottom: 0; }
    .header1 h2 { margin: 0; font-size: 24px; }
    .inquiry-form { padding: 20px; background-color: #f9f9f9; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); }
    .form-group { margin-bottom: 15px; }
    label { font-size: 16px; font-weight: bold; }
    select, textarea, input[type="file"] { width: 100%; padding: 10px; font-size: 14px; border-radius: 5px; border: 1px solid #ccc; }
    button { padding: 10px 20px; background-color: #3498db; color: white; border: none; border-radius: 5px; cursor: pointer; }
    button:hover { background-color: #2980b9; }
  </style>
</head>
<body>
  <div class="container">
    <div class="header1">
      <h2>상품 문의 작성</h2>
    </div>

    <div class="inquiry-form">
      <form action="${contextPath}/support/submitProductInquiry" method="POST" enctype="multipart/form-data">
        
        <!-- 주문한 상품 목록 선택 -->
        <div class="form-group">
          <label for="productId">상품 선택</label>
          <select id="productId" name="productId" required>
            <option value="">상품을 선택해주세요</option>
            <!-- 주문한 상품 목록을 출력 -->
            <c:forEach var="product" items="${orderedProducts}">
              <option value="${product.pdtId}">${product.pdtName}</option>
            </c:forEach>
          </select>
        </div>

        <!-- 문의 유형 -->
        <div class="form-group">
          <label for="inquiryType">문의 유형</label>
          <select id="inquiryType" name="inquiryType" required>
            <option value="1">상품 관련</option>
            <option value="2">배송 관련</option>
            <option value="3">반품 관련</option>
            <option value="4">환불 관련</option>
            <option value="5">교환 관련</option>
            <option value="6">기타</option>
          </select>
        </div>

        <!-- 비밀글 여부 -->
        <div class="form-group">
          <label for="isSecret">비밀글 여부</label>
          <select id="isSecret" name="isSecret" required>
            <option value="N">비밀글 아님</option>
            <option value="Y">비밀글</option>
          </select>
        </div>

        <!-- 문의 내용 -->
        <div class="form-group">
          <label for="content">문의 내용</label>
          <textarea id="content" name="content" required></textarea>
        </div>

        <!-- 이미지 첨부 (최대 5개) -->
        <div class="form-group">
          <label for="images">이미지 첨부 (최대 5개)</label>
          <input type="file" id="images" name="images" accept="image/*" multiple />
        </div>

        <!-- 제출 버튼 -->
        <div class="form-group">
          <button type="submit">문의 작성</button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>
