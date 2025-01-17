<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레시피 상세</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
	
	
    	<style>

		/* 레시피 페이지 스타일 */
		.recipe-container {
		    background-color: #f8f9fa;
		    padding: 40px;
		}
		
		.recipe-title {
		    font-size: 2.5rem;
		    font-weight: bold;
		    color: #333;
		}
		
		.recipe-image {
		    max-width: 100%;
		    border-radius: 8px;
		    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
		}
		
		.recipe-section-title {
		    font-size: 1.5rem;
		    font-weight: bold;
		    color: #333;
		}
		
		/* 재료 박스 스타일 */
		.ingredients-box {
		    display: flex;
		    flex-wrap: wrap;
		    gap: 15px;
		    justify-content: flex-start;
		    padding: 20px;
		}
		
		.ingredient-card {
		    display: flex;
		    align-items: center;
		    background-color: #fff; 
		    border-radius: 8px; 
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
		    padding: 15px 20px;
		    width: 220px; 
		    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out; 
		}
		
		.ingredient-card:hover {
		    transform: translateY(-10px); /* 마우스 오버시 위로 올라가는 효과 */
		    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 효과 */
		}
		
		.ingredient-text {
		    font-size: 1.2rem;
		    font-weight: bold;
		    color: #333;
		}
		
		/* 모바일 대응: 화면 크기에 따라 카드 크기 조정 */
		@media (max-width: 1024px) {
		    .ingredient-card {
		        width: calc(50% - 10px); /* 1024px 이하에서는 카드 2개씩 표시 */
		    }
		}
		
		@media (max-width: 768px) {
		    .ingredient-card {
		        width: calc(100% - 10px); /* 768px 이하에서는 카드 1개씩 표시 */
		    }
		}
		
		/* 조리법 카드 스타일 */
		.cooking-step {
		    font-size: 1.1rem;
		    margin-bottom: 10px;
		}
		
		
		.cooking-steps-box {
		    display: flex;
		    flex-direction: column;
		    gap: 20px; /* 카드 간의 간격 */
		}
		
		.cooking-step-card {
		    display: flex;
		    align-items: center;
		    background-color: #fff; /* 카드 배경 색상 */
		    border-radius: 8px; /* 둥근 모서리 */
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 카드 그림자 효과 */
		    padding: 20px;
		    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out; /* 호버 효과 */
		}
		
		.cooking-step-card:hover {
		    transform: translateY(-10px); /* 마우스 오버시 위로 올라가는 효과 */
		    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 효과 */
		}
		
		.cooking-step-image {
		    width: 120px;
		    height: 120px;
		    margin-right: 20px;
		}
		
		.cooking-step-image img {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		    border-radius: 8px;
		}
		
		.cooking-step-text {
		    flex: 1;
		}
		
		.cooking-step-text h5 {
		    font-size: 1.25rem;
		    font-weight: bold;
		    color: #333;
		}
		
		.cooking-step-text p {
		    font-size: 1rem;
		    line-height: 1.6;
		    color: #555;
		}
		
		/* 모바일 대응: 화면 크기에 따라 카드 크기 조정 */
		@media (max-width: 768px) {
		    .cooking-step-card {
		        flex-direction: column; /* 모바일에서는 카드 안에서 이미지와 텍스트를 세로로 배치 */
		        align-items: flex-start;
		    }
		
		    .cooking-step-image {
		        margin-bottom: 15px;
		    }
		}
		
		
		.share-buttons {
		    display: flex;
		    align-items: center;
		}
		
		.share-buttons a {
		    font-size: 1.2rem;
		    color: #333;
		    display: flex;
		    align-items: center;
		}
		
		.social-icon {
		    width: 30px;
		    height: 30px;
		    margin-right: 10px;
		}
		
		.share-buttons a:hover {
		    color: #0073e6;
		}
		
		.share-buttons a:active {
		    color: #005bb5;
		}
		.comment-section {
		    margin-top: 50px;
		}
		
		.recent-recipes {
		    margin-top: 40px;
		}
		
		/* 댓글 스타일 */
		.comment {
		    display: flex;
		    flex-direction: column;
		    margin-bottom: 20px;
		}
		
		.comment-header {
		    display: flex;
		    align-items: center;
		    margin-bottom: 10px;
		}
		
		.profile-image {
		    width: 50px;
		    height: 50px;
		    border-radius: 50%;
		    overflow: hidden;
		    margin-right: 10px;
		}
		
		.profile-image img {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		}
		
		.comment-details {
		    display: flex;
		    flex-direction: column;
		}
		
		.username {
		    font-weight: bold;
		    font-size: 14px;
		}
		
		.date-time {
		    font-size: 12px;
		    color: #888;
		}
		
		.rating-stars {
		    font-size: 14px;
		    color: gold;
		}
		
		.comment-content {
		    position: relative; 
		}
		
		.comment-content button { 
		
		    background-color: #f39c12;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    padding: 5px 10px;
		    font-size: 12px;
		    cursor: pointer;
		}
		
		.comment-content button:hover {
		    background-color: #e67e22;
		}
		
		.comment-content p {
		    font-size: 14px;
		    line-height: 1.5;
		    margin: 0;
		}
		
		.comment-separator {
		    border: 0;
		    border-top: 1px solid #ccc;
		    margin-top: 15px;
		}
		
		.w-btn-red-outline {
			border:1px solid #f39c12;
		    border-radius:8px;
		    background-color: #f39c12;
		    color: #fff;
		    font-size:14px;
		    margin-top:10px;
		}
		
		.w-btn-red-outline:hover {
			border:1px solid #e67e22;
		 	background-color: #e67e22;
		    transform: scale(1);
		}
		
		/* 최근 본 레시피 */
		.swiper-container {
		    width: 100%;
		    overflow: hidden;
		}
		
		.swiper-wrapper {
		    display: flex;
		}
		
		.swiper-slide {
		    flex: 1;
		    margin-right: 20px;
		}
		
		.recipe-item {
		    text-align: center;
		}
		
		.recipe-image {
		    width: 100%;
		    height: 150px;
		    background-color: #ccc;
		    border-radius: 8px;
		    margin-bottom: 10px;
		}
		
		.recipe-title {
		    font-size: 1.2rem;
		    font-weight: bold;
		    color: #333;
		}
		
		/* 통합 구매 버튼 */
		        .submit-btn {
		        	width:40%;
		        	height:auto;
		            background-color: #f39c12;
		            color: white;
		            border: none;
		            padding: 15px 30px;
		            font-size: 1.5rem;
		            font-weight: 800;
		            border-radius: 6px;
		            cursor: pointer;
		            margin-bottom:20px;
		            transition: background-color 0.3s ease;
		        }
		
		        .submit-btn:hover {
		            background-color: #e67e22;
		        }
		
		        .submit-btn:active {
		            background-color: #d87f1c;
		        }
		
		/* 모바일 대응: 화면 크기에 따라 슬라이드 수 조정 */
		@media (max-width: 1024px) {
		    .swiper-slide {
		        width: calc(100% / 2 - 10px); /* 1024px 이하에서는 2개 슬라이드 */
		    }
		}
		
		@media (max-width: 768px) {
		    .swiper-slide {
		        width: calc(100% - 10px); /* 768px 이하에서는 1개 슬라이드 */
		    }
		}
		
		/* Textarea 넓게 고정 */
		textarea.form-control {
		    width: 100%; /* 100% 너비 */
		    height: 120px; /* 높이는 120px로 고정 */
		    padding: 10px;
		    resize: none;
		    border: 2px solid #ccc;
		    border-radius: 8px;
		    margin-bottom: 10px;
		    font-size: 14px;
		}
		
		/* 별점 수정 줄 */
		.rating-line {
		    position: relative;
		    width: 100%;
		    margin-top: 10px;
		}
		
		.rating-line .stars {
		    display: flex;
		
		}
		
		.rating-line .star {
		    font-size: 20px;
		    color: gray;
		    cursor: pointer;
		}
		
		/* 수정완료 버튼 */
		#submit-comment-btn {
		    position: absolute;
		    right: 0;
		    bottom: 0;
		    padding: 10px 20px;
		    background-color: #f39c12;
		    color: white;
		    border: none;
		    border-radius: 8px;
		    font-size: 14px;
		    cursor: pointer;
		}
		
		/* 별점 수정란에 클릭 시 별 색상 변경 */
		#edit-star-rating .star {
		    font-size: 20px;
		    color: gray;
		    cursor: pointer;
		}
		
		/* 수정 텍스트 입력창 넓게 고정 */
		#editCommentForm-1 textarea {
		    width: 100%; /* 100% 너비 */
		    height: 120px; /* 높이는 120px로 고정 */
		    padding: 10px;
		    resize: none;
		    border: 2px solid #ccc;
		    border-radius: 8px;
		    margin-bottom: 10px;
		    font-size: 14px;
		    box-sizing: border-box; /* padding을 포함한 너비 계산 */
		}
		
		/* 수정완료 버튼 오른쪽 아래 고정 */
		#editCommentForm-1 button {
			width:100px;
			height:28px;
		    position: absolute;
		    right: 0;
		    bottom: 0;
		    background-color: #f39c12;
		    color: white;
		    border: none;
		    border-radius: 8px;
		    font-size: 14px;
		    cursor: pointer;
		}
		</style>
</head>
<body>
    <div class="container recipe-container">
        <div class="row">
            <div class="col-md-8">
                <!-- 레시피 사진 -->
                <div class="mb-4">
                    <img src="${pageContext.request.contextPath}/resources/images/pasta.PNG" alt="Recipe Image">
                </div>

                <!-- 레시피 제목 및 음식 이름 -->
                <div class="mb-4">
                    <h2>투움바 파스타</h2>
                </div>

                <!-- 소요시간 -->
                <div class="mb-4">
                    <span class="badge bg-warning text-dark">소요시간: 30분 이내</span>
                </div>
                
                

                <!-- 레시피 소개글 -->
                <div class="mb-4">
    				<h2 class="recipe-section-title">레시피 소개</h2>
    				<p>매콤하고 부드러운 크림 소스가 어우러진 <strong>투움바 파스타</strong>는 한 입 먹으면 누구나 반할 맛입니다.<br>
    				   신선한 청양고추와 촉촉한 닭고기의 조화가 매운 맛을 더해 주어, 식사 시간이 더욱 특별하게 느껴집니다.<br>
					   면발이 크림소스를 풍성하게 감싸며, 풍미 가득한 국물이 밥에 비벼 먹기에도 좋답니다. <br>
					   오늘, 이 맛있는 크림 파스타를 만들어보세요! 🍝✨</p>
					</div>


               <!-- 기본재료 -->
				<div class="mb-4">
				    <h2 class="recipe-section-title">기본재료</h2>
				    <div class="ingredients-box">
				        <div class="ingredient-card">
				            <div class="ingredient-text">페투치네면 180g</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">베이컨 3줄</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">새우 10마리</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">양송이버섯 3개</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">양파 ¼개</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">마늘 3쪽</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">페페론치노 3개</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">버터 1큰술</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">그라나파다노치즈 (또는 파르메산치즈) 약간</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">올리브유 약간</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">후춧가루 약간</div>
				        </div>
				    </div>
				</div>
				
				<!-- 새우 양념 소스 -->
				<div class="mb-4">
				    <h2 class="recipe-section-title">새우 양념 소스</h2>
				    <div class="ingredients-box">
				        <div class="ingredient-card">
				            <div class="ingredient-text">파프리카 파우더 (또는 고운 고춧가루) ½큰술</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">맛술 1큰술</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">올리브오일 ½큰술</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">소금 약간</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">후춧가루 약간</div>
				        </div>
				    </div>
				</div>
				
				<!-- 크림 소스 재료 -->
				<div class="mb-4">
				    <h2 class="recipe-section-title">크림 소스 재료</h2>
				    <div class="ingredients-box">
				        <div class="ingredient-card">
				            <div class="ingredient-text">생크림 1+½컵</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">우유 ½컵</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">간장 ½큰술</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">파마산 치즈가루 1+½큰술</div>
				        </div>
				        <div class="ingredient-card">
				            <div class="ingredient-text">실파</div>
				        </div>
				    </div>
				</div>
				<button type="submit" class="submit-btn">식재료 통합 구매</button>
				

                <!-- 조리법 -->
				<div class="mb-4">
				    <h2 class="recipe-section-title">조리법</h2><br>
				    <div class="cooking-steps-box">
				        <div class="cooking-step-card">
				            <div class="cooking-step-image">
				                <img src="${pageContext.request.contextPath}/resources/images/ex_step1.PNG" alt="Step 1" class="step-image">
				            </div>
				            <div class="cooking-step-text">
				                <h5>Step 1</h5>
				                <p>실파는 송송 썰어 크림 소스 재료와 섞어 준비해 주세요. 새우는 새우 양념 재료를 넣어 10분정도 재워주세요.</p>
				            </div>
				        </div>
				
				        <div class="cooking-step-card">
				            <div class="cooking-step-image">
				                <img src="${pageContext.request.contextPath}/resources/images/ex_step2.PNG" alt="Step 2" class="step-image">
				            </div>
				            <div class="cooking-step-text">
				                <h5>Step 2</h5>
				                <p>베이컨과 양송이버섯은 한 입 크기로 자르고 양파는 채를 썰어주세요. 마늘은 편으로 썰고 페페론치노는 잘게 다져주세요.</p>
				            </div>
				        </div>
				
				        <div class="cooking-step-card">
				            <div class="cooking-step-image">
				                <img src="${pageContext.request.contextPath}/resources/images/ex_step3.PNG" alt="Step 3" class="step-image">
				            </div>
				            <div class="cooking-step-text">
				                <h5>Step 3</h5>
				                <p>끓는 물 1리터에 소금 1/2큰술을 넣고 페투치니면을 넣어 9분정도 삶아주세요.</p>
				            </div>
				        </div>
				
				        <div class="cooking-step-card">
				            <div class="cooking-step-image">
				                <img src="${pageContext.request.contextPath}/resources/images/ex_step4.PNG" alt="Step 4" class="step-image">
				            </div>
				            <div class="cooking-step-text">
				                <h5>Step 4</h5>
				                <p>팬에 올리브오일을 두르고 버터를 녹인 후 마늘과 양파, 페퍼론치노를 넣어 볶다가 향이 올라오면 베이컨을 넣어 볶고 새우와 양송이버섯을 넣어 볶아주세요.</p>
				            </div>
				        </div>
				
				        <div class="cooking-step-card">
				            <div class="cooking-step-image">
				                <img src="${pageContext.request.contextPath}/resources/images/ex_step5.PNG" alt="Step 5" class="step-image">
				            </div>
				            <div class="cooking-step-text">
				                <h5>Step 5</h5>
				                <p>새우가 익으면 크림 소스 재료를 넣어 섞고 소스가 바글바글 끓으면 페투치네면을 넣어 소스가 면에 베이도록 볶은 후 약간의 소금, 후춧가루로 간을 맞추고 불을 꺼주세요. 
								(tip 파스타의 농도는 생크림과 파르메산 치즈가루를 가감해서 조절해 주세요.)</p>
				            </div>
				        </div>
				
				        <div class="cooking-step-card">
				            <div class="cooking-step-image">
				                <img src="${pageContext.request.contextPath}/resources/images/ex_step6.PNG" alt="Step 6" class="step-image">
				            </div>
				            <div class="cooking-step-text">
				                <h5>Step 6</h5>
				                <p>접시에 투움바 파스타를 담고 그라나파다노 치즈(또는 파르메산 치즈)를 갈아 뿌리고 파슬리가루를 뿌려 맛있게 즐겨주세요.</p>
				            </div>
				        </div>
				    </div>
				</div>


                <!-- 완성 사진 -->
                <div class="mb-4">
                    <img src="${pageContext.request.contextPath}/resources/images/pasta_complete.PNG" alt="Completed Dish">
                </div>

				<!-- 공유하기 아이콘 -->
				<div class="share-buttons mb-4">
				    <h2 class="recipe-section-title">공유하기</h2>
				    
				    <a href="https://www.kakao.com/" target="_blank" class="share-icon ms-3">
				        <img src="${pageContext.request.contextPath}/resources/images/kakaotalk.png" 
				        alt="카카오톡" class="social-icon">
				    </a>
				    <a href="https://www.instagram.com/" target="_blank" class="share-icon ms-3">
				        <img src="${pageContext.request.contextPath}/resources/images/instagram.png"
				         alt="인스타그램" class="social-icon"> 
				    </a>
				    <a href="https://www.facebook.com/" target="_blank" class="share-icon ms-3">
				        <img src="${pageContext.request.contextPath}/resources/images/facebook.png"
				         alt="페이스북" class="social-icon">
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
                     <button class="w-btn-outline w-btn-red-outline" type="button">후기 작성
                   	 </button>

                    <div class="mt-4">
                        <!-- 댓글 1 -->
                        <div class="comment">
                            <div class="comment-header">
                                <div class="profile-image">
                                    <!-- 임의의 회색 배경 프로필 이미지 -->
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
								           <br>
									    <textarea id="editCommentContent-1">파스타가 맛있게 매워서 좋았어요.</textarea>

								          
										 <button onclick="submitCommentEdit(1)">수정 완료</button>
									</div>
                                <button onclick="editComment(1)">수정</button>
                                <button>삭제</button>
                            </div>
                            <hr class="comment-separator">
                        </div>
                    </div>
                </div>
            </div>
            
            


<script>

let currentRating = 0;
let currentEditRating = 0;

function setRating(rating, isEdit = false) {
    if (isEdit) {
        currentEditRating = rating;
        updateStars(true);
    } else {
        currentRating = rating;
        updateStars(false);
    }
}

function updateStars(isEdit) {
    const stars = isEdit ? document.querySelectorAll("#edit-star-rating .star") : document.querySelectorAll("#star-rating .star");
    stars.forEach((star, index) => {
        star.style.color = index < (isEdit ? currentEditRating : currentRating) ? 'gold' : 'gray';
    });
}

    function editComment(commentId) {
        document.getElementById("editCommentForm-" + commentId).style.display = 'block';
        var currentComment = document.getElementById("commentText-" + commentId).innerText;
        document.getElementById("editCommentContent-" + commentId).value = currentComment;
    }

    function submitCommentEdit(commentId) {
        var editedContent = document.getElementById("editCommentContent-" + commentId).value;
        document.getElementById("commentText-" + commentId).innerText = editedContent;
        document.getElementById("editCommentForm-" + commentId).style.display = 'none';
        alert("댓글이 수정되었습니다.");
    }
</script>
            

  		<div class="mt-5">
			<h5>최근 본 레시피</h5>
			
			<div class="swiper-container">
				<div class="swiper-wrapper">
					
					<div class="swiper-slide">
						<div class="recipe-item">
							<div class="recipe-image" style="background-color: #ccc;">이미지</div>
							<h6 class="recipe-title">레시피 제목 1</h6>
						</div>
					</div>

					<div class="swiper-slide">
						<div class="recipe-item">
							<div class="recipe-image" style="background-color: #ccc;">이미지</div>
							<h6 class="recipe-title">레시피 제목 2</h6>
						</div>
					</div>

					<div class="swiper-slide">
						<div class="recipe-item">
							<div class="recipe-image" style="background-color: #ccc;">이미지</div>
							<h6 class="recipe-title">레시피 제목 3</h6>
						</div>
					</div>

					<div class="swiper-slide">
						<div class="recipe-item">
							<div class="recipe-image" style="background-color: #ccc;">이미지</div>
							<h6 class="recipe-title">레시피 제목 4</h6>
						</div>
					</div>

					<div class="swiper-slide">
						<div class="recipe-item">
							<div class="recipe-image" style="background-color: #ccc;">이미지</div>
							<h6 class="recipe-title">레시피 제목 5</h6>
						</div>
					</div>

					<div class="swiper-slide">
						<div class="recipe-item">
							<div class="recipe-image" style="background-color: #ccc;">이미지</div>
							<h6 class="recipe-title">레시피 제목 6</h6>
						</div>
					</div>
				</div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
				

			</div>
		</div>



	</div>





	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script>
		// Swiper 초기화
		const swiper = new Swiper(".swiper-container", {
			slidesPerView : 3, // 한 화면에 보여질 슬라이드 수
			spaceBetween : 20, // 슬라이드 간격
			navigation : {
				nextEl : ".swiper-button-next", // 다음 버튼
				prevEl : ".swiper-button-prev" // 이전 버튼
			},
			breakpoints : {
				1024 : {
					slidesPerView : 4, // 1024px 이상일 때 슬라이드 4개 표시
				},
				768 : {
					slidesPerView : 2, // 768px 이하일 때 슬라이드 2개 표시
				},
				480 : {
					slidesPerView : 1, // 480px 이하일 때 슬라이드 1개 표시
				}
			}
		});
	</script>



</body>

</html>