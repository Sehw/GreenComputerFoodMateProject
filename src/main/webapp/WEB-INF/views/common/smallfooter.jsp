<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<head>
<meta charset="UTF-8">
<title>하단부</title>
   <style>
        .footer {
            background-color: #fa9820;
            color: white; /* 흰색 텍스트 */
            padding: 20px 0;
            text-align: center;
        }
        .footer a {
            color: #00d4ff; /* 하늘색 링크 */
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="footer">
    <div class="container">
        <div class="row align-items-center">
            <!-- 왼쪽: 로고와 설명 (내부 중앙 정렬) -->
            <div class="col-md-2 d-flex flex-column align-items-center text-center">
                <img src="${contextPath}/resources/images/foodmatelogo.png" alt="Logo" class="mb-2" style="width: 160px; height: auto;">
                <p class="mb-0">
                    <strong>FoodMate</strong><br>
                    레시피 공유 및 식재료<br>
                    온라인 판매 서비스
                </p>
            </div>

            <!-- 가운데: Copyright -->
            <div class="col-md-8 text-center">
            	<p class="mb-0">대표 : @@@ / e-mail: admin@test.com / F: 042)123-4567</p>
            	<p class="mb-0">대전 서구 대덕대로 182 오라클빌딩 10층</p>
            	<p class="mb-0">문의전화(운영시간 평일 09:00 ~ 18:00) 042)123-4567</p>
            	<p class="mb-0">상품등록문의: 042)123-4567</p>
            	<p class="mb-0">서비스 이용문의: 070-1234-5678</p>
            	<p></p>
                <p class="mb-0">© 2025 FoodMate. All rights reserved.</p>
            </div>


        </div>
    </div>
        </div>
</body>
</html>