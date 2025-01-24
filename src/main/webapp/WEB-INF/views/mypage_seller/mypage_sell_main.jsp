<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/profile.css" />" rel="stylesheet">
<style>
		.myproduct{
			width: 100%;
			margin: 0 auto;
		}

		.table-custom {
		    border-top: 2px solid #000 !important;
	 	 }
		/* 헤더 배경색 */
	    .table-header {
		  background-color: #f8f9fa;
	      text-align: center;
	      font-weight: bold;
	    }
	    /* 내용 텍스트 정렬 */
	    .table tbody td {
	      vertical-align: middle;
	      text-align: center;
	    }
</style>

<meta charset="UTF-8">
<title>마이페이지</title>
</head>

<body>
	<div class="container mt-2">
		<div class="row">
			<div class="col-md-3 mt-3">
				<div class="mainbox">
					<div class="name_icon_btn">
						<img src="${contextPath}/resources/images/profile_09.png" alt="" />
						<p> 프로필수정 </p>
						<p> 그린축산 </p>
						<p> 팔로워 : n명 </p>
					</div>
				</div>
			</div>
			
			<div class="col-md-9 mt-2">
			<h5 class="mb-0 fw-bold">BEST3 상품</h5>
	  		<p class="mb-0">더보기
    			<div class="myproduct">
    			
					<table class="table table-hover table-custom">
						<thead class="table-header table-secondary">
							<tr>
								<td>상품번호</td>
								<td>상품명</td>
								<td>재고수</td>
								<td>대기중인 주문</td>
								<td>주문후 예상재고</td>
								<td>공개여부</td>
								<td>삭제신청</td>
							</tr>
						</thead>
						
				      	<tbody>
					      	<tr>
					          <td>123</td>
					          <td>돼지고기 뒷다리살</td>
					          <td>152</td>
					          <td>2건</td>
					          <td>148</td>
					          <td>
					          	<button class="btn btn-outline-secondary btn-sm">비공개하기</button>
					          </td>
					          <td>
					          	<button class="btn btn-outline-secondary btn-sm">삭제신청</button>
					          </td>
					        </tr>
					        <tr>
					          <td>124</td>
					          <td>돼지고기 국거리</td>
					          <td>75</td>
					          <td>5건</td>
					          <td>60</td>
					          <td>
					          	<button class="btn btn-outline-secondary btn-sm">비공개하기</button>
					          </td>
					          <td>
					          	<button class="btn btn-outline-secondary btn-sm">삭제신청</button>
					          </td>
					        </tr>
					        
					        <tr>
					          <td>125</td>
					          <td>소고기 맛있는부위</td>
					          <td>30</td>
					          <td>15건</td>
					          <td>2</td>
					          <td>
					          	<button class="btn btn-outline-secondary btn-sm">비공개하기</button>
					          </td>
					          <td>
					          	<button class="btn btn-outline-secondary btn-sm">삭제신청</button>
					          </td>
					        </tr>
					        
						</tbody>
					</table>
					
				</div>
			</div>
			
		</div>
		
		
	  <div class="d-flex justify-content-between align-items-center mt-3 mb-2">
	  		<h5 class="mb-0 fw-bold">배송 대기중인 주문</h5>
	  		<p class="mb-0">더보기
      </div>
      <table class="table table-hover table-custom">
		<thead class="table-header table-secondary">
			<tr>
				<td>주문번호</td>
				<td>주문일자</td>
				<td>주문상품</td>
				<td>배송주소</td>
				<td>주문상태변경</td>
				<td>주문취소</td>
			</tr>
		</thead>
      	<tbody>
      	<tr>
          <td>400</td>
          <td>2024-12-24 16:16:13</td>
          <td>돼지고기 뒷다리살</td>
          <td>대전 서구 오라클빌딩 10층</td>
          <td>
          	<button class="btn btn-outline-secondary btn-sm">배송시작</button>
          </td>
          <td>
            <button class="btn btn-outline-secondary btn-sm">주문 취소</button>
          </td>
        </tr>
        
        <tr>
          <td>401</td>
          <td>2024-12-24 16:16:13</td>
          <td>돼지고기 국거리</td>
          <td>대전 서구 오라클빌딩 3층</td>
          <td>
          	<button class="btn btn-outline-secondary btn-sm">배송시작</button>
          </td>
          <td>
            <button class="btn btn-outline-secondary btn-sm">주문 취소</button>
          </td>
        </tr>
        
        <tr>
          <td>401</td>
          <td>2024-12-24 16:16:13</td>
          <td>돼지고기 국거리</td>
          <td>대전 서구 오라클빌딩 3층</td>
          <td>
          	<button class="btn btn-outline-secondary btn-sm">배송시작</button>
          </td>
          <td>
            <button class="btn btn-outline-secondary btn-sm">주문 취소</button>
          </td>
        </tr>
        
        <tr>
          <td>401</td>
          <td>2024-12-24 16:16:13</td>
          <td>돼지고기 국거리</td>
          <td>대전 서구 오라클빌딩 3층</td>
          <td>
          	<button class="btn btn-outline-secondary btn-sm">배송시작</button>
          </td>
          <td>
            <button class="btn btn-outline-secondary btn-sm">주문 취소</button>
          </td>
        </tr>
        
        <tr>
          <td>401</td>
          <td>2024-12-24 16:16:13</td>
          <td>돼지고기 국거리</td>
          <td>대전 서구 오라클빌딩 3층</td>
          <td>
          	<button class="btn btn-outline-secondary btn-sm">배송시작</button>
          </td>
          <td>
            <button class="btn btn-outline-secondary btn-sm">주문 취소</button>
          </td>
        </tr>
        
        <tr>
          <td>401</td>
          <td>2024-12-24 16:16:13</td>
          <td>돼지고기 국거리</td>
          <td>대전 서구 오라클빌딩 3층</td>
          <td>
          	<button class="btn btn-outline-secondary btn-sm">배송시작</button>
          </td>
          <td>
            <button class="btn btn-outline-secondary btn-sm">주문 취소</button>
          </td>
        </tr>
        
        
		</tbody>
	</table>

	</div>
	
</body>
</html>