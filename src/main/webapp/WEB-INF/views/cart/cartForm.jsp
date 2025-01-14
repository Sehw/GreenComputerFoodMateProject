<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
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
		  text-align: left; /* 텍스트 중앙 정렬 */
		}
	    /* 내용 텍스트 정렬 */
	    .table tbody td {
	      vertical-align: middle;
	      text-align: center;
	    }
	    
	     .summary-box {
            border: 1px solid #ddd;
            padding: 15px;
            background-color: #fff;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 1rem;
        }

        .summary-row .item {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .summary-row .item span {
            font-weight: bold;
        }

        .text-green {
            color: #28a745;
        }

        .text-gray {
            color: #888;
        }
</style>
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">장바구니</h5>
    </div>
    <table class="table table-hover table-custom">
		<thead class="table-header table-primary">
			<tr>
				<td><input type="checkbox" id="checkAll"> 전체상품</td>	
			</tr>
		</thead>
	</table>
	
	<table class="table table-hover table-custom">
		<thead class="table-header table-primary">
			<tr>
				<td><input type="checkbox" id="checkAll"></td>
				<td>상품명/옵션</td>
				<td>수량</td>
				<td>상품금액</td>
				<td>할인/적립</td>
				<td>합계금액</td>
				<td style="text-align: center;">배송비</td>
			</tr>
		</thead>
      	<tbody>
      	<tr>
          <td><input type="checkbox" id="check1"></td>
          <td>
          <img src="${contextPath}/resources/images/Shopping/pig.jpg" alt="돼지고기" class="img-fluid rounded" style="width: 130px; height: 130px; object-fit: cover;">
          돼지고기 뒷다리살 400g
          </td>
          <td>
            <div class="d-flex flex-column gap-1 align-items-center">
		    	<span>1개</span>
		    	<button class="btn btn-outline-secondary btn-sm " style="width:120px;" disabled>옵션/수량변경</button>
		  	</div>
          </td>
          <td>10,900원</td>
          <td>적립<br>
          상품 + 199원</td>
          <td>10,900원</td>
          <td style="text-align: center;">기본 - 배송비무료<br>무료배송<br>(택배-선결제)</td>
        </tr>
        <tr>
          <td><input type="checkbox" id="check2"></td>
          <td>
          <img src="${contextPath}/resources/images/Shopping/cow.jpg" alt="소고기" class="img-fluid rounded" style="width: 130px; height: 130px; object-fit: cover;">
          소고기 국거리 400g
          </td>
          <td>
            <div class="d-flex flex-column gap-1 align-items-center">
		    	<span>1개</span>
		    	<button class="btn btn-outline-secondary btn-sm " style="width:120px;" disabled>옵션/수량변경</button>
		  	</div>
          </td>
          <td>13,900원</td>
          <td>적립<br>
          상품 + 199원</td>
          <td>13,900원</td>
          <td style="text-align: center;">기본 - 배송비무료<br>무료배송<br>(택배-선결제)</td>
        </tr>
		</tbody>
	</table>
	<div class="summary-box">
        <div class="summary-row">
        <!-- 왼쪽 빈 공간 -->
                <div></div>

                <!-- 합계 내용 -->
                <div class="d-flex align-items-center gap-4">
                    <!-- 상품 금액 -->
                    <div class="item">
                        <span>총 2개의 상품금액</span>
                        <span class="text-green">24,800원</span>
                    </div>

                    <!-- 더하기 기호 -->
                    <div class="item">
                        <span class="text-gray">+</span>
                    </div>

                    <!-- 배송비 -->
                    <div class="item">
                        <span>배송비</span>
                        <span class="text-green">0원</span>
                    </div>

                    <!-- 같음 기호 -->
                    <div class="item">
                        <span class="text-gray">=</span>
                    </div>

                    <!-- 합계 -->
                    <div class="item">
                        <span>합계</span>
                        <span class="text-green">24,800원</span>
                    </div>
                </div>
            </div>

            <!-- 적립예정 금액 -->
            <div class="text-end text-gray mt-2">
                적립예정 적립금: 219원
            </div>
        </div>
    <div class="text-start mt-2 mb-1">
		<button class="btn btn-outline-secondary btn-sm" disabled>선택 상품 삭제</button>
		<button class="btn btn-outline-secondary btn-sm" disabled>선택 상품 찜</button>
	</div>
	
	<div class="text-end mt-1">
	  <a href="#" class="btn btn-outline-secondary">선택 상품 주문</a>
	  <a href="#" class="btn btn-success">전체 상품 주문</a>
	</div>
</div>
</body>
</html>