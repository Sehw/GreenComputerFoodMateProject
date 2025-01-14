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
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      <h5 class="mb-0 fw-bold">프로필 수정</h5>
    </div>
    	<div class="signUp-container">
			<div class="row justify-content-start">
				<div class="d-flex flex-column align-items-center mb-3">
				    <!-- 프로필 사진 -->
				    <div class="name_icon_btn mb-3">
				        <img src="${contextPath}/resources/images/profile_09.png" alt="프로필 사진" />
				    </div>
				    <!-- 닉네임 입력 -->
				    <div class="text-center" style="width: 100%; max-width: 300px;">
				        <label class="form-label">닉네임</label>
				        <input name="nickname" type="text" class="form-control" placeholder="nickname">
				    </div>
				    <div class="text-center mt-2" style="width: 100%; max-width: 300px;">
				        <label class="form-label">자기소개</label>
				        <textarea name="selfintro" class="form-control"></textarea>
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
</div>
</body>
</html>