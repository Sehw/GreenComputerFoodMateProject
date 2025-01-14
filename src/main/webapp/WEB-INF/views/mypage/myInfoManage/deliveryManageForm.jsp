<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 관리</title>
<link href="<c:url value="/resources/css/tablepage.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/modal.css" />" rel="stylesheet">
<style>
		.table-custom {
		    border-top: 2px solid #b5b6b7 !important;
	 	 }
		/* 헤더 배경색 */
	    .table-header {
		  background-color: #f8f9fa;
	      text-align: center;
	      font-weight: bold;
	      min-width: 20%;
	    }
	    .table td:last-child {
		  min-width: 100px; /* 최소 너비 지정 */
		  text-align: center; /* 텍스트 중앙 정렬 */
		}
	    /* 내용 텍스트 정렬 */
	    .table tbody td {
	      vertical-align: middle;
	      text-align: center;
	    }
		.bodal_body{
			width:400px;
			height:600px;
		}
			table.table2 {
			    border-collapse: collapse;
			    width: 100%;
			    text-align: left;
			    line-height: 1.5;
			    margin: 20px 0;
			    border-top: 2px solid #333;
			    border-bottom: 2px solid #ccc;
			}
			
			table.table2 tr {
			    border-bottom: 1px solid #ccc;
			}
			
			table.table2 td {
			    padding: 10px;
			    vertical-align: middle;
			    font-size: 14px;
			}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", () => {
	    const modal = document.querySelector('.modal');
	    const btnOpenModal = document.querySelector('.btn-open-modal');
	    const btnCloseModal = document.querySelector('.btn-close-modal');
	
	    btnOpenModal.addEventListener("click", () => {
	        modal.style.display = "flex";
	    });
	    
	    btnCloseModal.addEventListener("click", () => {
	        modal.style.display = "none";
	    });
	});
	
	function execDaumPostcode() {
		  new daum.Postcode({
		    oncomplete: function(data) {
		      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
		      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		      var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
		      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		        extraRoadAddr += data.bname;
		      }
		      // 건물명이 있고, 공동주택일 경우 추가한다.
		      if(data.buildingName !== '' && data.apartment === 'Y'){
		        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		      }
		      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		      if(extraRoadAddr !== ''){
		        extraRoadAddr = ' (' + extraRoadAddr + ')';
		      }
		      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		      if(fullRoadAddr !== ''){
		        fullRoadAddr += extraRoadAddr;
		      }
	
		      // 우편번호와 주소 정보를 해당 필드에 넣는다.
		      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
		      document.getElementById('roadAddress').value = fullRoadAddr;
		     
		    }
		  }).open();
		}
	
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
      		<h5 class="mb-0 fw-bold">배송지 관리</h5>
    </div>
       <div class="text-end mb-1">
	  <a href="#" class="btn btn-dark btn-open-modal">+ 새 배송지 추가</a>
	</div>
    	<table class="table table-hover table-custom">
		<thead class="table-header table-secondary">
			<tr>
				<td>배송지이름</td>
				<td>받으실 분</td>
				<td>주소</td>
				<td>연락처</td>
				<td>수정/삭제</td>
			</tr>
		</thead>
      	<tbody>
      	<tr>
      	  <td>우리집</td>
          <td>홍길동</td>
          <td>(12345)<br>
          대전광역시 서구 오라클빌딩 3층 123
          </td>
          <td>전화번호 : <br>
          휴대폰 : 010-1234-5678
          </td>
          <td>
          <div class="d-flex flex-column gap-1">
		    	<button class="btn btn-outline-secondary btn-sm" disabled>수정</button>
		    	<button class="btn btn-outline-secondary btn-sm" disabled>삭제</button>
		  </div>
          </td>
        </tr>
		</tbody>
	</table>
	<nav aria-label="Page navigation">
	  <ul class="pagination justify-content-center">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">Prev</span>
	      </a>
	    </li>
	    <li class="page-item active" aria-current="page">
	      <a class="page-link" href="#">1</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item"><a class="page-link" href="#">4</a></li>
	    <li class="page-item"><a class="page-link" href="#">5</a></li>
	    <li class="page-item"><a class="page-link" href="#">6</a></li>
	    <li class="page-item"><a class="page-link" href="#">7</a></li>
	    <li class="page-item"><a class="page-link" href="#">8</a></li>
	    <li class="page-item"><a class="page-link" href="#">9</a></li>
	    <li class="page-item"><a class="page-link" href="#">10</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	<div class="modal">
		<div class="modal_body">
			<div class="container mt-1">
				<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
			      		<h5 class="mb-0 fw-bold">나의 배송지 관리</h5>
			    </div>
			  	<p class="mb-3">배송지 추가</p>
			  	<table class="table2">
					<tr>
				        <td>배송지 이름</td>
				        <td>
				        <input type="text" class="form-control" name="deliveryname" size="20">
				        </td>
				    </tr>
				    <tr>
				        <td>받으실분</td>
				        <td><input type="text" class="form-control" name="humanname" size="40"></td>
				    </tr>
				    <tr>
				        <td>받으실 곳</td>
				        <td>
							<div class="col-sm-6 mb-1">
				                   <div class="d-flex align-items-center">
				                        <input name="zipcode" id="zipcode" type="text" class="form-control me-2" placeholder="zipcode">
				                        <p class="mb-0"><a href="javascript:execDaumPostcode()">우편번호 찾기</a></p>
				                    	</div>
				                    </div>
				                    <div class="col-sm-9 mb-1">
				                        <input name="roadAddress" id="roadAddress" type="text" class="form-control" placeholder="roadAddress">
				                    </div>
				                    <div class="col-sm-9 mb-1">
				                        <input name="remainaddress" id="remainaddress" type="text" class="form-control" placeholder="address">
				                    </div>
				        </td>
				    </tr>
				    <tr>
				        <td>전화번호</td>
				        <td><input type="text" class="form-control" name="phone" size="40"></td>
				    </tr>
				    <tr>
				        <td>휴대폰번호</td>
				        <td><input type="text" class="form-control" name="iphone" size="40"></td>
				    </tr>
				</table>
				<div class="d-flex justify-content-center align-items-center form-check mb-1">
				  <input class="form-check-input me-2 mb-1" type="checkbox" value="" id="flexCheckDefault">
				  <label class="form-check-label" for="flexCheckDefault">
				    기본 배송지로 설정
				  </label>
				</div>
			  	<div class="d-flex justify-content-center gap-2">
			  		<button type="submit" class="btn btn-success">저장</button>
	                <button type="reset" class="btn btn-outline-secondary btn-close-modal">취소</button>
	            </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>