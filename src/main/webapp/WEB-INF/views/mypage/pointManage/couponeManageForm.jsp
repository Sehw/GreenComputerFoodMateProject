<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰</title>
<link href="<c:url value="/resources/css/tablepage.css" />" rel="stylesheet">
<style>
		.table-custom {
		    border-top: 2px solid #b5b6b7 !important;
	 	 }
		/* 헤더 배경색 */
	    .table-header {
		  background-color: #f8f9fa;
	      text-align: center;
	      font-weight: bold;
	      min-width: 20%;
	    }
	    .table td:last-child {
		  min-width: 100px; /* 최소 너비 지정 */
		  text-align: center; /* 텍스트 중앙 정렬 */
		}
	    /* 내용 텍스트 정렬 */
	    .table tbody td {
	      vertical-align: middle;
	      text-align: center;
	    }
	    .custom-status {
		  color: green; /* 텍스트 색상 */
		  border: 1px solid green; /* 테두리 색상 */
		  padding: 5px 10px; /* 내부 여백 */
		  background-color: transparent; /* 배경색 없음 */
		  font-size: 14px; /* 글자 크기 */
		}
</style>
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">쿠폰</h5>
    </div>
    <div class="text-end mb-1">
	  <a href="#" class="btn btn-dark">쿠폰등록</a>
	</div>
    	<table class="table table-hover table-custom">
		<thead class="table-header table-secondary">
			<tr>
				<td>쿠폰명</td>
				<td>혜택</td>
				<td>유효기간</td>
				<td>발급일</td>
			</tr>
		</thead>
      	<tbody>
      	<tr>
      	  <td>
      	    <b>신규회원 1500원 할인쿠폰</b><br>
			1,500원<br>
			PC+모바일<br>
			상품할인별 중복 사용불가<br>
			<b>사용하기 ></b>
		  </td>
          <td>
          1,500원
          </td>
          <td>2025-01-08 11:20 ~ 2025-01-15 11:20
          <br>
          <span class="custom-status">사용가능</span>
          </td>
          <td>2025-01-08</td>
        </tr>
        <tr>
          <td><b>신규회원 2000원 할인쿠폰</b><br>
			2,000원<br>
			PC+모바일<br>
			상품할인별 중복 사용불가<br>
			<b>사용하기 ></b>
		  </td>
          <td>
          2,000원
          </td>
          <td>2025-01-08 11:20 ~ 2025-01-15 11:20
          <br>
          <span class="custom-status">사용가능</span>
          </td>
          <td>2025-01-08</td>
        </tr>
		</tbody>
	</table>
	<nav aria-label="Page navigation">
	  <ul class="pagination justify-content-center">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">Prev</span>
	      </a>
	    </li>
	    <li class="page-item active" aria-current="page">
	      <a class="page-link" href="#">1</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item"><a class="page-link" href="#">4</a></li>
	    <li class="page-item"><a class="page-link" href="#">5</a></li>
	    <li class="page-item"><a class="page-link" href="#">6</a></li>
	    <li class="page-item"><a class="page-link" href="#">7</a></li>
	    <li class="page-item"><a class="page-link" href="#">8</a></li>
	    <li class="page-item"><a class="page-link" href="#">9</a></li>
	    <li class="page-item"><a class="page-link" href="#">10</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>
</body>
</html>