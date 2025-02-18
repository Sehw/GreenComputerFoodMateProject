<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/slide.css" />" rel="stylesheet">
<style>
	.item-img img{
		width: 100%;
		height: 350px;
		object-fit: cover;
	}
</style>
<meta charset="UTF-8">
<title>내 레시피</title>
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">내 레시피</h5>
    </div>
	<div class="grid_container">
	    <c:forEach var="recipe" items="${myrecipeList}">
			<a href="${contextPath}/recipe/recipe_Detail?rcp_id=${recipe.rcp_id}">
				<div class="item-img position-relative">
					<img src="${contextPath}/resources/images/${recipe.mainimg_path}" alt="Recipe Image" class="img-fluid">
						<div class="item-title d-flex flex-column justify-content-center align-items-center">
							<h5><strong>${recipe.title}</strong></h5>
								<div class="item_etc">
									<p><span>${recipe.create_date}</span>  리뷰 <span>0</span>개  조회수: <span>0</span></p>
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
	<div class="slider-controls">
    	<button type="button" class="btn btn-dark" id="prev">이전</button>
    	<button type="button" class="btn btn-dark" id="next">다음</button>
	</div>
</div>
</body>
</html>