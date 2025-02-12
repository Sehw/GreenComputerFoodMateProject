<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />  
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');

.bodywrapper {
	background-color: #f1f3f5;
	margin-top: 0px;
	padding-top: 25px;
	padding-bottom: 40px;
}

.form-container {
	background-color: white;
	font-family: "Noto Sans KR", serif;
	width: 1200px;
	margin: 0px auto;
	border: 1px solid #dee2e6;
}

.form-container .form-Box {
	display: flex;
}

.form-container .form-Leftbox {
	font-size: 1.25rem;
	padding: 15px;
	width: 60%;
}

.form-container .form-Rightbox {
	font-size: 1.25rem;
	padding: 15px;
	width: 40%;
}

.form-container #task_Name {
	padding: 10px 15px;
	font-size: 1.5rem;
	font-weight: 500;
	background-color: #dee2e6;
	border-bottom: 1px solid #ced4da;
}

.row {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
}

.row label {
    margin-right: 10px;
    width: 220px;
}

.row input, .row textarea {
    width: 60%;
}

.row select {
	width: 19%;
}

.row #imgbutton {
	width: 70%;
}

.row button {
	font-size : 2rem;
}

.row button #submit {
	background-color: green;
}

.row button #submit_public {
	background-color: orange;
}

.row button #cancel {
	background-color: lightgray;
}

/* 버튼 스타일 */
.row button {
    font-size: 1rem;
    padding: 10px 20px;
    margin-right: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    width: 200px;
}

#submit {
    background-color: green;
    color: white;
}

#submit_public {
    background-color: orange;
    color: white;
}

#cancel {
    background-color: lightgray;
    color: black;
}

.row button:hover {
    opacity: 0.8;
}

/* 버튼들을 한 줄에 배치 */
.form-container .row {
    display: flex;
    justify-content: center;
    gap: 10px;
}

#imgbutton {
    cursor: pointer;
    width: 100%;
    max-width: 300px;
    height: auto;
}
</style>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
var contextPath = "${contextPath}";
console.log(contextPath);

$(document).ready(function() {
//초기 카테고리 선택
$('#category_1').on('change', function() {
    var selectedCategory = $(this).val();
    console.log(selectedCategory);
    
    // 1단계 카테고리 선택 시 이전 하위 카테고리 초기화
    $('#category_container').empty(); // 자식 카테고리 초기화

    if (selectedCategory) {
        loadSubCategories(selectedCategory, 2); // 2단계 카테고리 로드
    }
});

// 하위 카테고리 로드 함수
function loadSubCategories(parentCategoryId, level) {
	var url1 = contextPath + '/getSubCategories/' + parentCategoryId
	console.log(url1);
    $.ajax({
        url: contextPath + '/getSubCategories/' + parentCategoryId, // 자식 카테고리 가져오는 API
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            if (data.length > 0) {
                // 새롭게 추가할 select 요소
                var select = $('<select>')
                    .attr('name', 'category_' + level)  // 동적 이름
                    .attr('id', 'category_' + level)    // 동적 ID
                    .attr('required', true);

                select.append($('<option>').attr('value', '').text(level + '단계분류'));

                $.each(data, function(index, category) {
                    select.append($('<option>').attr('value', category.category_id).text(category.name));
                });

                // 기존에 있는 select 태그 뒤에 추가
                $('#category_container').append(select);

                // 해당 select에서 변경이 일어나면 자식 카테고리 로드
                select.on('change', function() {
                    var selectedSubCategory = $(this).val();
                    if (selectedSubCategory) {
                        loadSubCategories(selectedSubCategory, level + 1); // 다음 단계 로드
                    }
                });
            }
        },
        error: function(xhr, status, error) {
            console.error('자식 카테고리 로드 실패:', error);
        }
    });
   
    
}

}); 

</script>

</head>
<body>
<main class="bodywrapper">
<article class="form-container">
	<form action="/submit_product" method="POST" enctype="multipart/form-data">
	<div id="task_Name">새로운 상품 등록</div>
	    <div class="form-Box">
			<div class="form-Leftbox">
				<div class="row">
				<label for="productName">상품 이름</label>
				<input type="text" id="pdt_Name" name="pdt_Name" placeholder="상품 이름을 입력하세요" required>
				</div>
			
				<div class="row">
				<label for="productPrice">상품 가격 (₩)</label>
				<input type="text" id="pdt_Price" name="pdt_Price" placeholder="상품 가격을 입력하세요" required>
				</div>
			 
				<div class="row">
				<label for="productDescription">상품 설명</label>
				<textarea id="pdt_Dscrpt" name="pdt_Dscrpt" placeholder="상품 설명을 입력하세요" rows="4" required></textarea>
				</div>
			 
				<div class="row">
				<label for="productWeight">묶음당 수량 또는 무게</label>
				<input type="text" id="pdt_Weight" name="pdt_Weight" placeholder="예: 3(묶음), 600(g), 1000(ml)..." required>
				</div>
			 
				<div class="row">
				<label for="unit">무게 또는 단위</label>
				<input type="text" id="unit" name="unit" placeholder="예: 묶음, g, ml..." required>
				</div>
				
				<div class="row">
				<label for="stock">재고</label>
				<input type="number" id="stock" name="stock" placeholder="예: 30" required>
				</div>
	
				<div class="row">
				<label for="category">카테고리</label>
					
					<select name="category_1" id="category_1" required>
					    <option value="" disabled selected>1단계분류</option>
					    <c:forEach var="category" items="${categories}">
					        <option value="${category.category_id}">${category.name}</option>
					    </c:forEach>
					</select>
					
					<div id="category_container"></div> <!-- 자식 카테고리들을 넣을 div -->

				</div>
				
			</div>
      
		<div class="form-Rightbox">
			<div class="row">
				<label for="introImage">상품 이미지</label>
				<input type="file" id="pdt_Img" name="pdt_Img" accept="image/*" required>
			</div>
			
			<div class="row">
				<label for="introImage">소개 이미지</label>
				<input type="file" id="pdt_DscImg" name="pdt_DscImg" accept="image/*" required>
			</div>
		</div>
		
		</div>
		
		<div class="row">
	        <button type="submit" id="submit">상품 등록</button>
	        <button type="button" id="submit_public">상품 등록 후 공개</button>
	        <button type="button" id="cancel" onclick="window.history.back();">취소</button>
	    </div>
	</form>
	
</article>
</main>
</body>
</html>
