<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
	   .signUp-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }
</style>
<script>
	
	document.addEventListener('DOMContentLoaded', function () {
		function toggleCustomInput() {
		    const select = document.getElementById('mail2');
		    const customInput = document.getElementById('customMail');
		    
		    if (select.value === 'custom') {
		        customInput.style.display = 'block';
		        customInput.focus();
		    } else {
		        customInput.style.display = 'none';
		        customInput.value = ''; // 입력 필드 초기화
		    }
		}
		window.toggleCustomInput = toggleCustomInput;
		});
</script>
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">회원정보 수정</h5>
      		</div>
      		<div class="d-flex justify-content-start align-items-center">
				<div class="signUp-container">
				    <div class="row justify-content-start">
				        <div class="col-md-12">
				        	<form name="newMember" action="processAddMember.jsp" method="post" onsubmit="return prepareFormSubmission()">
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">아이디</label>
				                    <div class="col-sm-5">
				                        <input name="id" type="text" class="form-control" placeholder="id" disabled>
				                    </div>
				                </div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">비밀번호</label>
				                    <div class="col-sm-5">
				                        <input name="password" type="password" class="form-control" placeholder="password">
				                    </div>
				                </div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">비밀번호 확인</label>
				                    <div class="col-sm-5">
				                        <input name="password_confirm" type="password" class="form-control" placeholder="password confirm">
				                    </div>
				                </div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">성명</label>
				                    <div class="col-sm-5">
				                        <input name="name" type="text" class="form-control" placeholder="name">
				                    </div>
				                </div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">성별</label>
				                    <div class="col-sm-6 d-flex align-items-center">
				                        <input name="gender" type="radio" value="남" class="me-2"> 남
				                        <input name="gender" type="radio" value="여" class="ms-4 me-2"> 여
				                    </div>
				                </div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">생일</label>
				                    <div class="col-sm-7">
				                        <div class="row">
				                            <div class="col-sm-4">
				                                <input type="text" name="birthyy" maxlength="4" class="form-control" placeholder="년(4자)">
				                            </div>
				                            <div class="col-sm-4">
				                                <select name="birthmm" class="form-select">
				                                    <option value="">월</option>
				                                    <option value="01">1</option>
				                                    <option value="02">2</option>
				                                    <option value="03">3</option>
				                                    <option value="04">4</option>
				                                    <option value="05">5</option>
				                                    <option value="06">6</option>
				                                    <option value="07">7</option>
				                                    <option value="08">8</option>
				                                    <option value="09">9</option>
				                                    <option value="10">10</option>
				                                    <option value="11">11</option>
				                                    <option value="12">12</option>
				                                </select>
				                            </div>
				                            <div class="col-sm-3">
				                                <input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일">
				                            </div>
				                        </div>
				                    </div>
				                </div>
								<div class="mb-3 row">
								    <label class="col-sm-3 col-form-label text-end">이메일</label>
								    <div class="col-sm-8">
								        <div class="d-flex align-items-center">
								            <!-- 이메일 입력 -->
								            <input type="text" id="mail1" name="mail1" maxlength="50" class="form-control me-2" placeholder="email">
								            <div class="col-sm-1 d-flex justify-content-center align-items-center me-2" style="width: auto; padding: 0 5px;">
			            							<span>@</span>
			        						</div>
											<input type="text" name="mail2" maxlength="50" class="form-control" placeholder="email" >
								            
								            <!-- 직접 입력 필드 -->
								            <input type="text" name="customMail" id="customMail" class="form-control" placeholder="직접 입력" style="display:none; max-width: 200px;">
								        </div>
								    </div>
								</div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">전화번호</label>
				                    <div class="col-sm-5">
				                        <input name="phone" type="text" class="form-control" placeholder="phone">
				                    </div>
				                </div>
									<div class="mb-3 row">
									    <div class="col-12 text-center">
									        <input type="submit" class="btn btn-success" value="정보수정">
									        <input type="reset" class="btn btn-secondary" value="취소">
									    </div>
									</div>
				            </form>
			    		</div>
					</div>
				</div>
    		</div>
</div>
</body>
</html>