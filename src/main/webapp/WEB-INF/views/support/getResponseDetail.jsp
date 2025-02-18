<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="requestURI" value="${pageContext.request.requestURI}"/>
    <%@ page import="java.util.*, java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String inquiryId = request.getParameter("inquiryId");
    // inquiryId로 DB에서 해당 문의에 대한 답변을 조회하는 로직 추가
    // 예를 들어, inquiryId를 이용해 PRO_RESPONSES 테이블에서 데이터를 가져와 출력
    String responseContent = "안녕하세요! 해당 상품은 현재 재입고 예정이 있으며, 예상 입고일은 2025년 3월 15일입니다."; // 예시
    String responseDate = "2025.03.01"; // 예시
%>

<!-- Ajax로 불러온 답변 내용 -->
<div>
    <p><strong>답변 내용:</strong> ${responseContent}</p>
    <p><strong>답변일시:</strong> <fmt:formatDate value="${responseDate}" pattern="yyyy.MM.dd" /></p>
</div>
</body>
</html>