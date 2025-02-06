package com.spring.FoodMate.member.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.Util;
import com.spring.FoodMate.member.service.MemberService;
import com.spring.FoodMate.member.vo.BuyerVO;
import com.spring.FoodMate.mypage.service.ProfileService;
import com.spring.FoodMate.mypage.vo.ProfileVO;


@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProfileService profileService;
	@Autowired
	private BuyerVO memberVO;
	@Autowired
	private ProfileVO profileVO;

	@RequestMapping(value="/member/*Form", method=RequestMethod.GET)
	private ModelAndView form(@RequestParam(value="result", required=false) String result, @RequestParam(value="action",required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = Util.getViewName(request);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("common/layout");
		mav.addObject("smallHeader", true);
		mav.addObject("smallFooter", true);
		mav.addObject("title", "푸드 메이트");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		return mav;
	}
	
	@RequestMapping(value="/member/login" ,method = RequestMethod.POST)
	public ResponseEntity login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		memberVO=memberService.login(loginMap);
		if(memberVO!= null && memberVO.getByr_id()!=null){
			
//			if(memberVO.getDel_yn().equals("Y")) {
//				String message="회원 탈퇴가 진행중인 아이디입니다.\\n관리자에게 문의해 주세요.\\nEmail : hong@gil.dong";
//				mav.addObject("message", message);
//				mav.setViewName("/member/loginForm");
//			} else {
				HttpSession session=request.getSession();
				session=request.getSession();
				session.setAttribute("isBuyerLogOn", true);
				session.setAttribute("buyerInfo",memberVO);
				
				message  = "<script>";
			    message += " location.href='"+request.getContextPath()+"/main';";
			    message += " </script>";
//			}
			
		}else{
		    message  = "<script>";
		    message +=" alert('아이디나 비밀번호가 잘못되었습니다. 다시 로그인해주세요.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm';";
		    message += " </script>";
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/member/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception {
	    // 세션 삭제
	    HttpSession session = request.getSession(false);  // 이미 세션이 있으면 가져오기
	    if (session != null) {
	        session.invalidate();  // 세션 무효화
	    }
	    return "redirect:/main";  // 로그인 페이지로 리다이렉트
	}
	
	@RequestMapping(value="/member/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity buyIDoverlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.buyerIDoverlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/member/addBuyer" ,method = RequestMethod.POST)
	public ResponseEntity addBuyer(@ModelAttribute("memberVO") BuyerVO _memberVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
//			MultipartFile file = _memberVO.getProfileImage();
//			if (file != null && !file.isEmpty()) {
//	            String baseDir = "C:/FoodMate/users/";
//	            
//	            String userId = _memberVO.getMember_id();
//	            String uploadDir = baseDir + userId;
//	            
//	            File uploadPath = new File(uploadDir);
//	            if (!uploadPath.exists()) {
//	                uploadPath.mkdirs();
//	            }
//	            // 파일 저장
//	            file.transferTo(new File(uploadDir + file.getOriginalFilename()));
//	            _memberVO.setProfileImagePath(uploadDir + file.getOriginalFilename());
//	            System.out.println("프로필 이미지 업로드 완료: " + file.getOriginalFilename());
//	        }
		    memberService.addMember(_memberVO);
		    
		    message  = "<script>";
		    message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
		    message += " location.href='"+request.getContextPath()+"/member/signUpForm';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

}
