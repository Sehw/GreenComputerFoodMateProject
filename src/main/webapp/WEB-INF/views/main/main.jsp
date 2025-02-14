<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value="/resources/css/slide.css" />" rel="stylesheet">
<style>
		.mainslide {
			width: 80%;
			margin: 0 auto;
		}
		.title{
			width: 80%; 
			margin: 0 auto;  /* mainslide와 같은 중앙 정렬 */
			padding-bottom: 5px;  /* 들여쓰기 조정 */
		}
        .slick-slide img {
            width: 100%; /* 이미지 너비 조정 */
            height: 350px; /* 이미지 비율 유지 */
            object-fit: cover;
        }
        .slick-slide {
            margin: 0 10px; /* 슬라이드 간 간격 */
        }
        .slick-prev{
			left: 40px;
		    z-index: 1;
		}
		.slick-next{
			right: 40px;
		    z-index: 1;
		}
		
</style>
<script>
        $(document).ready(function() {
            $('.mainslide').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: false
            });
        });
</script>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
	<h5 class="title"><strong>&#x1F44D 베스트 레시피</strong></h5>
    <div class="mainslide">
    	<c:forEach var="recipe" items="${recipeList}">
    		<a href="${contextPath}/recipe/recipe_Detail?rcp_Id=${recipe.rcp_Id}">
			    <div class="item-img position-relative">
			        <img src="${contextPath}/resources/images/${recipe.mainImg_Path}" alt="Recipe Image" class="img-fluid">
			        <div class="item-title d-flex flex-column justify-content-center align-items-center">
			            <h5><strong>${recipe.title}</strong></h5>
			            <div class="item_etc">
		                	<p><span>${recipe.create_Date}</span>  리뷰 <span>0</span>개  조회수: <span>0</span></p>
		                </div>
		               	<div class="item_review_star">
		                	<p><span>⭐⭐⭐⭐⭐</span></p>
		                </div>
		                <div class="item-footer">
		              		<p><span>작성자: ${recipe.nickname}</span></p>
		              		<p>♥ <span>0</span></p>
		            	</div>
			        </div>
			    </div>
    		</a>
		 </c:forEach>
    </div>
    
    <h5 class="mt-2 title"><strong>&#x1F550 최신 레시피</strong></h5>
    <div class="mainslide">
	    <c:forEach var="recipe" items="${recipeList}">
	    	<a href="${contextPath}/recipe/recipe_Detail?rcp_Id=${recipe.rcp_Id}">
			    <div class="item-img position-relative">
			        <img src="${contextPath}/resources/images/${recipe.mainImg_Path}" alt="Recipe Image" class="img-fluid">
			        <div class="item-title d-flex flex-column justify-content-center align-items-center">
			            <h5><strong>${recipe.title}</strong></h5>
			            <div class="item_etc">
		                	<p><span>${recipe.create_Date}</span>  리뷰 <span>0</span>개  조회수: <span>0</span></p>
		                </div>
		                <div class="item_review_star">
		                	<p><span>⭐⭐⭐⭐⭐</span></p>
		                </div>
		                <div class="item-footer">
		              		<p><span>작성자: ${recipe.nickname}</span></p>
		              		<p>♥ <span>0</span></p>
		            	</div>
			        </div>
			    </div>
	    	</a>
		 </c:forEach>
    </div>
    
    <h5 class="mt-2 title"><strong>🎁특가상품</strong></h5>
    <div class="mainslide mb-2">
    	<c:forEach var="product" items="${productList}">
    		<a href="${contextPath}/product/pdtdetail?pdt_id=${product.pdt_id}">
			    <div class="item-img position-relative">
			        <img src="${contextPath}/resources/images/${product.img_path}" alt="Product Image" class="img-fluid">
			        <div class="item-title d-flex flex-column justify-content-center align-items-center">
			            <h5><strong>${product.name}</strong></h5>
			            <div class="item_etc">
		                	<p><span class="item_product_price">${product.price}원</span> <span>⭐⭐⭐⭐⭐</span></p>
		                </div>
		                <div class="item-footer">
		              		<p><span>판매자: ${product.slr_nickname}</span></p>
		            	</div>
			        </div>
			    </div>
    		</a>
		 </c:forEach>
    </div>
</body>
</html>