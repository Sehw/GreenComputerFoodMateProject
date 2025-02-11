<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />  
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');

body {
	background-color: #f8f9fa;
}

#product_list {
    margin: 0 auto;
    font-family: 'Noto Sans KR', sans-serif;
    max-width: 1200px;
    background-color: white;
}

#product_list .category {
  height: 50px;
  padding: 0px 12px;
  background-color: #f8f9fa;
  border: 1px solid #dee2e6;
  display: flex;
  align-items: center;
}

#product_list #category_text {
  width: 1200px;
  margin: 0 auto;
}

#product_list .sort_button {
	width: 1200px;
	margin: 15px;
    display: flex;
    justify-content: flex-start; /* 왼쪽 정렬 */
    align-items: center; /* 세로 정렬 */
}

#product_list .sort_button .button {
    padding: 5px 10px 5px; /* 내부 여백 */
    border: 1px solid #ccc; /* 외곽선 */
    background-color: #f5f5f5; /* 입력창 배경색과 유사 */
    font-family: 'Noto Sans KR', sans-serif; /* 한국어 폰트 */
    text-align: center; /* 텍스트 중앙 정렬 */
    cursor: pointer; /* 클릭 가능 표시 */
    height: auto; /* 버튼 높이 설정 */
    line-height: 30px; /* 텍스트 정렬 */
    border-left: none; /* 왼쪽 외곽선 제거 */
    transition: background-color 0.3s, border-color 0.3s;
}

#product_list .sort_button .button:first-child {
    border-radius: 5px 0 0 5px; /* 왼쪽 끝 버튼 둥근 모서리 */
    border-left: 1px solid #ccc; /* 왼쪽 외곽선 유지 */
}

#product_list .sort_button .button:last-child {
    border-radius: 0 5px 5px 0; /* 오른쪽 끝 버튼 둥근 모서리 */
}

#product_list .sort_button .button:hover {
    background-color: #e0e0e0; /* 호버 시 더 어두운 배경색 */
    border-color: #999; /* 호버 시 외곽선 색상 변경 */
}

#product_list .container_display {
    width: 1200px;
    margin: 0 auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
}

#product_list .container_product {
    width: 20%;
    box-sizing: border-box;
    padding: 10px;
}

#product_list .container_product p {
    white-space: nowrap; /* 줄 바꿈 방지 */
    overflow: hidden; /* 넘치는 부분 감춤 */
    text-overflow: ellipsis; /* '...' 표시 */
    max-width: 200px; /* 원하는 최대 너비 지정 */
    display: block; /* 블록 요소로 설정 */
}

#product_list .container_product div {
	margin: 0px auto;
	width: 200px;
}

#product_list .pdt_Image {
	width: 200px;
	height: 200px;
	margin-bottom: 10px;
}

#product_list .pdt_Price {
	font-size: 0.75rem;
	text-decoration: line-through;
}

#product_list .pdt_FinalPrice {
	font-size: 1.25rem;
	color: red;
	font-weight: 800;
}

#product_list .pagination {
    margin: 30px 0;
    display: flex;
    justify-content: center;
}

#product_list .pagination_buttons {
    display: flex;
    gap: 5px;
}

#product_list .page_button {
	width: 38px;
    padding: 5px;
    text-align: center;
    border: 1px solid #ccc;
    background-color: #f8f9fa;
    text-decoration: none;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 1.2rem;
    color: #333;
    border-radius: 5px;
    transition: background-color 0.3s, border-color 0.3s;
}

#product_list .page_button:hover {
    background-color: #e0e0e0;
    border-color: #999;
}

#product_list .page_button.active {
    background-color: #fa9820;
    color: #fff;
    border-color: white;
}

</style>
</head>
<body>
<main id="product_list">

	<article class="category">
		<div id="category_text">
		카테고리 : 식재료 > 육류 > 돼지고기
		</div> 
	</article>
	
	<article class="sort_button">
	    <div class="button">메이트추천</div>
	    <div class="button">낮은 가격순</div>
	    <div class="button">높은 가격순</div>
	    <div class="button">판매량순</div>
	</article>
	
	<section class="container_display">
	
		<c:choose>
		    <c:when test="${empty list}">
		        <p>표시할 내용이 없습니다.</p>
		    </c:when>
		    
		    <c:otherwise>
		        <c:forEach var="product" items="${list}">
		        <article class="container_product">
		            <div>
		                <a href="${contextPath}/product_detail?pdt_id=${product.pdt_id}">
		                    <img class="pdt_Image" src="${contextPath}/resources/images/${product.img_path}" alt="productImg">
		                </a>
		                <p>
		                    ${product.name}<br>
		                    판매자 : ${product.slr_nickname}<br>
		                    <span class="pdt_FinalPrice">${product.price}원</span><br>
		                    ⭐⭐⭐⭐⭐<br>
		                </p>
		            </div>
		        </article>
		        </c:forEach>
		    </c:otherwise>
		</c:choose>
	
	</section>

필요한 기능 : 
1. VO에 들어있는 판매자 아이디로 판매자 닉네임 가져와서 넣기
아마 sql 자체에서 프로시저?로 처리? 혹은 판매자 닉네임까지 들어있는 뷰 만들고 거기서 갖고와야할듯?
2. 금액 쉼표 처리하기
3. 상품이 25개 넘어가면 페이지네이션 기능과 연동해서 처리하게하기


	<article class="pagination">
	    <div class="pagination_buttons">
	    	<a href="#" class="page_button active">1</a>
	        <a href="#" class="page_button">2</a>
	        <a href="#" class="page_button">3</a>
	        <a href="#" class="page_button">4</a>
	        <a href="#" class="page_button">5</a>
	        <a href="#" class="page_button">6</a>
	        <a href="#" class="page_button">7</a>
	        <a href="#" class="page_button">8</a>
	        <a href="#" class="page_button">9</a>
	        <a href="#" class="page_button">10</a>
	    </div>
	</article>

</main>
</body>
</html>
