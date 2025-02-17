package com.spring.FoodMate.order.controller;

import org.springframework.web.bind.annotation.RestController;



@RestController
public class PaymentController {
//	private final Dotenv dotenv = Dotenv.load();
	
//	private final String API_KEY = dotenv.get("PORTONE_API_KEY");  //  포트원 REST API 키
//    private final String API_SECRET = dotenv.get("PORTONE_API_SECRET");  //  포트원 REST API 시크릿 키
//    private IamportClient iamportClient = new IamportClient(API_KEY, API_SECRET);
	
//    @RequestMapping(value="/order/verify/*")
//    public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid) throws IamportResponseException, IOException {
//        System.out.println(API_KEY);
//        System.out.println(API_SECRET);
//        System.out.println(iamportClient.getAuth().getCode());
//    	return iamportClient.paymentByImpUid("imp_124580296817");
//    }
    
    
	// 액세스 토큰 발급 메서드
//  private String getAccessToken() {
//      String apiUrl = "https://api.iamport.kr/users/getToken";
//
//      // 요청 데이터(JSON)
//      Map<String, String> requestData = new HashMap<>();
//      requestData.put("imp_key", API_KEY);
//      requestData.put("imp_secret", API_SECRET);
//
//      // HTTP 요청 헤더 설정
//      HttpHeaders headers = new HttpHeaders();
//      headers.setContentType(MediaType.APPLICATION_JSON);
//
//      HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(requestData, headers);
//      RestTemplate restTemplate = new RestTemplate();
//
//      // API 요청 실행
//      ResponseEntity<Map> response = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, Map.class);
//      Map<String, Object> responseBody = response.getBody();
//
//      if (responseBody != null && responseBody.get("response") != null) {
//          Map<String, Object> tokenData = (Map<String, Object>) responseBody.get("response");
//          return (String) tokenData.get("access_token"); // ✅ 액세스 토큰 반환
//      }
//      return null; // 토큰 발급 실패
//  }
//  public ResponseEntity<Map<String, Object>> verifyPayment(@RequestBody Map<String, String> requestData) {
//      String impUid = requestData.get("imp_uid"); // ✅ 포트원 거래 고유번호
//      String merchantUid = requestData.get("merchant_uid"); // ✅ 주문번호
//      String apiUrl = "https://api.iamport.kr/payments/" + impUid;
//
//      // ✅ 1. 액세스 토큰 발급 (API_SECRET 사용)
//      String accessToken = getAccessToken();
//      if (accessToken == null) {
//          Map<String, Object> errorResponse = new HashMap<>();
//          errorResponse.put("success", false);
//          errorResponse.put("message", "포트원 API 토큰 발급 실패");
//          return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(errorResponse);
//      }
//
//      // ✅ 2. HTTP 요청을 위한 헤더 설정
//      HttpHeaders headers = new HttpHeaders();
//      headers.set("Authorization", "Bearer " + accessToken); // ✅ 발급받은 토큰 사용
//      headers.setContentType(MediaType.APPLICATION_JSON);
//
//      HttpEntity<String> entity = new HttpEntity<>(headers);
//      RestTemplate restTemplate = new RestTemplate();
//
//      // ✅ 3. 포트원 API 호출하여 결제 정보 조회
//      ResponseEntity<Map> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, Map.class);
//      Map<String, Object> responseBody = response.getBody();
//
//      Map<String, Object> result = new HashMap<>();
//
//      if (responseBody != null && responseBody.get("response") != null) {
//          Map<String, Object> paymentData = (Map<String, Object>) responseBody.get("response");
//          int amount = (int) paymentData.get("amount"); // ✅ 결제 금액 확인
//          String status = (String) paymentData.get("status"); // ✅ 결제 상태 확인
//
//          if ("paid".equals(status)) {
//              result.put("success", true);
//              result.put("message", "결제 성공!");
//          } else {
//              result.put("success", false);
//              result.put("message", "결제 실패! 상태: " + status);
//          }
//      } else {
//          result.put("success", false);
//          result.put("message", "결제 검증 실패. 관리자에게 문의하세요.");
//      }
//
//      return ResponseEntity.ok(result);
//  }
}
