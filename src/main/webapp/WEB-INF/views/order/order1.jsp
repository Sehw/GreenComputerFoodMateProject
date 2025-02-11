<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 및 결제</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Arial', sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            text-align: center;
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 1.8rem;
            color: #f39c12;
            border-bottom: 2px solid #f39c12;
            padding-bottom: 5px;
            margin-bottom: 30px;
            text-align: left;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 1.1rem;
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 10px;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border-radius: 6px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #f39c12;
            outline: none;
        }

        .order-detail, .delivery-info, .orderer-info {
            margin-bottom: 40px;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .order-detail table {
            width: 100%;
            border-collapse: collapse;
        }

        .order-detail th, .order-detail td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .order-detail th {
            background-color: #f1f1f1;
        }

        .order-detail img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        .order-detail .product-info {
            padding-left: 20px;
        }

        .orderer-info input, .delivery-info input {
            margin-bottom: 10px;
        }

        .button-container {
            text-align: center;
            margin-top: 30px;
        }

        .submit-btn {
            width: 100%;
            background-color: #f39c12;
            color: white;
            padding: 15px;
            font-size: 1.1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #e67e22;
        }
        
        /* 우편번호와 버튼을 가로로 배치 */
		.zipcode-container {
		    display: flex;
		    align-items: center;
		    gap: 10px;
		}
		
		.zipcode-input {
		    width:35%;
		    padding: 12px;
		    font-size: 1rem;
		    border-radius: 6px;
		    border: 1px solid #ddd;
		    box-sizing: border-box;
		}
		
		.zipcode-btn {
		    padding: 12px 20px;
		    background-color: #f39c12;
		    color: white;
		    border-radius: 6px;
		    border: none;
		    cursor: pointer;
		    font-size: 1rem;
		    transition: background-color 0.3s ease;
		}
		
		.zipcode-btn:hover {
		    background-color: #e67e22;
		}
        
        .address-input {
		    margin-top: 10px;
		    padding: 12px;
		    font-size: 1rem;
		    border-radius: 6px;
		    border: 1px solid #ddd;
		    box-sizing: border-box;
		}
        /* 결제 정보 박스 */
		.payment-info-container {
		    background-color: #f9f9f9;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
		    margin-bottom: 30px;
		}
		
		/* 결제 정보 항목 */
		.payment-info {
		    display: flex;
		    flex-direction: column;
		    gap: 15px;
		}
		
		/* 결제 항목 */
		.payment-detail {
		    display: flex;
		    justify-content: space-between;
		    font-size: 1.1rem;
		    color: #333;
		}
		
		/* 최종 결제 금액 강조 */
		.payment-detail.total p {
		    font-weight: bold;
		    font-size: 1.2rem;
		    color: #f39c12; /* 강조 색상 */
		}
		
		/* 결제 정보 제목 */
		.payment-info-container .section-title {
		    font-size: 1.8rem;
		    color: #f39c12;
		    border-bottom: 2px solid #f39c12;
		    padding-bottom: 5px;
		    margin-bottom: 20px;
		    text-align: left;
		}
		
		/* 결제 항목 가격 스타일 */
		.payment-detail p.price, .payment-detail .total-price {
		    font-size: 1.2rem;
		    color: #333;
		}

        /* 결제 수단을 감싸는 박스 */
		.payment-methods-container {
		    background-color: #f9f9f9;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
		    margin-bottom: 30px;
		}
		
		/* 결제 수단 항목 */
		.payment-methods {
		    display: flex;
		    gap: 20px;
		}
		
		/* 각 결제 수단 카드 */
		.payment-methods .method {
		    background-color: white;
		    padding: 20px;
		    border-radius: 8px;
		    border: 1px solid #ddd;
		    text-align: center;
		    width: 20%;
		    transition: box-shadow 0.3s ease;
		}
		
		/* 결제 수단 카드 hover 효과 */
		.payment-methods .method:hover {
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		}
		
		/* 클릭 시 선택된 상태 */
		.payment-methods .method.selected {
		    background-color: #f39c12;  
		    border-color: #e67e22;  
		    color: white;             
		}
		
		/* 결제 수단 이미지 */
		.payment-methods .method img {
		    width: 50px;
		    height: 50px;
		    margin-bottom: 10px;
		}
		
		/* 결제 수단 텍스트 */
		.payment-methods .method p {
		    font-size: 1.2rem;
		    font-weight:800;
		    margin-top: 5px;
		    color: #333;
		}
		
		/* 결제 수단 제목 */
		.section-title {
		    font-size: 1.8rem;
		    color: #f39c12;
		    border-bottom: 2px solid #f39c12;
		    padding-bottom: 5px;
		    margin-bottom: 20px;
		    text-align: left;  /* 제목 왼쪽 정렬 */
		}
		        
        #font {
         	font-weight: 800;
        }
    </style>
</head>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<body>
    <div class="container">
        <!-- 주문 및 결제 -->
        <h1 id="font">상품 주문 및 결제</h1>
        <br>
        <br>

        <!-- 주문 상세 내역 -->
        <div class="order-detail">
            <h2 class="section-title">주문 상세 내역</h2>
            <table>
                <thead>
                    <tr>
                        <th>상품 정보</th>
                        <th>수량</th>
                        <th>금액</th>
                        <th>포인트 차감</th>
                        <th>배송비</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="product-info">
                            <img src="${pageContext.request.contextPath}/resources/images/order_p_image1.PNG" alt="상품 이미지">
                            <div><strong>상품명</strong>: 와규 냉동 삼각살</div>
                            <div><strong>옵션</strong>: 냉동 와규 삼각살 200g</div>
                        </td>
                        <td>2</td>
                        <td>22,500</td>
                        <td>-1,000p</td>
                        <td>기본 3,500원</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 배송지 정보 -->
        <div class="delivery-info">
            <h2 class="section-title">배송지 정보</h2>
            <div class="form-group">
                <label for="delivery-confirm">배송지 확인</label>
                <select id="delivery-confirm">
                    <option value="same">주문자 정보와 동일</option>
                    <option value="custom">직접 입력</option>
                </select>
            </div>

            <div class="form-group">
                <label for="recipient-name">받으실 분</label>
                <input type="text" id="recipient-name" placeholder="받으실 분의 이름">
            </div>

            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" id="phone" placeholder="전화번호 입력">
            </div>

			<div class="form-group">
			    <label for="address">받으실 곳</label>
			    <div class="zipcode-container">
			        <input type="text" id="zipcode" placeholder="우편번호" class="zipcode-input">
			        <button type="button" class="zipcode-btn">우편번호 검색</button>
			    </div>
			    <input type="text" id="address" placeholder="상세주소를 입력하세요" class="address-input">
			</div>
			
            <div class="form-group">
                <label for="delivery-requests">배송 요청 사항</label>
                <textarea id="delivery-requests" placeholder="배송에 대한 요청 사항을 입력하세요"></textarea>
            </div>
        </div>

        <!-- 주문자 정보 -->
        <div class="orderer-info">
            <h2 class="section-title">주문자 정보</h2> 
            <div class="form-group">
                <label for="orderer-name">주문하시는 분</label>
                <input type="text" id="orderer-name" placeholder="주문자 이름">
            </div>

            <div class="form-group">
                <label for="orderer-phone">전화번호</label>
                <input type="text" id="orderer-phone" placeholder="전화번호">
            </div>

            <div class="form-group">
                <label for="orderer-mobile">휴대폰 번호</label>
                <input type="text" id="orderer-mobile" placeholder="휴대폰 번호">
            </div>

            <div class="form-group">
                <label for="orderer-email">이메일</label>
                <input type="email" id="orderer-email" placeholder="이메일">
            </div>
        </div>
        
        <!-- 결제 정보  -->
		<div class="payment-info-container">
		    <h2 class="section-title">결제 정보</h2>
		    <div class="payment-info">
		    	<div class="payment-detail">
		            <label>상품 금액</label>
		            <p class="price">₩ 22,500</p>
		        </div>
		        <div class="payment-detail">
		            <label>상품 수량</label>
		            <p class="price">2개</p>
		        </div>
		        <div class="payment-detail">
		            <label>상품 합계 금액</label>
		            <p class="price">₩ 45,000</p>
		        </div>
		       	<div class="payment-detail">
		            <label>포인트 할인</label>
		            <p class="price">-₩ 1,000</p>
		        </div>
		        <div class="payment-detail">
		            <label>배송비</label>
		            <p class="price">₩ 3,500</p>
		        </div>
		        <div class="payment-detail total">
		            <label>최종 결제 금액</label>
		            <p class="total-price">₩ 47,500</p>
		        </div>
		    </div>
		</div>

		 <!-- 결제 수단  -->
		<div class="payment-methods-container">
		    <h2 class="section-title">결제 수단</h2>
		    <div class="payment-methods">
		        <div class="method">
		            <img src="${pageContext.request.contextPath}/resources/images/credit_card.png" alt="신용카드">
		            <p>신용카드</p>
		        </div>
		        <div class="method">
		            <img src="${pageContext.request.contextPath}/resources/images/bank_transfer.png" alt="무통장입금">
		            <p>무통장입금</p>
		        </div>
		        <div class="method">
		            <img src="${pageContext.request.contextPath}/resources/images/account_transfer.png" alt="계좌이체">
		            <p>계좌이체</p>
		        </div>
		    </div>
		</div>
		<script>
				// 결제 수단 클릭 시 선택된 상태 추가/제거
		document.querySelectorAll('.payment-methods .method').forEach(function(method) {
		    method.addEventListener('click', function() {
		        // 모든 결제 수단에서 'selected' 클래스 제거
		        document.querySelectorAll('.payment-methods .method').forEach(function(m) {
		            m.classList.remove('selected');
		        });
		        // 클릭한 결제 수단에 'selected' 클래스 추가
		        method.classList.add('selected');
		    });
		});
		</script>

        <!-- 결제 버튼 -->
        <div class="button-container">
            <button type="submit" class="submit-btn" onclick="requestPay()">결제하기</button>
        </div>
        <script>
    function requestPay() {
        var IMP = window.IMP;
        IMP.init("----"); // ✅ 포트원에서 발급받은 가맹점 식별 코드 입력 (ex: imp12345678)

        IMP.request_pay({
            pg: "html5_inicis", // ✅ 결제 PG사 설정 (이니시스: "html5_inicis", 카카오페이: "kakaopay")
            pay_method: "card", // ✅ 결제 수단 (ex: "card", "trans", "vbank", "phone")
            merchant_uid: "order_" + new Date().getTime(), // ✅ 주문번호 (고유해야 함)
            name: "테스트 상품",
            amount: 1000, // ✅ 결제 금액 (숫자로 입력)
            buyer_email: "test@test.com",
            buyer_name: "테스터",
            buyer_tel: "01012345678",
            buyer_addr: "서울특별시 강남구",
            buyer_postcode: "12345"
        }, function (rsp) {
            if (rsp.success) {
                // ✅ 결제 성공 시, 서버에 결제 검증 요청
                location.href = "result.jsp?imp_uid=" + rsp.imp_uid + "&merchant_uid=" + rsp.merchant_uid;
            } else {
                // ❌ 결제 실패 시
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            }
        });
    }
    </script>
    </div>
</body>
</html>
