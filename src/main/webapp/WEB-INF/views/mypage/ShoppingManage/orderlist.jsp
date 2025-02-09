<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록/배송조회</title>
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
	    
	    th:first-child, td:first-child {
		    width: 10%; /* 첫 번째 열의 폭을 15%로 설정 */
		}
</style>
</head>
<body>
<main>
<div class="container mt-1">
	<div class="d-flex align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">주문목록/배송조회</h5>
    </div>
    <div class="border p-4 rounded mb-3" style="margin: 0 auto;">
    	<div class="d-flex align-items-center gap-3 flex-wrap">
    		<p class="mb-0 align-self-center">조회기간</p>
    		<div class="btn-group" role="group" aria-label="data filter buttons">
		    	<button type="button" class="btn btn-outline-secondary active" data-days="0">오늘</button>
		        <button type="button" class="btn btn-outline-secondary" data-days="7">7일</button>
		        <button type="button" class="btn btn-outline-secondary" data-days="15">15일</button>
		        <button type="button" class="btn btn-outline-secondary" data-days="30">1개월</button>
		        <button type="button" class="btn btn-outline-secondary" data-days="90">3개월</button>
		        <button type="button" class="btn btn-outline-secondary" data-days="365">1년</button>
    		</div>
    		
    		<div class="d-flex align-items-center gap-2">
    			<input type="date" id="start-date" class="form-control w-auto" value="2025-01-06" />
        		<span>~</span>
        		<input type="date" id="end-date" class="form-control w-auto" value="2025-01-13" />
    		
    			<!-- Search Button -->
      			<button type="button" class="btn btn-success">조회</button>
    		</div>
    	</div>
	</div>
	<table class="table table-hover table-custom">
    <thead class="table-header table-secondary">
        <tr>
            <td>날짜/주문번호</td>
            <td>상품명/옵션</td>
            <td>상품금액/수량</td>
            <td>주문상태</td>
            <td>확인/리뷰</td>
        </tr>
    </thead>
    
    <tbody>
        <c:forEach var="order" items="${orderList}">
            <tr>
                <!-- 주문 날짜 및 주문번호 -->
                <td>(${order.ord_id})</td>

                <!-- 상품명과 옵션 -->
                <td>
                    <img src="${contextPath}/resources/images/Shopping/${order.pdt_name}.jpg" alt="${order.pdt_name}" class="img-fluid rounded" style="width: 50px; height: 50px; object-fit: cover;">
                    ${order.pdt_name}
                </td>

                <!-- 상품 금액 및 수량 -->
                <td>${order.pdt_price}원 (${order.qty}개)</td>

                <!-- 주문 상태 -->
                <td>몰라</td>

                <!-- 확인/리뷰 -->
                <td>
                    <div class="d-flex flex-column gap-1">
                        <button class="btn btn-outline-secondary btn-sm" disabled>배송조회</button>
                        <button class="btn btn-outline-success btn-sm" disabled>리뷰하기</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
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
</main>
</body>
</html>