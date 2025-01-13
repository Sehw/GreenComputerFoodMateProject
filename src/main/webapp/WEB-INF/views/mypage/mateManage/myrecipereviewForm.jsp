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
      		<h5 class="mb-0 fw-bold">레시피 리뷰</h5>
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
          	<img src="${contextPath}/resources/images/Food/bazilpasta.jpg" alt="바질 파스타" class="img-fluid rounded" style="width: 50px; height: 50px; object-fit: cover;">
          	<span class="text-truncate-multiline">
          		이 레시피는 재료도 간단하고 따라 하기 쉬워서 초보자에게도 딱이에요. 바질 소스가 깊은 풍미를 주는데, 신선한 채소와 치즈를 올리니 정말 레스토랑 같은 맛이 나더라고요. 가족 모두가 만족한 저녁 식사였습니다! 이 레시피는 제 파스타 요리 중 최애 메뉴로 자리 잡았어요. 강력 추천합니다!
          	</span>
          </td>
          <td>⭐⭐⭐⭐⭐</td>
          <td>2024-12-24 16:16:13</td>
          <td>
            <button class="btn btn-outline-secondary btn-sm" disabled>바로가기</button>
          </td>
        </tr>
        <tr>
          <td class="review-cell">
          	<img src="${contextPath}/resources/images/Food/dumpling.jpg" alt="만두" class="img-fluid rounded" style="width: 50px; height: 50px; object-fit: cover;">
          	<span class="text-truncate-multiline">
          		만두피부터 속재료까지 이 레시피는 집에서 간편하게 만들 수 있도록 잘 설명되어 있어요. 특히, 만두 속의 재료 비율이 아주 적절해서 맛이 정말 균형 잡혀 있었어요. 직접 만든 만두라 그런지 쫄깃한 만두피와 풍성한 속재료의 조화가 레스토랑에서 먹는 것보다 더 만족스러웠습니다!
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