<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레시피 목록</title>

	<!-- jQuery, Slick, Swiper 포함 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

<!-- Swiper CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<style>
.recipe-image {
    background-color: #ccc;
    width: 100%;
    height: 150px;
    display: flex;
    border-radius: 8px;
    justify-content: center;
    align-items: center;
    color: #777;
    font-size: 20px;
}

.recipe-image img {
    background-color: #ccc;
    width: 100%;
    height: 150px;
    display: flex;
    border-radius: 8px;
    justify-content: center;
    align-items: center;
    color: #777;
    font-size: 20px;
}

.recipe-card {
    margin-bottom: 20px;
}

.recipe-title {
    font-size: 1.2rem;
    font-weight: bold;
}

.recipe-info {
    font-size: 0.9rem;
    color: #666;
}

.slider {
    position: relative;
    width: 100%;
}

.swiper-button-prev, .swiper-button-next {
    font-size: 30px;
    color: #bbb;
    background: transparent;
    border: none;
    transform: translateY(-50%);
    z-index: 10;
    cursor: pointer;
}

.swiper-button-prev, .swiper-button-next {
    opacity: 0.7;
    margin-top:125%;
}

.swiper-button-prev:hover, .swiper-button-next:hover {
    opacity: 1;
}

.pagination {
    justify-content: center;
    margin-top: 20px;
}

.swiper-slide {
    height: 200px;
}

.swiper-container {
    width: 100%;
    overflow: hidden;
}

@media ( max-width : 767px) {
    .recipe-card {
        margin-bottom: 15px;
    }
}

.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.pagination a {
    margin: 0 5px;
    padding: 8px 12px;
    background-color: #bbb;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.pagination a:hover {
    background-color: #999;
}

.pagination .active {
    background-color: #999;
    font-weight: bold;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.left-section {
    display: flex;
    flex-direction: column;
}

.search-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
}

.search-container input[type="text"] {
    padding: 8px 12px;
    width: 300px;
    margin-left: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.search-container button {
    padding: 8px 12px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-left: 10px;
}

.search-container button:hover {
    background-color: #0056b3;
}

    .category-section {
        padding: 30px;
        background-color: #f7f7f7;
        border-radius: 15px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        margin-top: 40px;
        text-align: center;
    }

    .category-container {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 30px;
    }

    .category-card {
        background-color: #fbe28a;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        padding: 25px;
        width: 70%;
        min-width: 350px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        cursor: pointer;
    }

    .category-card h5 {
        font-size: 1.8rem;
        font-weight: 800;
        color: #e67e22;
        margin-bottom: 30px;
    }

    .category-content {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        gap: 20px;
    }

    .category-category {
        text-align: left;
    }

    .category-category h6 {
        font-size: 1.2rem;
        font-weight: 800;
        color: #f39c12;
        margin-bottom: 10px;
        text-transform: uppercase;
    }

    .category-category ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    .category-category ul li {
        font-size: 1rem;
        color: #777;
    }

    .category-category ul li a {
        color: #fff;
        text-decoration: none;
        font-weight: 800;
        transition: color 0.3s ease;
    }

    .category-category ul li a:hover {
        color: #e67e22;
        text-decoration: none;
    }

    .category-card:hover {
        transform: scale(1.05);
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
    }

@media (max-width: 1024px) {
    .category-card {
        width: 100%;
    }
}

@media (max-width: 767px) {
    .category-card {
        width: 100%;
    }
}

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


</style>

</head>

<body>
	<div class="category-section mt-4">

    <div class="category-container">
        <!-- 모든 카테고리를 한 박스에 담기 -->
        <div class="category-card">
            <h5>원하는 레시피를 찾아보세요!</h5>
            <div class="category-content">
                <!-- 한식 카테고리 -->
                <div class="category-category">
                    <h6>🥘한식</h6>
                    <ul>
                        <li><a href="#">국/찌개</a></li>
                        <li><a href="#">구이</a></li>
                        <li><a href="#">전/부침</a></li>
                        <li><a href="#">볶음류</a></li>
                        <li><a href="#">조림/찜류</a></li>
                        <li><a href="#">반찬류</a></li>
                        <li><a href="#">면류</a></li>
                        <li><a href="#">전통 디저트</a></li>
                    </ul>
                </div>

                <!-- 양식 카테고리 -->
                <div class="category-category">
                    <h6>🍽️양식</h6>
                    <ul>
                        <li><a href="#">스테이크</a></li>
                        <li><a href="#">파스타</a></li>
                        <li><a href="#">피자</a></li>
                        <li><a href="#">수프</a></li>
                        <li><a href="#">리조또</a></li>
                        <li><a href="#">오믈렛</a></li>
                        <li><a href="#">샌드위치/버거</a></li>
                        <li><a href="#">치킨 요리</a></li>
                        <li><a href="#">디저트</a></li>
                    </ul>
                </div>

                <!-- 일식 카테고리 -->
                <div class="category-category">
                    <h6>🍣일식</h6>
                    <ul>
                        <li><a href="#">회</a></li>
                        <li><a href="#">스시</a></li>
                        <li><a href="#">라멘</a></li>
                        <li><a href="#">전골</a></li>
                        <li><a href="#">튀김</a></li>
                        <li><a href="#">덮밥</a></li>
                    </ul>
                </div>

                <!-- 중식 카테고리 -->
                <div class="category-category">
                    <h6>🍚중식</h6>
                    <ul>
                        <li><a href="#">볶음밥</a></li>
                        <li><a href="#">딤섬</a></li>
                        <li><a href="#">해물</a></li>
                        <li><a href="#">육류</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>




	<div class="container mt-4">
		<div class="mb-3 text-end">
			<button class="btn btn-outline-primary me-2">최신순</button>
			<button class="btn btn-outline-primary">평점순</button>
		</div>



	

		<div class="row">
			<div class="col-md-3 col-sm-6">
			    <!-- a 태그를 div 태그 바깥으로 위치시킵니다. -->
			    <a href="${contextPath}/main3.do" class="text-decoration-none">
			        <div class="card recipe-card">
			            <div class="recipe-image"><img src="${pageContext.request.contextPath}/resources/images/pasta.PNG" alt="Recipe Image"></div>
			            <div class="card-body">
			                <h5 class="recipe-title">레시피 제목</h5>
			                <p class="recipe-info">
			                    작성자: 이정희 <br> 평점: 4.5 (참여: 20명) <br> 조리시간: 30분
			                </p>
			            </div>
			        </div>
			    </a>
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="card recipe-card">
					<div class="recipe-image">이미지</div>
					<div class="card-body">
						<h5 class="recipe-title">레시피 제목</h5>
						<p class="recipe-info">
							작성자: 김영호 <br> 평점: 4.0 (참여: 15명) <br> 조리시간: 25분
						</p>					
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="card recipe-card">
					<div class="recipe-image">이미지</div>
						<div class="card-body">
						<h5 class="recipe-title">레시피 제목</h5>
						<p class="recipe-info">
							작성자: 최민수 <br> 평점: 4.8 (참여: 10명) <br> 조리시간: 20분
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="card recipe-card">
					<div class="recipe-image">이미지</div>
					<div class="card-body">
						<h5 class="recipe-title">레시피 제목</h5>
						<p class="recipe-info">
							작성자: 박준호 <br> 평점: 3.8 (참여: 45명) <br> 조리시간: 40분
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="card recipe-card">
					<div class="recipe-image">이미지</div>
						<div class="card-body">
						<h5 class="recipe-title">레시피 제목</h5>
						<p class="recipe-info">
							작성자: 윤지혜 <br> 평점: 3.9 (참여: 26명) <br> 조리시간: 30분
						</p>
					</div>
				</div>

			</div>
			<div class="col-md-3 col-sm-6">
				<div class="card recipe-card">
					<div class="recipe-image">이미지</div>
					<div class="card-body">
						<h5 class="recipe-title">레시피 제목</h5>
						<p class="recipe-info">
							작성자: 강상철 <br> 평점: 3.9 (참여: 21명) <br> 조리시간: 40분
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="card recipe-card">
					<div class="recipe-image">이미지</div>
					<div class="card-body">
						<h5 class="recipe-title">레시피 제목</h5>
						<p class="recipe-info">
							작성자: 박진수 <br> 평점: 3.8 (참여: 25명) <br> 조리시간: 50분
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="card recipe-card">
					<div class="recipe-image">이미지</div>
					<div class="card-body">
						<h5 class="recipe-title">레시피 제목</h5>
						<p class="recipe-info">
							작성자: 한유진 <br> 평점: 4.2 (참여: 14명) <br> 조리시간: 25분
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="card recipe-card">
					<div class="recipe-image">이미지</div>
					<div class="card-body">
						<h5 class="recipe-title">레시피 제목</h5>
						<p class="recipe-info">
							작성자: 오성준 <br> 평점: 4.4 (참여: 18명) <br> 조리시간: 40분
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="card recipe-card">
					<div class="recipe-image">이미지</div>
					<div class="card-body">
						<h5 class="recipe-title">레시피 제목</h5>
						<p class="recipe-info">
							작성자: 송미라 <br> 평점: 3.9 (참여: 42명) <br> 조리시간: 45분
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="card recipe-card">
					<div class="recipe-image">이미지</div>
					<div class="card-body">
						<h5 class="recipe-title">레시피 제목</h5>
						<p class="recipe-info">
							작성자: 김동혁 <br> 평점: 4.5 (참여: 33명) <br> 조리시간: 35분
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="card recipe-card">
					<div class="recipe-image">이미지</div>
					<div class="card-body">
						<h5 class="recipe-title">레시피 제목</h5>
						<p class="recipe-info">
							작성자: 이영준<br> 평점: 4.7 (참여: 16명) <br>조리시간: 40분
						</p>
					</div>
				</div>

			</div>
		</div>


		<div class="pagination">
			<a href="#" class="active">1</a> 
			<a href="#">2</a> 
			<a href="#">3</a> 
			<a href="#">4</a> 
			<a href="#">5</a> 
			<a href="#">6</a> 
			<a href="#">7</a> 
			<a href="#">8</a> 
			<a href="#">9</a> 
			<a href="#">10</a>
		</div>
			


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