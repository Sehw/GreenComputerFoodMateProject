package com.spring.FoodMate.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.UtilMethod;
import com.spring.FoodMate.member.dto.BuyerDTO;
import com.spring.FoodMate.mypage.dto.ProfileDTO;
import com.spring.FoodMate.mypage.service.MypageService;
import com.spring.FoodMate.mypage.service.ProfileService;
import com.spring.FoodMate.order.dto.OrderDTO;
import com.spring.FoodMate.recipe.service.RecipeService;


@Controller
public class ProfileController {
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	
	@Autowired
    private ProfileService profileService;
	
	@RequestMapping(value="/mypage/profileUpdate" ,method = RequestMethod.POST)
	public ResponseEntity profileUpdate(@ModelAttribute("ProfileDTO") ProfileDTO _profileDTO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		BuyerDTO buyerInfo = (BuyerDTO) session.getAttribute("buyerInfo"); // 세션에서 buyerInfo 가져오기
		String byr_id = null;

		if (buyerInfo != null) {
		    byr_id = buyerInfo.getByr_id(); // byr_id 값 추출
		    _profileDTO.setByr_id(byr_id);
		}
		try {
            String fileUrl = null;
            String uploadDir = "C:/FoodMate/users/";
            MultipartFile file = _profileDTO.getProfileImageInput();

            if (file != null && !file.isEmpty()) {
                // 새로운 이미지 저장
                Path userDir = Paths.get(uploadDir, byr_id);
                if (!Files.exists(userDir)) {
                    Files.createDirectories(userDir);
                }

                // 기존 이미지 삭제
                Files.walk(userDir).filter(Files::isRegularFile).forEach(f -> {
                    try { Files.delete(f); } catch (IOException ignored) {}
                });

                // 새 이미지 저장
                String fileName = "profile.jpg";
                Path filePath = userDir.resolve(fileName);
                file.transferTo(filePath.toFile());

                fileUrl = "/users/" + byr_id + "/" + fileName;
                _profileDTO.setImg_path(fileUrl);
            } else {
                // 기존 이미지 유지
            	ProfileDTO profileDTO = profileService.getBuyerProfile(byr_id);
                fileUrl = profileDTO.getImg_path();
                _profileDTO.setImg_path(fileUrl);
            }

            // DB 업데이트
            boolean updateSuccess = profileService.updateUserProfile(_profileDTO);

            if (updateSuccess) {
                return ResponseEntity.ok().body("{\"success\": true}");
            } else {
                return ResponseEntity.status(500).body("{\"success\": false}");
            }
        } catch (IOException e) {
            return ResponseEntity.status(500).body("{\"success\": false, \"error\": \"파일 저장 실패\"}");
        }
    }
	

	    
	    @RequestMapping("/users")
	    public ResponseEntity getProfileImage(@PathVariable String userId) {
	    	String uploadDir = "C:/FoodMate/users/";
	    	try {
	            Path imagePath = Paths.get(uploadDir, userId, "profile.jpg");
	            Resource resource = new UrlResource(imagePath.toUri());

	            if (!resource.exists() || !resource.isReadable()) {
	                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	            }

	            return ResponseEntity.ok()
	                    .header(HttpHeaders.CONTENT_TYPE, "image/jpeg")
	                    .body(resource);
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	        }
	    }
	        

}
