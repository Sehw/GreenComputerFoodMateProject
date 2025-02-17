<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<style>
	   .signUp-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        .name_icon_btn img {
		    width: 7em;
		    height: 7em;
		    border-radius: 50%;
		    border: 10px solid #e5edede1;
		    box-shadow: 2px 3px 5px 0px rgba(126, 125, 125, 0.8);
		}
		.d-flex.flex-column {
		    margin: 0 auto;
		    text-align: center; /* 중앙 정렬 */
		}
</style>
<script>
	document.addEventListener("DOMContentLoaded", function () {
		
		function prepareFormSubmission() {
	        let form = document.forms["profileEdit"];
	        let formData = new FormData(form);

	        // 파일 입력 필드 가져오기
	        let fileInput = document.getElementById('profileImageInput');
	        let selectedFile = fileInput.files[0];

	        // **이미지를 선택하지 않았을 경우**
	        if (!selectedFile) {
	            formData.delete("profileImageInput"); // 파일 데이터 제거
	        }

	        // **AJAX 요청으로 서버에 제출**
	        fetch(form.action, {
	            method: "POST",
	            body: formData
	        })
	        .then(response => response.json())
	        .then(data => {
	            if (data.success) {
	                alert("프로필이 성공적으로 업데이트되었습니다!");
	                location.reload(); // 페이지 새로고침
	            } else {
	                alert("업데이트 실패!");
	            }
	        })
	        .catch(error => {
	            console.error("오류 발생:", error);
	            alert("서버 오류 발생!");
	        });

	        return false; // 기본 폼 제출 방지
	    }
		
	    document.getElementById('profileImage').addEventListener('click', function () {
	        document.getElementById('profileImageInput').click();
	    });
	    
	 // 파일 선택 시 미리보기 변경
        document.getElementById('profileImageInput').addEventListener('change', function (event) {
            const file = event.target.files[0]; // 선택한 파일
            if (file) {
                selectedFile = file; // 전역 변수에 저장
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('profileImage').src = e.target.result; // 미리보기 변경
                };
                reader.readAsDataURL(file);
            }
        });
	});
</script>
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      <h5 class="mb-0 fw-bold">프로필 수정</h5>
    </div>
    	<form name="profileEdit" action="${contextPath}/mypage/profileUpdate" method="post" enctype="multipart/form-data" onsubmit="return prepareFormSubmission()">
	    	<div class="signUp-container">
				<div class="row justify-content-start">
					<div class="d-flex flex-column align-items-center mb-3">
					    <!-- 프로필 사진 -->
					    <div class="name_icon_btn mb-3">
					    	<input type="file" id="profileImageInput" name="profileImageInput" style="display: none;" accept="image/*">
					        <img id="profileImage" src="${profile.img_path}" alt="프로필 사진" />
					    </div>
					    <!-- 닉네임 입력 -->
					    <div class="text-center" style="width: 100%; max-width: 300px;">
					        <label class="form-label">닉네임</label>
					        <input name="nickname" type="text" class="form-control" placeholder="nickname" value="${profile.nickname}">
					    </div>
					    <div class="text-center mt-2" style="width: 100%; max-width: 300px;">
					        <label class="form-label">자기소개</label>
					        <textarea name="BIO" class="form-control" >${profile.BIO}</textarea>
					    </div>
					    <div class="mt-3 row">
							<div class="col-12 text-center">
								<input type="submit" class="btn btn-success" value="프로필수정">
								<input type="reset" class="btn btn-secondary" value="취소">
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
</div>
</body>
</html>