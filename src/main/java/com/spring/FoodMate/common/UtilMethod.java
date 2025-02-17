package com.spring.FoodMate.common;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class UtilMethod {
	public static String getViewName(HttpServletRequest request) throws Exception{
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if(uri == null || uri.trim().equals("")) {
			uri=request.getRequestURI();
		}
		int begin = 0;
		if(!((contextPath==null) || ("".equals(contextPath))))
		{
			begin=contextPath.length();
		}
		int end;
		if(uri.indexOf(";")!= -1) {
			end = uri.indexOf(":");
		} else if(uri.indexOf("?")!= -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}
		
		String fileName = uri.substring(begin, end);
		if (fileName.indexOf(".")!= -1) {
			fileName = fileName.substring(0,fileName.lastIndexOf("."));
		}
		if (fileName.lastIndexOf("/")!=-1) {
			fileName = fileName.substring(fileName.lastIndexOf("/",1),fileName.length());
		}
		return fileName;
	}
	
	@RequestMapping(value="/deleteSession")
	public ResponseEntity<Void> deleteSession(HttpSession session) {
	    session.invalidate(); // 세션 삭제
	    return ResponseEntity.ok().build();
	}
	
	// 저장할 경로를 saveXXImage 메서드들에 뿌려줌
	// 배포할 때는 배포환경에 맞게 바꿔주면 됨
	private static String imagePath1 = "C:/Users/Administrator/git/GreenComputerFoodMateProject/src/main/webapp/resources/images";
	private static String imagePath2 = "C:/Users/confl/git/GreenComputerFoodMateProject/src/main/webapp/resources/images";
	
	public static String savePdtImage(HttpServletRequest request, MultipartFile file) throws Exception {
	    // 저장할 디렉토리 경로 설정
	    String uploadDir = imagePath1 + "/pdt";

	    File dir = new File(uploadDir);

	    // 디렉토리가 존재하지 않으면 생성
	    if (!dir.exists()) {
	        dir.mkdirs(); 
	    }

	    // 파일명 생성 (기존 파일명 유지)
	    String originalFilename = file.getOriginalFilename();
	    String filePath = uploadDir + File.separator + originalFilename;

	    // 파일이 이미 존재하는지 확인하여 중복 방지 처리
	    File dest = new File(filePath);
	    int count = 1;
	    while (dest.exists()) {
	        // 중복된 파일명이 있을 경우, 뒤에 'a', 'b', ... 를 붙여서 변경
	        String fileNameWithoutExtension = originalFilename.substring(0, originalFilename.lastIndexOf('.'));
	        String extension = originalFilename.substring(originalFilename.lastIndexOf('.'));
	        String newFileName = fileNameWithoutExtension + "_" + count + extension;
	        filePath = uploadDir + File.separator + newFileName;
	        dest = new File(filePath);
	        count++;
	    }

	    // 파일을 서버에 저장
	    file.transferTo(dest);

	    // 저장된 파일 경로 반환 (웹에서 접근할 수 있는 경로)
	    return "pdt/" + dest.getName();
	}
	
	public static String saveRecipeImage(MultipartFile file) throws Exception {
	    // 저장할 디렉토리 경로 설정
		String uploadDir = imagePath1 + "/recipe";

	    File dir = new File(uploadDir);
	    // 디렉토리가 존재하지 않으면 생성
	    if (!dir.exists()) {
	        dir.mkdirs(); 
	    }
	    // 파일명 생성 (기존 파일명 유지)
	    String originalFilename = file.getOriginalFilename();
	    String filePath = uploadDir + File.separator + originalFilename;

	    // 파일이 이미 존재하는지 확인하여 중복 방지 처리
	    File dest = new File(filePath);
	    int count = 1;
	    while (dest.exists()) {
	        // 중복된 파일명이 있을 경우, 뒤에 'a', 'b', ... 를 붙여서 변경
	        String fileNameWithoutExtension = originalFilename.substring(0, originalFilename.lastIndexOf('.'));
	        String extension = originalFilename.substring(originalFilename.lastIndexOf('.'));
	        String newFileName = fileNameWithoutExtension + "_" + count + extension;
	        filePath = uploadDir + File.separator + newFileName;
	        dest = new File(filePath);
	        count++;
	    }

	    // 파일을 서버에 저장
	    file.transferTo(dest);

	    // 저장된 파일 경로 반환 (웹에서 접근할 수 있는 경로)
	    return "recipe/" + dest.getName();
	}

}
