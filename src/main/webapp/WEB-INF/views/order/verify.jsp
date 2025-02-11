<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.*, java.util.*"%>
<%
    String imp_uid = request.getParameter("imp_uid"); // 포트원 거래 고유번호
    String merchant_uid = request.getParameter("merchant_uid"); // 주문번호

    if (imp_uid != null) {
        // 서버에서 포트원 API를 호출하여 결제 검증
        String apiKey = "YOUR_API_KEY"; // 포트원 REST API 키
        String apiSecret = "YOUR_API_SECRET"; // 포트원 REST API 시크릿 키
        String apiUrl = "https://api.iamport.kr/payments/" + imp_uid;

        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + apiKey);
        conn.setRequestProperty("Content-Type", "application/json");

        int responseCode = conn.getResponseCode();
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        String inputLine;
        StringBuffer response2 = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            response2.append(inputLine);
        }
        br.close();

        // 결제 검증 결과 출력
%>
        <h2>결제 검증 완료</h2>
        <p>결제 결과: <%= response.toString() %></p>
<%
    } else {
%>
        <h2>결제 실패</h2>
        <p>결제 정보가 올바르지 않습니다.</p>
<%
    }
%>
