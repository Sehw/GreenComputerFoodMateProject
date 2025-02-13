<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="recipe" value="${recipeMap.recipeVO}" />
<c:set var="ingredient" value="${recipeMap.ingredientVO}" />
<c:set var="step" value="${recipeMap.stepVO}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레시피 상세</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_Detail.css">
</head>

<body>

<div class="container recipe-container">
    <div class="row">
    	
        <!-- 레시피 정보 (작성자, 이미지, 제목, 시간 등) -->
        <div class="col-md-8">
            <!-- 작성자 -->
            <div class="mb-4">
                <span class="badge bg-info text-dark">작성자: ${recipe.byr_Id}</span>
            </div>

            <!-- 레시피 사진 -->
            <div class="mb-4">
                <img  src="${pageContext.request.contextPath}/resources/images/${recipe.mainImg_Path}" alt="Recipe Image">
            </div>

            <!-- 레시피 제목 및 음식 이름 -->
            <div class="mb-4">
                <h2>${recipe.food_Name}</h2>
            </div>

            <!-- 소요시간 -->
            <div class="mb-4">
                <span class="badge bg-warning text-dark">소요시간: ${recipe.req_Time}</span>
            </div>

            <!-- 레시피 소개글 -->
            <div class="mb-4">
                <h2 class="recipe-section-title">레시피 소개</h2>
                <p>${recipe.description}</p>
            </div>
        </div>
        
    </div>
	
    <!-- 재료 목록 불러오기 -->
    <div class="mb-4">
		<h2 class="recipe-section-title">기본재료</h2>
			<div class="ingredients-box">
			    <c:forEach var="ingredient" items="${recipeMap.ingredientVO}">
			        <div class="ingredient-card">
			            <div class="ingredient-text">
			                ${ingredient.ingrd_Name} ${ingredient.ingrd_Qty}${ingredient.unit}
			            </div>
			        </div>
			    </c:forEach>
			</div>
	<button type="submit" class="submit-btn" onclick="window.location.href='${contextPath}/product/compare'">식재료 통합 구매</button>
	</div>
	<!-- 조리법 -->
	<div class="mb-4">
	    <h2 class="recipe-section-title">조리법</h2><br>
	    <div class="cooking-steps-box">
	        <c:forEach var="step" items="${recipeMap.stepVO}">
	            <div class="cooking-step-card">
	                <div class="cooking-step-image">
	                    <img src="${pageContext.request.contextPath}/resources/images${step.stepImg_Path}" alt="Step ${step.rcp_Step}" class="step-image">
	                </div>
	                <div class="cooking-step-text">
	                    <h5>Step ${step.rcp_Step}</h5>                   
	                    <p>${step.step_Desc}</p>
	                </div>
	            </div>
	        </c:forEach>
	    </div>
	</div>


            <!-- 공유하기 아이콘 -->
            <div class="share-buttons mb-4">
                <h2 class="recipe-section-title">공유하기</h2>
                <a href="https://www.kakao.com/" target="_blank" class="share-icon ms-3">
                    <img src="${pageContext.request.contextPath}/resources/images/kakaotalk.png" alt="카카오톡" class="social-icon">
                </a>
                <a href="https://www.instagram.com/" target="_blank" class="share-icon ms-3">
                    <img src="${pageContext.request.contextPath}/resources/images/instagram.png" alt="인스타그램" class="social-icon"> 
                </a>
                <a href="https://www.facebook.com/" target="_blank" class="share-icon ms-3">
                    <img src="${pageContext.request.contextPath}/resources/images/facebook.png" alt="페이스북" class="social-icon">
                </a>
            </div>

            <!-- 평점 -->
            <div class="comment-section">
                <h2 class="recipe-section-title">레시피 평</h2>
                <div class="rating-line">
                    <div class="stars" id="star-rating">
                        <span class="star" onclick="setRating(1)">★</span>
                        <span class="star" onclick="setRating(2)">★</span>
                        <span class="star" onclick="setRating(3)">★</span>
                        <span class="star" onclick="setRating(4)">★</span>
                        <span class="star" onclick="setRating(5)">★</span>
                    </div>
                </div> 
                <br>             
                <textarea class="form-control" rows="3" placeholder="댓글을 남겨주세요..."></textarea>                      
                <button class="w-btn-outline w-btn-red-outline" type="button">후기 작성</button>

                <div class="mt-4">
                    <!-- 댓글 1 -->
                    <div class="comment">
                        <div class="comment-header">
                            <div class="profile-image">
                                <img src="${pageContext.request.contextPath}/resources/images/profile1.png" alt="Profile Image">
                            </div>
                            <div class="comment-details">
                                <span class="username">양초딩</span>
                                <span class="date-time">2025-01-06 10:10:56</span>
                                <div class="rating-stars">★★★★☆</div>
                            </div>
                        </div>
                        <div class="comment-content">
                            <p>아이가 정말 맛있어해요~ 국물이 조금 부족해서 밥에 비벼먹기 조금 어렵긴 했지만~ 잘 먹었어요^^</p>
                        </div>
                        <hr class="comment-separator">
                    </div>

                    <!-- 댓글 2 -->
                    <div class="comment">
                        <div class="comment-header">
                            <div class="profile-image">
                                <img src="${pageContext.request.contextPath}/resources/images/profile2.jpg" alt="Profile Image">
                            </div>
                            <div class="comment-details">
                                <span class="username">유재석</span>
                                <span class="date-time">2025-01-06 11:00:00</span>
                                <div class="rating-stars">★★★★★</div>
                            </div>
                        </div>
                        <div class="comment-content">
                            <p>정말 맛있어요! 다음에 다시 만들어볼게요!</p>
                        </div>
                        <hr class="comment-separator">
                    </div>

                    <!-- 댓글 3 -->
                    <div class="comment" id="comment-1">
                        <div class="comment-header">
                            <div class="profile-image">
                                <img src="${pageContext.request.contextPath}/resources/images/profile3.jpg" alt="Profile Image">
                            </div>
                            <div class="comment-details">
                                <span class="username">박명수</span>
                                <span class="date-time">2025-01-06 12:30:22</span>
                                <div class="rating-stars">★★★★☆</div>
                            </div>
                        </div>
                        <div class="comment-content" id="comment-1">
                            <p id="commentText-1">파스타가 맛있게 매워서 좋았어요.</p>
                            <div id="editCommentForm-1" style="display: none;">
                                <br>
                                <div class="stars" id="edit-star-rating">
                                    <span class="star" onclick="setRating(1, true)">★</span>
                                    <span class="star" onclick="setRating(2, true)">★</span>
                                    <span class="star" onclick="setRating(3, true)">★</span>
                                    <span class="star" onclick="setRating(4, true)">★</span>
                                    <span class="star" onclick="setRating(5, true)">★</span>
                                </div>
                                <textarea class="form-control" rows="3" id="editCommentContent-1">파스타가 맛있게 매워서 좋았어요.</textarea>
                                <br>
                                <button class="btn btn-secondary" onclick="submitCommentEdit(1)">수정하기</button>
                            </div>
                            <button class="btn btn-primary" onclick="editComment(1)">댓글 수정</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
        // Swiper 초기화
        const swiper = new Swiper(".swiper-container", {
            slidesPerView: 3, 
            spaceBetween: 20, 
            navigation: {
                nextEl: ".swiper-button-next", 
                prevEl: ".swiper-button-prev"
            },
            breakpoints: {
                1024: {
                    slidesPerView: 4,
                },
                768: {
                    slidesPerView: 2,
                },
                480: {
                    slidesPerView: 1,
                }
            }
        });
    </script>

</body>
</html>