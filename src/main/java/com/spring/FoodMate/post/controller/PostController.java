package com.spring.FoodMate.post.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.post.service.PostService;
import com.spring.FoodMate.post.vo.postVO;

@Controller("postController")
public class PostController {
	
	@Autowired
	private PostService postService;
	@Autowired
	private postVO postVO;
	
	@RequestMapping(value= "/postfind/postForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView postForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value= "/postfind/postForm2.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView postForm2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/postfind/postFind1.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView postFind1(@RequestParam("doro") String doro, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		postVO = postService.selectDoro(doro);
		mav.addObject("post", postVO);
		return mav;
	}
	
	@RequestMapping(value="/postfind/postFind2.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView postFind2(@RequestParam("dong") String dong, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		postVO = postService.selectdong(dong);
		mav.addObject("post", postVO);
		return mav;
	}
	


}
