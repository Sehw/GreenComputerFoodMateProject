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
</head>
<body>
<div class="bodywrapper">
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
			<label for="category">카테고리</label>
			<select name="mainCategory" required>
			<option value="" disabled selected>대분류</option>
			<option value="food">식품</option>
			<option value="beverage">음료</option>
			<option value="condiments">조미료</option>
			</select>
			<select name="subCategory" required>
			<option value="" disabled selected>중분류</option>
			<option value="grains">곡물</option>
			<option value="meat">육류</option>
			<option value="vegetables">채소</option>
			</select>
			<select name="smallCategory" required>
			<option value="" disabled selected>소분류</option>
			<option value="rice">쌀</option>
			<option value="chicken">닭고기</option>
			<option value="cabbage">양배추</option>
			</select>
			</div>
		</div>
      
		<div class="form-Rightbox">
			<div class="row">
				<img id="imgbutton" src="${contextPath}/resources/images/mainimgplaceholder.gif" alt="이미지 클릭">
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
</div>
</body>
</html>
