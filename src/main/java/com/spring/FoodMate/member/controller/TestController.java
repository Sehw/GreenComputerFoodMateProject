package com.spring.FoodMate.member.controller;

import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.FoodMate.member.vo.MemberVOTest;

@RestController
public class TestController {
	
	@RequestMapping(value="/test/member", method=RequestMethod.GET)
    public MemberVOTest getMember() {
        return new MemberVOTest("temp", "1234", "강규진", "puppy1900@naver.com");
    }
}
