<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 리스트</title>
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
</style>
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">찜 리스트</h5>
    </div>
      <table class="table table-hover table-custom">
		<thead class="table-header table-primary">
			<tr>
				<td><input type="checkbox" id="checkAll"></td>
				<td>상품명/옵션</td>
				<td>상품금액/수량</td>
				<td>혜택</td>
				<td>주문</td>
			</tr>
		</thead>
      	<tbody>
      	<tr>
          <td><input type="checkbox" id="check1"></td>
          <td>
          <img src="${contextPath}/resources/images/Shopping/pig.jpg" alt="돼지고기" class="img-fluid rounded" style="width: 50px; height: 50px; object-fit: cover;">
          돼지고기 뒷다리살 400g
          </td>
          <td>
            <div class="d-flex flex-column gap-1 align-items-center">
		    	<span>10,900 / 1개</span>
		    	<button class="btn btn-outline-secondary btn-sm " style="width:120px;" disabled>옵션/수량변경</button>
		  	</div>
          </td>
          <td>적립<br>
          상품 + 199원</td>
          <td>
          <div class="d-flex flex-column gap-1 align-items-center">
            <button class="btn btn-outline-success btn-sm" disabled>장바구니</button>
            <button class="btn btn-outline-secondary btn-sm" disabled>삭제하기</button>
           </div>
          </td>
        </tr>
        <tr>
          <td><input type="checkbox" id="check2"></td>
          <td>
          <img src="${contextPath}/resources/images/Shopping/cow.jpg" alt="소고기" class="img-fluid rounded" style="width: 50px; height: 50px; object-fit: cover;">
          소고기 국거리 400g
          </td>
          <td>
            <div class="d-flex flex-column gap-1 align-items-center">
		    	<span>13,900 / 1개</span>
		    	<button class="btn btn-outline-secondary btn-sm " style="width:120px;" disabled>옵션/수량변경</button>
		  	</div>
          </td>
          <td>적립<br>
          상품 + 199원</td>
          <td>
            <div class="d-flex flex-column gap-1 align-items-center">
            	<button class="btn btn-outline-success btn-sm" disabled>장바구니</button>
            	<button class="btn btn-outline-secondary btn-sm" disabled>삭제하기</button>
           </div>
          </td>
        </tr>
		</tbody>
	</table>
	<div class="text-start mb-1">
		<button class="btn btn-outline-secondary btn-sm" disabled>선택 상품 삭제</button>
		<button class="btn btn-outline-secondary btn-sm" disabled>선택 상품 장바구니</button>
	</div>
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