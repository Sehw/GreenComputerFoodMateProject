<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레시피 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <style>
        /* 전체 페이지 배경 */
        body {
            background-color: #f5f5f5;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        /* 레시피 작성 폼 컨테이너 */
        .recipe-form-container {
            max-width: 900px;
            margin: 50px auto;
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* 제목 */
        h2 {
            text-align: center;
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 20px;
        }

        /* 폼 요소 */
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

        /* 제출 버튼 */
        .submit-btn {
        	width:100%;
            background-color: #f39c12;
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 1.1rem;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #e67e22;
        }

        .submit-btn:active {
            background-color: #d87f1c;
        }

        /* 이미지 업로드 버튼 */
        .upload-btn {
            background-color: #e1eef6;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .upload-btn:hover {
            background-color: #c5d6eb;
        }

        .upload-btn:active {
            background-color: #a8c3e1;
        }

        /* 재료 입력 카드를 감싸는 박스 */       
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

        /* 레이아웃 조정 */
        .row {
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
    </style>
</head>
<body>
    <div class="recipe-form-container">
        <h2>레시피 수정</h2>

        <!-- 레시피 작성 폼 -->
        <form action="/submit-recipe" method="POST">
            <!-- 레시피 메인 이미지 -->
            <div class="form-group input-box">
                <label for="recipeImage">레시피 메인 이미지</label>
                <input type="file" id="recipeImage" name="recipeImage" class="upload-btn">
            </div>

            <!-- 제목 -->
            <div class="form-group input-box">
                <label for="recipeTitle">제목</label>
                <input type="text" id="recipeTitle" name="recipeTitle" placeholder="수정할 레시피 제목을 입력하세요" required>
            </div>

            <!-- 음식명 -->
            <div class="form-group input-box">
                <label for="recipeName">음식명</label>
                <input type="text" id="recipeName" name="recipeName" placeholder="수정할 음식명을 입력하세요" required>
            </div>

            <!-- 소요시간 -->
            <div class="form-group input-box">
                <label for="cookingTime">소요시간</label>
                <input type="text" id="cookingTime" name="cookingTime" placeholder="소요 시간을 입력하세요 (예: 30분)" required>
            </div>

            <!-- 소개글 -->
            <div class="form-group input-box">
                <label for="recipeDescription">소개글</label>
                <textarea id="recipeDescription" name="recipeDescription" rows="4" placeholder="수정할 레시피 소개글을 작성하세요" required></textarea>
            </div>

			<!-- 재료 1 -->
			<div class="form-group input-box">
			    <label for="ingredientType1">재료 유형 1</label>
			    <input type="text" id="ingredientType1" class="ingredient-input" placeholder="수정할 재료 유형을 입력하세요">
			    <div class="ingredient-list" id="ingredientList1">
			        <!-- 재료 입력 폼 추가는 이곳에 동적으로 생성됩니다. -->
			    </div>
			    <button type="button" id="addIngredient1" class="upload-btn">재료 1 추가</button>
			</div>
			
			<!-- 재료 2 -->
			<div class="form-group input-box">
			    <label for="ingredientType2">재료 유형 2</label>
			    <input type="text" id="ingredientType2" class="ingredient-input" placeholder="수정할 재료 유형을 입력하세요">
			    <div class="ingredient-list" id="ingredientList2">
			        <!-- 재료 입력 폼 추가는 이곳에 동적으로 생성됩니다. -->
			    </div>
			    <button type="button" id="addIngredient2" class="upload-btn">재료 2 추가</button>
			</div>
			
			<!-- 재료 3 -->
			<div class="form-group input-box">
			    <label for="ingredientType3">재료 유형 3</label>
			    <input type="text" id="ingredientType3" class="ingredient-input" placeholder="수정할 재료 유형을 입력하세요">
			    <div class="ingredient-list" id="ingredientList3">
			        <!-- 재료 입력 폼 추가는 이곳에 동적으로 생성됩니다. -->
			    </div>
			    <button type="button" id="addIngredient3" class="upload-btn">재료 3 추가</button>
			</div>

            <!-- 조리법 -->
            <div class="form-group input-box">
                <label for="cookingSteps">조리법</label>
                <div id="stepList">
                    <!-- 동적으로 생성되는 조리법 입력란 -->
                </div>
                <button type="button" id="addStep" class="upload-btn">조리 단계 추가</button>
            </div>
            


            <!-- 조리완료 이미지 -->
            <div class="form-group input-box">
                <label for="completedImage">조리완료 이미지</label>
                <input type="file" id="completedImage" name="completedImage" class="upload-btn">
            </div>

            <!-- 제출 버튼 -->
            <button type="submit" class="submit-btn">레시피 수정하기</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 재료 추가 버튼에 대한 동적 추가 처리
        document.getElementById('addIngredient1').addEventListener('click', function() {
            addIngredientField('ingredientList1');
        });

        document.getElementById('addIngredient2').addEventListener('click', function() {
            addIngredientField('ingredientList2');
        });

        document.getElementById('addIngredient3').addEventListener('click', function() {
            addIngredientField('ingredientList3');
        });

        // 조리법 단계 추가
        document.getElementById('addStep').addEventListener('click', function() {
            addStepField();
        });

        function addIngredientField(listId) {
            const ingredientList = document.getElementById(listId);
            const newIngredientCard = document.createElement('div');
            newIngredientCard.classList.add('ingredient-card');

            const inputField = document.createElement('input');
            inputField.type = 'text';
            inputField.placeholder = '재료를 입력하세요';
            inputField.name = 'ingredient[]';
            inputField.required = true;

            const removeButton = document.createElement('button');
            removeButton.type = 'button';
            removeButton.textContent = '삭제';
            removeButton.onclick = function() {
                ingredientList.removeChild(newIngredientCard);
            };

            newIngredientCard.appendChild(inputField);
            newIngredientCard.appendChild(removeButton);
            ingredientList.appendChild(newIngredientCard);
        }

        // 조리법 단계 추가
    function addStepField() {
    const stepList = document.getElementById('stepList');
    const newStepCard = document.createElement('div');
    newStepCard.classList.add('step-card');

    const textareaField = document.createElement('textarea');
    textareaField.placeholder = '단계별 내용을 입력하세요';
    textareaField.name = 'cookingStep[]';
    textareaField.required = true;

    const imageLabel = document.createElement('label');
    imageLabel.textContent = '이미지 첨부';
    imageLabel.classList.add('step-image-label');
    
    const imageUpload = document.createElement('div');
    imageUpload.classList.add('image-upload');
    const imageField = document.createElement('input');
    imageField.type = 'file';
    imageField.name = 'stepImage[]';
    imageField.accept = 'image/*';
    imageUpload.appendChild(imageField);
	
    const removeButton = document.createElement('button');
    removeButton.type = 'button';
    removeButton.textContent = '삭제';
    removeButton.style.marginTop = '10px';
    removeButton.onclick = function() {
        stepList.removeChild(newStepCard);
    };


    // Step Card에 내용 추가
    newStepCard.appendChild(textareaField);
    

    // 이미지 첨부 관련 내용은 새 div로 감싸서 아래로 이동
    const imageContainer = document.createElement('div');
    imageContainer.appendChild(imageLabel);   // 이미지 첨부 라벨 추가
    imageContainer.appendChild(imageUpload);  // 이미지 첨부 input 추가
   
	
    newStepCard.appendChild(imageContainer); // 이미지 첨부 영역 추가
    newStepCard.appendChild(removeButton); // 삭제 버튼 추가
    // 최종적으로 추가된 Step Card를 stepList에 추가
    stepList.appendChild(newStepCard);
}


    </script>
</body>
</html>
