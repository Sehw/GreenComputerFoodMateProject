package com.spring.FoodMate.member.controller;


import java.io.File;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.SessionDTO;
import com.spring.FoodMate.common.UtilMethod;
import com.spring.FoodMate.member.dto.BuyerDTO;
import com.spring.FoodMate.member.dto.SellerDTO;
import com.spring.FoodMate.member.service.MemberService;
import com.spring.FoodMate.mypage.dto.ProfileDTO;
import com.spring.FoodMate.mypage.service.ProfileService;

import io.github.cdimascio.dotenv.Dotenv;


@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProfileService profileService;
	@Autowired
	private BuyerDTO buyerDTO;
	@Autowired
	private SellerDTO sellerDTO;
	@Autowired
	private SocialLoginController sociallogincontroller; 

	private final Dotenv dotenv = Dotenv.load();
	
	private final String KAKAO_API_KEY = dotenv.get("KAKAO_REST_API");  //  카카오 REST API 키
	
	@RequestMapping(value="/member/loginForm", method=RequestMethod.GET)
	private ModelAndView Loginform(@RequestParam(value="result", required=false) String result, @RequestParam(value="action",required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = UtilMethod.getViewName(request);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("common/layout");
		mav.addObject("smallHeader", true);
		mav.addObject("smallFooter", true);
		mav.addObject("kakao_API_key", KAKAO_API_KEY);
		mav.addObject("title", "푸드 메이트");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		return mav;
	}
	
	@RequestMapping(value="/member/*Form", method=RequestMethod.GET)
	private ModelAndView form(@RequestParam(value="result", required=false) String result, @RequestParam(value="action",required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = UtilMethod.getViewName(request);
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
		buyerDTO=memberService.login(loginMap);
		if(buyerDTO!= null && buyerDTO.getByr_id()!=null){
//			if(memberVO.getDel_yn().equals("Y")) {
//				String message="회원 탈퇴가 진행중인 아이디입니다.\\n관리자에게 문의해 주세요.\\nEmail : hong@gil.dong";
//				mav.addObject("message", message);
//				mav.setViewName("/member/loginForm");
//			} else {
				HttpSession session=request.getSession();
				session=request.getSession();
				
				SessionDTO sessionDTO = new SessionDTO();
				sessionDTO.setUserId(buyerDTO.getByr_id());
				sessionDTO.setUserRole("buyer");
				session.setAttribute("sessionDTO", sessionDTO);
				
				session.setAttribute("isBuyerLogOn", true);
				session.setAttribute("buyerInfo", buyerDTO);
				
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
	
	@RequestMapping(value="/login/kakao" ,method = RequestMethod.GET)
	public ResponseEntity kakaologin(@RequestParam String code,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String accessToken = sociallogincontroller.getKakaoAccessToken(code, request);
		Map<String, Object> userInfo = sociallogincontroller.getKakaoUserInfo(accessToken);
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		Map<String, String> loginMap = new HashMap<>();
		// byr_id와 password 저장
        loginMap.put("byr_id", (String)userInfo.get("id"));
        loginMap.put("password", "sociallogin");
        
		buyerDTO=memberService.login(loginMap);
		if(buyerDTO!= null && buyerDTO.getByr_id()!=null){
//			if(memberVO.getDel_yn().equals("Y")) {
//				String message="회원 탈퇴가 진행중인 아이디입니다.\\n관리자에게 문의해 주세요.\\nEmail : hong@gil.dong";
//				mav.addObject("message", message);
//				mav.setViewName("/member/loginForm");
//			} else {
				HttpSession session=request.getSession();
				session=request.getSession();
				session.setAttribute("isBuyerLogOn", true);
				session.setAttribute("buyerInfo", buyerDTO);
				
				message  = "<script>";
			    message += " location.href='"+request.getContextPath()+"/main';";
			    message += " </script>";
//			}
			
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("byr_id", (String)userInfo.get("id"));
			session.setAttribute("password", "sociallogin");
			session.setAttribute("nickname", (String)userInfo.get("nickname"));
			session.setAttribute("profile_image", (String)userInfo.get("profile_link"));
		    message  = "<script>";
		    message +=" alert('가입된 아이디가 아닙니다. 회원가입 창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/signUpSocialForm';";
		    message += " </script>";
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/member/loginslr" ,method = RequestMethod.POST)
	public ResponseEntity loginslr(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		sellerDTO=memberService.loginslr(loginMap);
		if(sellerDTO!= null && sellerDTO.getSlr_id()!=null){
			
//			if(memberVO.getDel_yn().equals("Y")) {
//				String message="회원 탈퇴가 진행중인 아이디입니다.\\n관리자에게 문의해 주세요.\\nEmail : hong@gil.dong";
//				mav.addObject("message", message);
//				mav.setViewName("/member/loginForm");
//			} else {
				HttpSession session=request.getSession();
				session=request.getSession();
				session.setAttribute("isSellerLogOn", true);
				session.setAttribute("sellerInfo",sellerDTO);
				
				SessionDTO sessionDTO = new SessionDTO();
				sessionDTO.setUserId(sellerDTO.getSlr_id());
				sessionDTO.setUserRole("seller");
				session.setAttribute("sessionDTO", sessionDTO);
				
				
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
	
	@RequestMapping(value="/member/overlappedseller.do" ,method = RequestMethod.POST)
	public ResponseEntity sellerIDoverlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.sellerIDoverlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/member/addBuyer" ,method = RequestMethod.POST)
	public ResponseEntity addBuyer(@ModelAttribute("buyerDTO") BuyerDTO _buyerDTO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
            String baseDir = "src/main/resources/images/users/";
            String byrid = _buyerDTO.getByr_id();
            String uploadDir = baseDir + byrid;
            
            File uploadPath = new File(uploadDir);
            if (!uploadPath.exists()) {
                uploadPath.mkdirs();
            }
            memberService.addBuyer(_buyerDTO);
            profileService.addNewBuyerProfile(byrid);
		    
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
	
	@RequestMapping(value="/member/addSocialBuyer" ,method = RequestMethod.POST)
	public ResponseEntity addSocialBuyer(@ModelAttribute("buyerDTO") BuyerDTO _buyerDTO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
	            String baseDir = "C:/FoodMate/users/";
	            
	            String userId = _buyerDTO.getByr_id();
	            String uploadDir = baseDir + userId;
	            
	            File uploadPath = new File(uploadDir);
	            if (!uploadPath.exists()) {
	                uploadPath.mkdirs();
	            }
		    memberService.addBuyer(_buyerDTO);
		    
		    message  = "<script>";
		    message +=" alert('회원 가입을 마쳤습니다. 로그인창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
		    message += " location.href='"+request.getContextPath()+"/member/signUpSocialForm';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/member/addSeller" ,method = RequestMethod.POST)
	public ResponseEntity addSeller(@ModelAttribute("sellerDTO") SellerDTO _sellerDTO,
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
		    memberService.addSeller(_sellerDTO);
		    
		    message  = "<script>";
		    message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
		    message += " location.href='"+request.getContextPath()+"/member/signUpSellerForm';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/member/byrIdFind", method=RequestMethod.POST)
	public ModelAndView byrIdFind(@ModelAttribute("buyerVO") BuyerDTO _buyerVO,
	                              HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    
	    ModelAndView mav = new ModelAndView();
	    String foundId = null;

	    try {
	        // 아이디 찾기 로직 (예: memberService.findBuyerId 메서드 호출)
	        foundId = memberService.findBuyerId(_buyerVO);
	        
	        if (foundId != null && !foundId.isEmpty()) {
	            mav.setViewName("common/layout");  // 공통 레이아웃 적용
	            mav.addObject("body", "/WEB-INF/views/member/idFindResultForm.jsp"); // 실제 페이지 경로
	            mav.addObject("name", _buyerVO.getName());
	            mav.addObject("foundId", foundId); // 찾은 아이디를 뷰로 전달
	    		mav.addObject("smallHeader", true);
	    		mav.addObject("smallFooter", true);
	    		mav.addObject("title", "푸드 메이트");
	        } else {
	            // 아이디를 찾지 못했을 경우 메시지 처리
	            mav.setViewName("redirect:/member/buyeridFindForm?error=notfound");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        mav.setViewName("redirect:/member/buyeridFindForm?error=exception");
	    }

	    return mav;
	}
	
	@RequestMapping(value="/member/slrIdFind", method=RequestMethod.POST)
	public ModelAndView slrIdFind(@ModelAttribute("sellerVO") SellerDTO _sellerVO,
	                              HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    
	    ModelAndView mav = new ModelAndView();
	    String foundId = null;

	    try {
	        // 아이디 찾기 로직 (예: memberService.findBuyerId 메서드 호출)
	        foundId = memberService.findSellerId(_sellerVO);
	        
	        if (foundId != null && !foundId.isEmpty()) {
	            mav.setViewName("common/layout");  // 공통 레이아웃 적용
	            mav.addObject("body", "/WEB-INF/views/member/idFindResultForm.jsp"); // 실제 페이지 경로
	            mav.addObject("name", _sellerVO.getName());
	            mav.addObject("foundId", foundId); // 찾은 아이디를 뷰로 전달
	    		mav.addObject("smallHeader", true);
	    		mav.addObject("smallFooter", true);
	    		mav.addObject("title", "푸드 메이트");
	        } else {
	            // 아이디를 찾지 못했을 경우 메시지 처리
	            mav.setViewName("redirect:/member/selleridFindForm?error=notfound");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        mav.setViewName("redirect:/member/selleridFindForm?error=exception");
	    }

	    return mav;
	}
	
	@RequestMapping(value="/member/ByrPasswordFind", method=RequestMethod.POST)
	public ModelAndView ByrPasswordFind(@ModelAttribute("buyerVO") BuyerDTO _buyerVO,
	                              HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    
	    ModelAndView mav = new ModelAndView();
	    String foundInfo = null;

	    try {
	        // 아이디 찾기 로직 (예: memberService.findBuyerId 메서드 호출)
	    	foundInfo = memberService.findBuyerId(_buyerVO);
	        
	        if (foundInfo != null && !foundInfo.isEmpty()) {
	        	HttpSession session = request.getSession();
	        	session.setAttribute("byr_id", _buyerVO.getByr_id());
	            session.setAttribute("name", _buyerVO.getName());
	            session.setAttribute("email", _buyerVO.getEmail());
	            
	            mav.setViewName("common/layout");  // 공통 레이아웃 적용
	            mav.addObject("body", "/WEB-INF/views/member/buyerpasswdResetForm.jsp"); // 실제 페이지 경로
	    		mav.addObject("smallHeader", true);
	    		mav.addObject("smallFooter", true);
	    		mav.addObject("title", "푸드 메이트");
	        } else {
	            // 패스워드 리셋정보를 찾지 못했을 경우 메시지 처리
	        	mav.setViewName("redirect:/member/buyerpasswdFindForm?error=notfound");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        mav.setViewName("redirect:/member/buyerpasswdFindForm?error=exception");
	    }

	    return mav;
	}
	
	@RequestMapping(value="/member/SlrPasswordFind", method=RequestMethod.POST)
	public ModelAndView ByrPasswordFind(@ModelAttribute("sellerVO") SellerDTO _sellerVO,
	                              HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    
	    ModelAndView mav = new ModelAndView();
	    String foundInfo = null;

	    try {
	        // 아이디 찾기 로직 (예: memberService.findBuyerId 메서드 호출)
	    	foundInfo = memberService.findSellerId(_sellerVO);
	        
	        if (foundInfo != null && !foundInfo.isEmpty()) {
	        	HttpSession session = request.getSession();
	        	session.setAttribute("slr_id", _sellerVO.getSlr_id());
	            session.setAttribute("name", _sellerVO.getName());
	            session.setAttribute("email", _sellerVO.getEmail());
	            
	            mav.setViewName("common/layout");  // 공통 레이아웃 적용
	            mav.addObject("body", "/WEB-INF/views/member/sellerpasswdResetForm.jsp"); // 실제 페이지 경로
	    		mav.addObject("smallHeader", true);
	    		mav.addObject("smallFooter", true);
	    		mav.addObject("title", "푸드 메이트");
	        } else {
	            // 패스워드 리셋정보를 찾지 못했을 경우 메시지 처리
	        	mav.setViewName("redirect:/member/sellerpasswdFindForm?error=notfound");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        mav.setViewName("redirect:/member/sellerpasswdFindForm?error=exception");
	    }

	    return mav;
	}
	
	@RequestMapping(value="/member/buyerPasswordReset" ,method = RequestMethod.POST)
	public ResponseEntity buyerPasswordReset(@ModelAttribute("buyerVO") BuyerDTO _buyerVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			HttpSession session = request.getSession();
			
			_buyerVO.setByr_id((String)session.getAttribute("byr_id"));
			_buyerVO.setName((String)session.getAttribute("name"));
			_buyerVO.setEmail((String)session.getAttribute("email"));
		    memberService.resetBuyerPW(_buyerVO);
		    
		    
		    message  = "<script>";
		    message +=" alert('정상적으로 비밀번호가 변경되었습니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm';";
		    message += " </script>";
		    session.invalidate();
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
		    message += " location.href='"+request.getContextPath()+"/member/ByrPasswordFind';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/member/sellerPasswordReset" ,method = RequestMethod.POST)
	public ResponseEntity sellerPasswordReset(@ModelAttribute("sellerVO") SellerDTO _sellerVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			HttpSession session = request.getSession();
			
			_sellerVO.setSlr_id((String)session.getAttribute("slr_id"));
			_sellerVO.setName((String)session.getAttribute("name"));
			_sellerVO.setEmail((String)session.getAttribute("email"));
		    memberService.resetSellerPW(_sellerVO);
		    
		    message  = "<script>";
		    message +=" alert('정상적으로 비밀번호가 변경되었습니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm';";
		    message += " </script>";
		    session.invalidate();
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
		    message += " location.href='"+request.getContextPath()+"/member/sellerPasswordReset';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

}
