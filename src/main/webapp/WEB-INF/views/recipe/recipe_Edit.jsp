<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.spring.FoodMate.member.dto.BuyerDTO" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>레시피 수정</title>
    <!-- jQuery 예시 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>

	body {
	background-color: #f1e9e0;
	}
  
    .recipe-form-container {
    	width:65%;
        margin: 50px auto;
        background-color: #fff;
        padding: 40px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    
    h2 {
        text-align: center;
        font-size: 2.5rem;
        color: #333;
        margin-bottom: 20px;
    }

    
    .form-group {
        margin-bottom: 20px;
    }
    
    .form-group label{
        margin-bottom: 10px;
    }
    
    label {
        font-size: 1.1rem;
        font-weight: bold;
        color: #333;
    }

    input, select, textarea {
        width: 100%;
        padding: 15px;
        font-size: 1rem;
        border-radius: 6px;
        border: 1px solid #ddd;
        box-sizing: border-box;
    }

    input:focus, select:focus, textarea:focus {
        border-color: #f39c12;
        outline: none;
    }

    textarea {
        resize: vertical;
    }

    
    .btn {
        background-color: #f39c12;
        color: white;
        border: none;
        padding: 15px 30px;
        font-size: 1.1rem;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        width: 15%;
        margin-top:15px;
    }

    
    .btn:hover {
        background-color: #e67e22;
    }

    .btn:active {
        background-color: #d87f1c;
    }

    
    .submit-btn {
       width: 100%; 
    }

	

    .ingredient-card {
        background-color: #f9f9f9;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .ingredient-input {
        width: 100%;
        padding: 12px;
        font-size: 1rem;
        border-radius: 6px;
        border: 1px solid #ddd;
        box-sizing: border-box;
        margin-bottom: 10px;
    }

    .ingredient-card input {
        width: 85%;
    }
	
    .ingredient-card button {
        background-color: #e1eef6;
        border: none;
        padding: 10px;
        font-size: 1rem;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .ingredient-card button:hover {
        background-color: #c5d6eb;
    }

    .ingredient-card button:active {
        background-color: #a8c3e1;
    }

    .ingredient-list {
        margin-bottom: 20px;
    }

    .col-md-6 {
        margin-bottom: 10px;
    }

    .step-card {
        background-color: #f9f9f9;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
    }

    .step-card textarea {
        width: 100%;
    }

    .step-card button {
        background-color: #e1eef6;
        border: none;
        padding: 10px;
        font-size: 1rem;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .step-card button:hover {
        background-color: #c5d6eb;
    }

    .step-card button:active {
        background-color: #a8c3e1;
    }

    .step-card .image-upload {
        margin-top: 10px;
    }
    
    button.delete-btn {
		margin-top: 10px;
	}
</style>

<body>
	<div class="recipe-form-container">
	<h2>📝레시피 수정</h2>

		<form id="recipeUpdateForm" action="${contextPath}/recipe/updateRecipe" method="POST" enctype="multipart/form-data">
		    
		     <!-- 작성자 정보 (수정 불가) -->
			<%
			    BuyerDTO buyerDTO = (BuyerDTO) session.getAttribute("buyerInfo");
			    if (buyerDTO != null) {
			        String byr_Id = buyerDTO.getByr_id(); // 예시로 getId() 사용
			%>
			    <label for="byr_Id">작성자:</label>
			    <input type="text" id="byr_Id" name="byr_Id" value="<%= byr_Id %>" readonly>
			<%
			    } else {
			%>
			    <label for="byr_Id">작성자:</label>
			    <input type="text" id="byr_Id" name="byr_Id" value="작성자 정보가 없습니다. 로그인 상태를 확인하세요" disabled style="color: red;">
			<%
			    }
			%>
		    
		    <div>
		        <label for="title">레시피 제목:</label>
		        <input type="text" id="title" name="title" required placeholder="수정할 레시피 제목 입력">
		    </div>
		    
		    <div>
		        <label for="food_Name">음식 이름:</label>
		        <input type="text" id="food_Name" name="food_Name" required placeholder="음식 이름 입력">
		    </div>
		    
		    <div>
		        <label for="req_Time">조리 시간:</label>
		        <input type="text" id="req_Time" name="req_Time" required placeholder="조리 시간 입력">
		    </div>
		    
		    <div>
		        <label for="description">레시피 설명:</label>
		        <textarea id="description" name="description" required placeholder="레시피 설명 입력"></textarea>
		    </div>
		
		    <div>
		        <label for="mainImg_Path">레시피 이미지:</label>
		        <input type="file" id="mainImg_Path" name="mainImg_Path">
		    </div>
		
		    <!-- 재료 목록 -->
		    <br>
		    <h3>재료 입력</h3>
		    <br>
		    <div id="ingredients">
		        <div>
		            <label for="ingrd_Name">재료 이름:</label>
		            <input type="text" name="ingrd_Name" placeholder="수정할  재료 이름 입력" required>
		            <label for="ingrd_Qty">재료 수량:</label>
		            <input type="number" name="ingrd_Qty" placeholder="수정할 재료 수량 입력" required>
		            <label for="unit">단위:</label>
		            <input type="text" name="unit" placeholder="단위 입력" required>
		            <button type="button" class="delete-btn" onclick="removeIngredient(this)">삭제</button> <!-- 삭제 버튼 추가 -->
		        </div>
		    </div>
		    <button type="button" class="btn ingredient-add-btn" onclick="addIngredient()">재료 추가</button>
		    <!-- 레시피 단계 -->
		    <br>
		    <h3>레시피 단계별 조리법</h3>
		    <br>
		    <div id="steps">
		        <div>
		            <label for="rcp_Step">단계 번호:</label>
		            <input type="number" name="rcp_Step" placeholder="단계 번호" required>
		            <label for="step_Desc">단계 설명:</label>
		            <textarea name="step_Desc" placeholder="수정할 단계 설명 입력" required></textarea>
		            <label for="stepImg_Path">단계 이미지:</label>
		            <input type="file" name="stepImg_Path">
		            <button type="button" class="delete-btn" onclick="removeStep(this)">삭제</button> <!-- 삭제 버튼 추가 -->
		        </div>
		    </div>
		    <button type="button" class="btn step-add-btn" onclick="addStep()">단계 추가</button>
		
		    <button type="submit" class="btn submit-btn">레시피 수정</button>
		</form>
	</div>
<script>
    var ingredientCount = 2; // 재료 번호
    var stepCount = 2; // 단계 번호

    // 재료 추가 함수
    function addIngredient() {
        var ingredientsDiv = document.getElementById('ingredients');
        var newIngredientDiv = document.createElement('div');
        
        newIngredientDiv.innerHTML = `
            <label for="ingrd_Name">재료 이름:</label>
            <input type="text" name="ingrd_Name" placeholder="재료 이름 입력" required>
            <label for="ingrd_Qty">재료 수량:</label>
            <input type="number" name="ingrd_Qty" placeholder="재료 수량 입력" required>
            <label for="unit">단위:</label>
            <input type="text" name="unit" placeholder="단위 입력" required>
            <button type="button" onclick="removeIngredient(this)">삭제</button> <!-- 삭제 버튼 추가 -->
        `;
        ingredientsDiv.appendChild(newIngredientDiv);
        ingredientCount++; // 재료 추가 시마다 번호 증가
    }

    // 재료 삭제 함수
    function removeIngredient(button) {
        button.parentElement.remove(); // 버튼이 속한 div를 삭제
    }

    // 단계 추가 함수
    function addStep() {
        var stepsDiv = document.getElementById('steps');
        var newStepDiv = document.createElement('div');
        
        newStepDiv.innerHTML = `
            <label for="rcp_Step">단계 번호:</label>
            <input type="number" name="rcp_Step" placeholder="단계 번호" required>
            <label for="step_Desc">단계 설명:</label>
            <textarea name="step_Desc" placeholder="단계 설명 입력" required></textarea>
            <label for="stepImg_Path">단계 이미지:</label>
            <input type="file" name="stepImg_Path">
            <button type="button" onclick="removeStep(this)">삭제</button> <!-- 삭제 버튼 추가 -->
        `;
        stepsDiv.appendChild(newStepDiv);
        stepCount++; // 단계 추가 시마다 번호 증가
    }

    // 단계 삭제 함수
    function removeStep(button) {
        button.parentElement.remove(); // 버튼이 속한 div를 삭제
    }

    // 폼 데이터 서버로 전송 함수
    document.getElementById('recipeUpdateForm').onsubmit = function(event) {
        event.preventDefault();  // 기본 폼 제출을 막음

        var formData = new FormData(this);

        // 재료 목록 처리
        var ingredientsDivs = document.querySelectorAll('#ingredients > div');
        ingredientsDivs.forEach(function(div) {
            var name = div.querySelector('input[name="ingrd_Name"]').value;
            var qty = div.querySelector('input[name="ingrd_Qty"]').value;
            var unit = div.querySelector('input[name="unit"]').value;

            // 기존 name 그대로 사용하면서 FormData에 추가
            formData.append('ingrd_Name', name);
            formData.append('ingrd_Qty', qty);
            formData.append('unit', unit);
        });

        // 단계 목록 처리
        var stepsDivs = document.querySelectorAll('#steps > div');
        stepsDivs.forEach(function(div) {
            var stepNumber = div.querySelector('input[name="rcp_Step"]').value;
            var description = div.querySelector('textarea[name="step_Desc"]').value;
            var image = div.querySelector('input[name="stepImg_Path"]').files[0];

            // 기존 name 그대로 사용하면서 FormData에 추가
            formData.append('rcp_Step', stepNumber);
            formData.append('step_Desc', description);
            if (image) formData.append('stepImg_Path', image);
        });

        // 서버로 전송
        fetch("${contextPath}/recipe/updateRecipe", {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            console.log('성공했을때:', data); // 정확한 에러를 콘솔에 출력
            alert('레시피가 수정 되었습니다');
            // 등록 후 폼 초기화
            document.getElementById('recipeUpdateForm').reset();
            window.location.href = `${contextPath}/recipe/recipe_list`;
        })
        .catch(error => {
            console.log('Error:', error); // 정확한 에러를 콘솔에 출력
            alert('오류가 발생했습니다.');
        });
    };
</script>

</body>
</html>
