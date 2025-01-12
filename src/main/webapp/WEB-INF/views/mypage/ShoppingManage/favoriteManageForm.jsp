<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 레시피</title>
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">찜 리스트</h5>
    </div>
    <table class="table table-bordered">
		<thead class="table-header">
			<tr>
				<td>주문번호</td>
				<td>주문일자</td>
				<td>주문상품</td>
				<td>주문상태</td>
				<td>주문취소</td>
			</tr>
		</thead>
      	<tbody>
      	<tr>
          <td>400</td>
          <td>2024-12-24 16:16:13</td>
          <td>초보자를 위한 자바 프로그래밍 / 1개</td>
          <td>주문취소</td>
          <td>
            <button class="btn btn-outline-secondary btn-sm" disabled>주문 취소</button>
          </td>
          </tr>
		</tbody>
	</table>
</div>
</body>
</html>