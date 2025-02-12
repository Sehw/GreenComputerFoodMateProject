package com.spring.FoodMate.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import io.github.cdimascio.dotenv.Dotenv;

@Controller
public class SocialLoginController {
	private static final Logger logger = LoggerFactory.getLogger(SocialLoginController.class);
	
	private final Dotenv dotenv = Dotenv.load();
	
	private final String KAKAO_API_KEY = dotenv.get("KAKAO_REST_API");  //  카카오 REST API 키
	
	public String getKakaoAccessToken(String code) {
	    String accessToken = "";
	    String refreshToken = "";
	    String reqUrl = "https://kauth.kakao.com/oauth/token";

	    try{
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        //필수 헤더 세팅
	        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	        conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.

	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        StringBuilder sb = new StringBuilder();
	        
	        //필수 쿼리 파라미터 세팅
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=").append(KAKAO_API_KEY);
	        sb.append("&redirect_uri=").append("http://localhost:8090/FoodMate/login/kakao");
	        sb.append("&code=").append(code);

	        bw.write(sb.toString());
	        bw.flush();

	        int responseCode = conn.getResponseCode();

	        BufferedReader br;
	        if (responseCode >= 200 && responseCode < 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }

	        String line = "";
	        StringBuilder responseSb = new StringBuilder();
	        while((line = br.readLine()) != null){
	            responseSb.append(line);
	        }
	        String result = responseSb.toString();
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        accessToken = element.getAsJsonObject().get("access_token").getAsString();
	        refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

	        br.close();
	        bw.close();
	    }catch (Exception e){
	        e.printStackTrace();
	    }
	    return accessToken;
	}
	
	public HashMap<String, Object> getKakaoUserInfo(String accessToken) {
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqUrl = "https://kapi.kakao.com/v2/user/me";
	    try{
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

	        int responseCode = conn.getResponseCode();

	        BufferedReader br;
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }

	        String line = "";
	        StringBuilder responseSb = new StringBuilder();
	        while((line = br.readLine()) != null){
	            responseSb.append(line);
	        }
	        String result = responseSb.toString();

	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);

	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject Jsonid = element.getAsJsonObject();
	        
	        String id = Jsonid.getAsJsonObject().get("id").getAsString();
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String profile_link =  properties.getAsJsonObject().get("profile_image").getAsString();
	        
	        userInfo.put("id", id);
	        userInfo.put("nickname", nickname);
	        userInfo.put("profile_image", profile_link);

	        br.close();

	    }catch (Exception e){
	        e.printStackTrace();
	    }
	    return userInfo;
	}
}
