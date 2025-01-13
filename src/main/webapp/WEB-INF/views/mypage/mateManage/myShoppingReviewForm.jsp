<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 레시피</title>
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
      		<h5 class="mb-0 fw-bold">쇼핑 리뷰</h5>
    </div>
	<table class="table table-hover table-custom">
		<thead class="table-header table-secondary">
			<tr>
				<td>리뷰</td>
				<td>별점</td>
				<td>작성날짜</td>
				<td>바로가기</td>
			</tr>
		</thead>
      	<tbody>
      	<tr>
          <td class="review-cell">
          	<img src="${contextPath}/resources/images/Shopping/shoppingpot.jpg" alt="냄비" class="img-fluid rounded" style="width: 50px; height: 50px; object-fit: cover;">
          	<span class="text-truncate-multiline">
          		큰 기대를 가지고 샀는데, 처음 몇 번은 정말 재미있고 편리하게 사용했어요. 하지만 시간이 지나면서 모든 요리에 적용하기에는 약간 한계가 느껴졌습니다. 그래도 요리를 자주 하고 다양한 메뉴를 시도하는 분들에겐 괜찮은 선택이 될 것 같아요.
          	</span>
          </td>
          <td>⭐⭐⭐</td>
          <td>2024-12-24 16:16:13</td>
          <td>
            <button class="btn btn-outline-secondary btn-sm" disabled>바로가기</button>
          </td>
        </tr>
        <tr>
          <td class="review-cell">
          	<img src="${contextPath}/resources/images/Shopping/shoppingflipper.jpg" alt="뒤집개" class="img-fluid rounded" style="width: 50px; height: 50px; object-fit: cover;">
          	<span class="text-truncate-multiline">
          		트루쿡 자이언트 계란말이팬과 뒤집개는 대용량 요리나 특별한 요리를 자주 하는 분들에겐 유용한 제품이지만, 일상적인 소량 요리에 사용하기엔 조금 부담스럽습니다. 팬의 크기와 뒤집개의 활용성은 분명 장점이지만, 크기와 보관의 불편함이 단점으로 다가올 수 있습니다.
          	</span>
          </td>
          <td>⭐⭐⭐⭐</td>
          <td>2024-12-24 16:16:13</td>
          <td>
            <button class="btn btn-outline-secondary btn-sm" disabled>바로가기</button>
          </td>
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